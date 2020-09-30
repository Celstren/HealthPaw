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
import com.mbientlab.metawear.module.Led;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

public class MainActivity extends FlutterActivity implements ServiceConnection {

  // RESULT VARIABLES
  private List<Map<String, Object>> accelResults = new ArrayList<>();
  private List<Map<String, Object>> tempResults = new ArrayList<>();
  private boolean trackTemperature = false;

  // METAWEAR VARIABLES
  private String MW_MAC_ADDRESS;
  private boolean isConnected = false;

  // METAWEAR CONSTANTS
  private static final String TAG = "MetaWear";
  private static final String CHANNEL = "com.example.HealthPaw/mbientlab";

  // METAWEAR OBJECTS
  private BtleService.LocalBinder serviceBinder;
  private Led ledModule;
  private MetaWearBoard mwBoard;
  private Accelerometer accelerometer;
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
                  boolean success = connectBoard(boardId);
                  result.success(success);
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
                  trackTemperature = true;
                  activateLogs();
                  result.success(true);
                } else {
                  Log.i(TAG, "Board is not connected");
                  result.success(false);
                }
                break;
              case "deactivateLogs":
                if (isConnected) {
                  trackTemperature = false;
                  final List<Map<String, Object>> _accelResults = new ArrayList<>(accelResults);
                  final List<Map<String, Object>> _tempResults = new ArrayList<>(tempResults);
                  accelResults.clear();
                  tempResults.clear();
                  final Map<String, List<Map<String, Object>>> logs = new HashMap<>();
                  logs.put("acelerometro", _accelResults);
                  logs.put("temperatura", _tempResults);
                  deactivateLogs();
                  result.success(logs);
                } else {
                  Log.i(TAG, "Board is not connected");
                  result.success(null);
                }
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

  public boolean connectBoard(String boardID) {
    Log.i(TAG, String.format("Connecting to %s:", boardID));
    MW_MAC_ADDRESS = boardID;
    return retrieveBoard();
  }

  public void disconnectBoard() {
    Log.i(TAG, "Disconnecting board");
//    turnOffLed();
//    accelerometer.stop();
//    accelerometer.acceleration().stop();
    mwBoard.tearDown();
  }

  /// LED METHODS

  public void turnOnLed() {
    Log.i(TAG, String.valueOf(isConnected));
    ledModule.play();
  }

  public void turnOffLed() {
    ledModule.stop(true);
  }

  public void activateLogs() {
    accelerometer.acceleration().start();
    accelerometer.start();
  }

  public void deactivateLogs() {
    accelerometer.acceleration().stop();
    accelerometer.stop();
  }

  /// SET CONNECTION TO SELECTED BOARD

  public boolean retrieveBoard() {
    final BluetoothManager btManager= (BluetoothManager) getSystemService(Context.BLUETOOTH_SERVICE);
    final BluetoothDevice remoteDevice= btManager.getAdapter().getRemoteDevice(MW_MAC_ADDRESS);

    // Create a MetaWear board object for the Bluetooth Device
    mwBoard = serviceBinder.getMetaWearBoard(remoteDevice);

    try {
      if (mwBoard.isConnected()) {
        mwBoard.disconnectAsync().waitForCompletion(500, TimeUnit.MILLISECONDS);
        Log.i("MainActivity", "Disconnected");
      }
      mwBoard.connectAsync().waitForCompletion(3, TimeUnit.SECONDS);
      Log.i("MainActivity", "Connected");
      accelerometer = mwBoard.getModule(Accelerometer.class);
      accelerometer.configure()
              .odr(25f)       // Set sampling frequency to 25Hz, or closest valid ODR
              .commit();
      Temperature temperature = mwBoard.getModule(Temperature.class);
      tempSensor = temperature.findSensors(SensorType.PRESET_THERMISTOR)[0];
      ledModule = mwBoard.getModule(Led.class);
      if ((ledModule= mwBoard.getModule(Led.class)) != null) {
        ledModule.editPattern(Led.Color.RED, Led.PatternPreset.PULSE)
                .repeatCount((byte) 3)
                .commit();
        ledModule.play();

        isConnected = mwBoard.isConnected();

        Log.i(TAG, String.valueOf(mwBoard.isConnected()));
      }
      if (accelerometer != null) {
        accelerometer.acceleration().addRouteAsync(new RouteBuilder() {
          @Override
          public void configure(RouteComponent source) {
            source.stream(new Subscriber() {
              @Override
              public void apply(Data data, Object... env) {
                Map<String, Object> value = new HashMap<String, Object>();
                value.put("x", data.value(Acceleration.class).x());
                value.put("y", data.value(Acceleration.class).y());
                value.put("z", data.value(Acceleration.class).z());
                value.put("timestamp", data.timestamp().getTimeInMillis());
                accelResults.add(value);
                Log.i("MainActivity", data.value(Acceleration.class).toString());
                tempSensor.read();
              }
            });
          }
        }).waitForCompletion(500, TimeUnit.MILLISECONDS);
      }
      if (tempSensor != null) {
        tempSensor.addRouteAsync(new RouteBuilder() {
          @Override
          public void configure(RouteComponent source) {
            source.stream(new Subscriber() {
              @Override
              public void apply(Data data, Object ... env) {
                if (trackTemperature) {
                  Map<String, Object> value = new HashMap<String, Object>();
                  value.put("value", data.value(Float.class));
                  value.put("timestamp", data.timestamp().getTimeInMillis());
                  tempResults.add(value);
                  Log.i("MainActivity", "Temperature (C) = " + data.value(Float.class).toString());
                }
              }
            });
          }
        }).waitForCompletion(500, TimeUnit.MILLISECONDS);
      }
    } catch (InterruptedException e) {
      Log.i(TAG, e.toString());
      Log.i("MainActivity", "Failed to connect");
    }
    return isConnected;
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
