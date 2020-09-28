package com.example.HealthPaw;

import bolts.Continuation;
import bolts.Task;
import io.flutter.embedding.android.FlutterActivity;
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.ServiceConnection;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.os.IBinder;
import android.util.Log;

import com.mbientlab.metawear.Data;
import com.mbientlab.metawear.MetaWearBoard;
import com.mbientlab.metawear.Route;
import com.mbientlab.metawear.Subscriber;
import com.mbientlab.metawear.android.BtleService;
import com.mbientlab.metawear.builder.RouteBuilder;
import com.mbientlab.metawear.builder.RouteComponent;
import com.mbientlab.metawear.data.Acceleration;
import com.mbientlab.metawear.module.Accelerometer;
import com.mbientlab.metawear.module.Temperature;
import com.mbientlab.metawear.module.Temperature.SensorType;
import com.mbientlab.metawear.module.GyroBmi160;
import com.mbientlab.metawear.module.Led;
import com.mbientlab.metawear.module.Logging;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MainActivity extends FlutterActivity implements ServiceConnection {

  // RESULT VARIABLES
  private List<Map<String, Float>> accelResults = new ArrayList<>();
  private List<Map<String, Float>> gyroResults = new ArrayList<>();

  // METAWEAR VARIABLES
  private String MW_MAC_ADDRESS;
  private boolean isConnected = false;

  // METAWEAR CONSTANTS
  private static final String TAG = "MetaWear";
  private static final float ACC_RANGE = 8.f, ACC_FREQ = 50.f;
  private static final String CHANNEL = "com.example.HealthPaw/mbientlab";

  // METAWEAR OBJECTS
  private BtleService.LocalBinder serviceBinder;
  private Led ledModule;
  private MetaWearBoard mwBoard;
  private GyroBmi160 gyroModule;
  private Logging loggingModule;
  private Accelerometer accelerometer;
  private Temperature temperature;
  private Temperature.Sensor tempSensor;

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
  super.configureFlutterEngine(flutterEngine);
      new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
          .setMethodCallHandler(
          (call, result) -> {
              // Note: this method is invoked on the main thread.
            switch (call.method) {
              case "getBatteryLevel":
                int batteryLevel = getBatteryLevel();
                if (batteryLevel != -1) {
                  result.success(batteryLevel);
                } else {
                  result.error("UNAVAILABLE", "Battery level not available.", null);
                }
                break;
              case "connectBoard":
                String boardId = call.argument("boardId");
                if (boardId != null) {
                  connectBoard(boardId);
                  result.success(true);
                } else {
                  Log.i(TAG, "Invalid board id");
                  result.success(false);
                }
                break;
              case "disconnectBoard":
                if (isConnected) {
                  disconnectBoard();
                  result.success(true);
                } else {
                  Log.i(TAG, "Board is not connected");
                  result.success(false);
                }
                break;
              case "turnOnLed":
                if (isConnected) {
                  turnOnLed();
                  result.success(null);
                } else {
                  Log.i(TAG, "Board is not connected");
                }
                break;
              case "turnOffLed":
                if (isConnected) {
                  turnOffLed();
                  result.success(null);
                } else {
                  Log.i(TAG, "Board is not connected");
                }
                break;
              case "activateLogs":
                if (isConnected) {
                  activateLogs();
                  result.success(true);
                } else {
                  Log.i(TAG, "Board is not connected");
                  result.success(false);
                }
                break;
              case "deactivateLogs":
                if (isConnected) {
                  Map<String, List<Map<String, Float>>> logs = new HashMap<>();
                  List<Map<String, Float>> _accelResults = new ArrayList<>(accelResults);
                  List<Map<String, Float>> _gyroResults = new ArrayList<>(gyroResults);
                  logs.put("accelerometer", _accelResults);
                  logs.put("gyroscope", _gyroResults);
                  result.success(logs);
                } else {
                  Log.i(TAG, "Board is not connected");
                  result.success(null);
                }
                accelResults = new ArrayList<>();
                gyroResults = new ArrayList<>();
                break;
              default:
                result.notImplemented();
                break;
            }
          }
      );
  }

  /// ACTIVITY METHODS

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    ///< Bind the service when the activity is created
    getApplicationContext().bindService(new Intent(this, BtleService.class),
            this, Context.BIND_AUTO_CREATE);
  }

  @Override
  public void onDestroy() {
    super.onDestroy();
    ///< Unbind the service when the activity is destroyed
    getApplicationContext().unbindService(this);
  }

  /// SERVICE CONNECTION METHODS

  @Override
  public void onServiceConnected(ComponentName componentName, IBinder service) {
    serviceBinder = (BtleService.LocalBinder) service;
  }

  @Override
  public void onServiceDisconnected(ComponentName componentName) {
    Log.i(TAG, "Board disconnected");
  }

  /// BOARD CONNECTION METHODS

  public void connectBoard(String boardID) {
    Log.i(TAG, String.format("Connecting to %s:", boardID));
    MW_MAC_ADDRESS = boardID;
    retrieveBoard();
  }

  public void disconnectBoard() {
    Log.i(TAG, "Disconnecting board");
    turnOffLed();
    accelerometer.stop();
    accelerometer.acceleration().stop();
    mwBoard.tearDown();
  }

  /// LED METHODS

  public void turnOnLed() {
    ledModule.editPattern(Led.Color.BLUE);
    ledModule.play();
  }

  public void turnOffLed() {
    ledModule.stop(true);
  }

  public void activateLogs() {
    accelerometer.acceleration().addRouteAsync(new RouteBuilder() {
      @Override
      public void configure(RouteComponent source) {
        source.stream(new Subscriber() {
          @Override
          public void apply(Data data, Object... env) {
            Log.i("MainActivity", data.value(Acceleration.class).toString());
          }
        });
      }
    }).continueWith(new Continuation<Route, Void>() {
      @Override
      public Void then(Task<Route> task) throws Exception {
        accelerometer.acceleration().start();
        accelerometer.start();
        return null;
      }
    });
    tempSensor.addRouteAsync(new RouteBuilder() {
      @Override
      public void configure(RouteComponent source) {
        source.stream(new Subscriber() {
          @Override
          public void apply(Data data, Object ... env) {
            Log.i("MainActivity", "Temperature (C) = " + data.value(Float.class).toString());
          }
        });
      }
    }).continueWith(new Continuation<Route, Void>() {
      @Override
      public Void then(Task<Route> task) throws Exception {
        tempSensor.read();
        return null;
      }
    });
  }

  /// SET CONNECTION TO SELECTED BOARD

  public void retrieveBoard() {
    final BluetoothManager btManager= (BluetoothManager) getSystemService(Context.BLUETOOTH_SERVICE);
    final BluetoothDevice remoteDevice= btManager.getAdapter().getRemoteDevice(MW_MAC_ADDRESS);

    // Create a MetaWear board object for the Bluetooth Device
    mwBoard = serviceBinder.getMetaWearBoard(remoteDevice);

//    accelerometer = mwBoard.getModule(Accelerometer.class);
//    accelerometer.configure()
//            .odr(25f)       // Set sampling frequency to 25Hz, or closest valid ODR
//            .commit();
//    temperature = mwBoard.getModule(Temperature.class);
//    tempSensor = temperature.findSensors(SensorType.PRESET_THERMISTOR)[0];

    mwBoard.connectAsync();
  }

  /// GET BATTERY LEVEL (THIS IS JUST FOR A TEST)

  private int getBatteryLevel() {
    int batteryLevel = -1;
    if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
      BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
      batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
    } else {
      Intent intent = new ContextWrapper(getApplicationContext()).
              registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
      batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
              intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
    }

    return batteryLevel;
  }
}
