import 'dart:async';
import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/general/constant_helper.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:file/local.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class RecordAudioContent extends StatefulWidget {
  final LocalFileSystem localFileSystem;
  final String customPath;
  
  RecordAudioContent({Key key, LocalFileSystem localFileSystem, this.customPath = ""}) : this.localFileSystem = localFileSystem ?? LocalFileSystem(), super(key: key);

  @override
  _RecordAudioContentState createState() => _RecordAudioContentState();
}

class _RecordAudioContentState extends State<RecordAudioContent> {
  FlutterAudioRecorder _recorder;
  Recording _current;
  RecordingStatus _currentStatus = RecordingStatus.Unset;
  Box<List<String>> box;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    box?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.customPath);
    return new Center(
      child: new Padding(
        padding: new EdgeInsets.all(8.0),
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              PetAvatar(),
              _currentStatus == RecordingStatus.Stopped ? new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new FlatButton(
                      onPressed: _init,
                      child: Text(AppStrings.createNewAudio, style: TextStyle(color: Colors.white)),
                      color: Colors.lightBlue,
                    ),
                  ),
                  _current?.path != null ? new FlatButton(
                    onPressed: onPlayAudio,
                    child:
                        new Text("Play", style: TextStyle(color: Colors.white)),
                    color: Colors.blueAccent.withOpacity(0.5),
                  ) : SizedBox(),
                ],
              ) : SizedBox(),
              _currentStatus != RecordingStatus.Stopped ? new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new FlatButton(
                      onPressed: () {
                        switch (_currentStatus) {
                          case RecordingStatus.Initialized: _start(); break;
                          case RecordingStatus.Recording: _pause(); break;
                          case RecordingStatus.Paused: _resume(); break;
                          default: break;
                        }
                      },
                      child: _buildText(_currentStatus),
                      color: Colors.lightBlue,
                    ),
                  ),
                  new FlatButton(
                    onPressed:
                        _currentStatus != RecordingStatus.Unset ? _stop : null,
                    child:
                        new Text("Stop", style: TextStyle(color: Colors.white)),
                    color: Colors.blueAccent.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ) : SizedBox(),
            ]),
      ),
    );
  }

  _init() async {
    box = await Hive.openBox<List<String>>("audios");
    try {
      if (await FlutterAudioRecorder.hasPermissions) {
        String fileNamePath = widget.customPath + ConstantHelper.AUDIO_DEFAULT_NAME + DateTime.now().millisecondsSinceEpoch.toString();

        // .wav <---> AudioFormat.WAV
        // .mp4 .m4a .aac <---> AudioFormat.AAC
        // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.
        _recorder = FlutterAudioRecorder(fileNamePath, audioFormat: AudioFormat.WAV);

        await _recorder.initialized;
        // after initialization
        var current = await _recorder.current(channel: 0);
        // should be "Initialized", if all working fine
        setState(() {
          _current = current;
          _currentStatus = current.status;
          print(_currentStatus);
        });
      } else {
        Fluttertoast.showToast(msg: "Debe aceptar las condiciones de uso");
      }
    } catch (e) {
      print(e);
    }
  }

  _start() async {
    try {
      await _recorder.start();
      var recording = await _recorder.current(channel: 0);
      setState(() {
        _current = recording;
      });

      const tick = const Duration(milliseconds: 50);
      new Timer.periodic(tick, (Timer t) async {
        if (_currentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }

        var current = await _recorder.current(channel: 0);
        // print(current.status);
        setState(() {
          _current = current;
          _currentStatus = _current.status;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  _resume() async {
    await _recorder.resume();
    setState(() {});
  }

  _pause() async {
    await _recorder.pause();
    setState(() {});
  }

  _stop() async {
    var result = await _recorder.stop();
    if (box != null) {
      List<String> audios = box.get("audios", defaultValue: []);
      audios.add(result.path);
      box.put("audios", audios);
    }
    setState(() {
      _current = result;
      _currentStatus = _current.status;
    });
  }

  Widget _buildText(RecordingStatus status) {
    var text = "";
    switch (_currentStatus) {
      case RecordingStatus.Initialized: text = AppStrings.start; break;
      case RecordingStatus.Recording: text =  AppStrings.pause; break;
      case RecordingStatus.Paused: text =  AppStrings.resume; break;
      default: break;
    }
    return Text(text, style: TextStyle(color: Colors.white));
  }

  void onPlayAudio() async {
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play(_current.path, isLocal: true);
  }
}