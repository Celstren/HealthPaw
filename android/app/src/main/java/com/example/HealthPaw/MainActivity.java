package com.example.HealthPaw;

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

import com.mbientlab.metawear.AsyncOperation;
import com.mbientlab.metawear.Message;
import com.mbientlab.metawear.MetaWearBleService;
import com.mbientlab.metawear.MetaWearBoard;
import com.mbientlab.metawear.RouteManager;
import com.mbientlab.metawear.UnsupportedModuleException;
import com.mbientlab.metawear.data.CartesianFloat;
import com.mbientlab.metawear.module.Bmi160Accelerometer;
import com.mbientlab.metawear.module.Bmi160Gyro;
import com.mbientlab.metawear.module.Temperature;
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
  private static final String STREAM_KEY = "accel_stream";
  private static final String GYRO_STREAM_KEY = "gyro_stream";
  private static final String TEMP_STREAM_KEY = "temp_stream";
  private static final String CHANNEL = "com.example.HealthPaw/mbientlab";

  // METAWEAR OBJECTS
  private MetaWearBleService.LocalBinder serviceBinder;
  private Led ledModule;
  private MetaWearBoard mwBoard;
  private Bmi160Gyro gyroModule;
  private Logging loggingModule;
  private Bmi160Accelerometer accelModule;

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
                int colorId = call.argument("colorId");
                if (isConnected) {
                  turnOnLed(colorId);
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
                  deactivateLogs();
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
    getApplicationContext().bindService(new Intent(this, MetaWearBleService.class),
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
    serviceBinder = (MetaWearBleService.LocalBinder) service;
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
    mwBoard.connect();
  }

  public void disconnectBoard() {
    Log.i(TAG, "Disconnecting board");
    turnOffLed();
    mwBoard.disconnect();
  }

  /// LED METHODS

  public void turnOnLed(int colorId) {
    Led.ColorChannel ledColor;
    if (colorId == 0) {
      ledColor = Led.ColorChannel.RED;
    } else if (colorId == 1) {
      ledColor = Led.ColorChannel.BLUE;
    } else {
      ledColor = Led.ColorChannel.GREEN;
    }
    ledModule.configureColorChannel(ledColor)
            .setRiseTime((short) 0).setPulseDuration((short) 1000)
            .setRepeatCount((byte) -1).setHighTime((short) 500)
            .setHighIntensity((byte) 16).setLowIntensity((byte) 16)
            .commit();
    ledModule.play(true);
  }

  public void turnOffLed() {
    ledModule.stop(true);
  }

  /// LOGS METHODS

  public void clearEntries() {
    loggingModule.clearEntries();
  }

  public void activateLogs() {
    accelModule.setOutputDataRate(ACC_FREQ);
    accelModule.setAxisSamplingRange(ACC_RANGE);
    gyroModule.configure()
            .setOutputDataRate(Bmi160Gyro.OutputDataRate.ODR_50_HZ)
            .setFullScaleRange(Bmi160Gyro.FullScaleRange.FSR_500)
            .commit();

    AsyncOperation<RouteManager> routeManagerResultAccel = accelModule.routeData().fromAxes().stream(STREAM_KEY).commit();
    AsyncOperation<RouteManager> routeManagerResultGyro = gyroModule.routeData().fromAxes().stream(GYRO_STREAM_KEY).commit();

    routeManagerResultAccel.onComplete(new AsyncOperation.CompletionHandler<RouteManager>() {
      @Override
      public void success(RouteManager result) {
        result.subscribe(STREAM_KEY, new RouteManager.MessageHandler() {
          @Override
          public void process(Message msg) {
            final CartesianFloat axes = msg.getData(CartesianFloat.class);
            final Map<String, Float> data = new HashMap<String, Float>();
            data.put("x", axes.x());
            data.put("y", axes.y());
            data.put("z", axes.z());
            accelResults.add(data);
          }
        });
      }
    });

    routeManagerResultGyro.onComplete(new AsyncOperation.CompletionHandler<RouteManager>() {
      @Override
      public void success(RouteManager result) {
        result.subscribe(GYRO_STREAM_KEY, new RouteManager.MessageHandler() {
          @Override
          public void process(Message msg) {
            final CartesianFloat spinData = msg.getData(CartesianFloat.class);
            final Map<String, Float> data = new HashMap<String, Float>();
            data.put("x", spinData.x());
            data.put("y", spinData.y());
            data.put("z", spinData.z());
            gyroResults.add(data);
          }
        });
      }
    });

    loggingModule.startLogging(true);
    accelModule.enableAxisSampling();
    accelModule.start();
    gyroModule.start();
  }

  public void deactivateLogs() {
    loggingModule.stopLogging();
    gyroModule.stop();
    accelModule.disableAxisSampling();
    accelModule.stop();
    loggingModule.downloadLog(0.05f, new Logging.DownloadHandler() {
      @Override
      public void onProgressUpdate(int nEntriesLeft, int totalEntries) {
        Log.i(TAG, String.format("Progress= %d / %d", nEntriesLeft,
                totalEntries));
      }
    });
    Log.i(TAG, "Log size: " + loggingModule.getLogCapacity());
    clearEntries();
  }

  /// MANAGE CONNECTION STATES

  private final MetaWearBoard.ConnectionStateHandler stateHandler= new MetaWearBoard.ConnectionStateHandler() {
    @Override
    public void connected() {
      try {
        ledModule = mwBoard.getModule(Led.class);
        accelModule = mwBoard.getModule(Bmi160Accelerometer.class);
        gyroModule = mwBoard.getModule(Bmi160Gyro.class);
        loggingModule = mwBoard.getModule(Logging.class);
        turnOnLed(0);
        Log.i(TAG, "Connected");
      } catch (UnsupportedModuleException e) {
        e.printStackTrace();
      }
      isConnected = true;
    }

    @Override
    public void disconnected() {
      isConnected = false;
      Log.i(TAG, "Connected Lost");
    }

    @Override
    public void failure(int status, Throwable error) {
      Log.e(TAG, "Error connecting", error);
    }
  };

  /// SET CONNECTION TO SELECTED BOARD

  public void retrieveBoard() {
    final BluetoothManager btManager= (BluetoothManager) getSystemService(Context.BLUETOOTH_SERVICE);
    final BluetoothDevice remoteDevice= btManager.getAdapter().getRemoteDevice(MW_MAC_ADDRESS);

    // Create a MetaWear board object for the Bluetooth Device
    mwBoard= serviceBinder.getMetaWearBoard(remoteDevice);
    mwBoard.setConnectionStateHandler(stateHandler);
  }

  /// MANAGE MESSAGES FROM BOARD

  public void sensorMsg(CartesianFloat cartesianFloat, final String sensor) {

    final Map<String, Float> data = new HashMap<String, Float>();
    data.put("x", cartesianFloat.x());
    data.put("y", cartesianFloat.y());
    data.put("z", cartesianFloat.z());
    runOnUiThread(new Runnable() {
      @Override
      public void run() {
        if (sensor.equals("accel")) {
          accelResults.add(data);
        } else {
          gyroResults.add(data);
        }
      }
    });
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
