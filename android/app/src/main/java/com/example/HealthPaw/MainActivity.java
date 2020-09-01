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
import com.mbientlab.metawear.data.CartesianShort;
import com.mbientlab.metawear.module.Bmi160Accelerometer;
import com.mbientlab.metawear.module.Bmi160Gyro;
import com.mbientlab.metawear.module.Led;
import com.mbientlab.metawear.module.Logging;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MainActivity extends FlutterActivity implements ServiceConnection {

  // RESULT VARIABLES
  private List<String> accelResults = new ArrayList<>();
  private List<String> gyroResults = new ArrayList<>();

  // METAWEAR VARIABLES
  private String MW_MAC_ADDRESS;
  //private final String MW_MAC_ADDRESS= "F0:80:F6:C8:E0:75";
  private boolean isConnected;

  // METAWEAR CONSTANTS
  private static final String TAG = "MetaWear";
  private static final float ACC_RANGE = 8.f, ACC_FREQ = 50.f;
  private static final String STREAM_KEY = "accel_stream";
  private static final String LOG_KEY = "accel_log";
  private static final String GYRO_STREAM_KEY = "gyro_stream";
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
          if (call.method.equals("getBatteryLevel")) {
            int batteryLevel = getBatteryLevel();
            if (batteryLevel != -1) {
              result.success(batteryLevel);
            } else {
              result.error("UNAVAILABLE", "Battery level not available.", null);
            }
          } else if (call.method.equals("connectBoard")) {
            String boardId = call.argument("boardId");
            if (boardId != null && !boardId.isEmpty()) {
              connectBoard(boardId);
              result.success(true);
            } else {
              Log.i(TAG, "Invalid board id");
              result.success(false);
            }
          } else if (call.method.equals("disconnectBoard")) {
            if (isConnected) {
              disconnectBoard();
              result.success(true);
            } else {
              Log.i(TAG, "Board is not connected");
              result.success(false);
            }
          } else if (call.method.equals("turnOnLed")) {
            int colorId = call.argument("colorId");
            if (isConnected) {
              turnOnLed(colorId);
              result.success(null);
            } else {
              Log.i(TAG, "Board is not connected");
            }
          } else if (call.method.equals("turnOffLed")) {
            if (isConnected) {
              turnOffLed();
              result.success(null);
            } else {
              Log.i(TAG, "Board is not connected");
            }
          } else if (call.method.equals("activateLogs")) {
            if (isConnected) {
              activateLogs();
              result.success(true);
            } else {
              Log.i(TAG, "Board is not connected");
              result.success(false);
            }
          } else if (call.method.equals("deactivateLogs")) {
            if (isConnected) {
              deactivateLogs();
              Map<String, List<String>> logs = new HashMap<>();
              logs.put("accelerometer", accelResults);
              logs.put("gyroscope", gyroResults);
              result.success(logs);
            } else {
              Log.i(TAG, "Board is not connected");
              result.success(null);
            }
          } else if (call.method.equals("clearEntries")) {
            if (isConnected) {
              clearEntries();
              result.success(null);
            } else {
              Log.i(TAG, "Board is not connected");
              result.success(null);
            }
          } else {
              result.notImplemented();
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
    accelResults = new ArrayList<>();
    gyroResults = new ArrayList<>();
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
            Log.i(TAG, String.format("Accelerometer: %s", axes.toString()));
            sensorMsg(String.format(axes.toString()), "accel");
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
            Log.i(TAG, String.format("Gyroscope: %s", spinData.toString()));
            sensorMsg(String.format(spinData.toString()), "gyro");
          }
        });
      }
    });

    accelModule.routeData()
            .fromAxes().stream(STREAM_KEY)
            .commit().onComplete(new AsyncOperation.CompletionHandler<RouteManager>() {
      @Override
      public void success(RouteManager result) {
        result.setLogMessageHandler(LOG_KEY, new RouteManager.MessageHandler() {
          @Override
          public void process(Message msg) {
            final CartesianShort axisData = msg.getData(CartesianShort.class);
            Log.i(TAG, String.format("Log: %s", axisData.toString()));
          }
        });
      }

      @Override
      public void failure(Throwable error) {
        Log.e(TAG, "Error committing route", error);
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
    final BluetoothManager btManager=
            (BluetoothManager) getSystemService(Context.BLUETOOTH_SERVICE);
    final BluetoothDevice remoteDevice=
            btManager.getAdapter().getRemoteDevice(MW_MAC_ADDRESS);

    // Create a MetaWear board object for the Bluetooth Device
    mwBoard= serviceBinder.getMetaWearBoard(remoteDevice);
    mwBoard.setConnectionStateHandler(stateHandler);
  }

  /// MANAGE MESSAGES FROM BOARD

  public void sensorMsg(String msg, final String sensor) {
    final String reading = msg;
    runOnUiThread(new Runnable() {
      @Override
      public void run() {
        if (sensor == "accel") {
          accelResults.add(reading);
        } else {
          gyroResults.add(reading);
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
