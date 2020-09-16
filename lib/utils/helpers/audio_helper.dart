import 'dart:async';

import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';

class AudioHelper {
  FlutterAudioRecorder recorder;
  Recording recording;

  Future<bool> createAudio(String filePath) async {
    bool hasPermission = await FlutterAudioRecorder.hasPermissions;
    if (hasPermission) {
      recorder = FlutterAudioRecorder(filePath); // .wav .aac .m4a
      await recorder.initialized;
      return true;
    }
    return false;
  }

  void startRecording(Function callback) async {
    if (recorder != null) {
      await recorder.start();
      recording = await recorder.current(channel: 0);
    }
  }

  void stopRecording() async {
    if (recorder != null) {
      await recorder.stop();
    }
  }

}