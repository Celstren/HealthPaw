import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/sound_manager/widgets/sound_manager_content.dart';
import 'package:flutter/material.dart';

import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class SoundManagerView extends StatefulWidget {
  SoundManagerView({Key key}) : super(key: key);

  @override
  _SoundManagerViewState createState() => _SoundManagerViewState();
}

class _SoundManagerViewState extends State<SoundManagerView> {
  Future<String> get init async {
    try {
      if (await FlutterAudioRecorder.hasPermissions) {
        String customPath = "";
        Directory appDocDirectory;
        if (Platform.isIOS) {
          appDocDirectory = await getApplicationDocumentsDirectory();
        } else {
          appDocDirectory = await getExternalStorageDirectory();
        }

        // can add extension like ".mp4" ".wav" ".m4a" ".aac"
        customPath = appDocDirectory.path;
        return customPath;
      } else {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text("You must accept permissions")));
        return Future.error("error");
      }
    } catch (e) {
      print(e);
      return Future.error("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<String>(
            future: init,
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: <Widget>[
                    CommonAppBar(title: AppStrings.sounds, showHeader: true),
                    Expanded(
                        child: SoundManagerContent(customPath: snapshot.data)),
                  ],
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
