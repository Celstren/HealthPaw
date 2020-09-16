import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/record_audio/widgets/record_audio_content.dart';
import 'package:flutter/material.dart';
import 'package:file/local.dart';

class RecordAudioView extends StatefulWidget {
  final LocalFileSystem localFileSystem;
  final String customPath;

  RecordAudioView({Key key, LocalFileSystem localFileSystem, this.customPath = ""}) : this.localFileSystem = localFileSystem ?? LocalFileSystem(), super(key: key);

  @override
  _RecordAudioViewState createState() => _RecordAudioViewState();
}

class _RecordAudioViewState extends State<RecordAudioView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.recordVoiceNote, showHeader: true),
            Expanded(child: RecordAudioContent(localFileSystem: widget.localFileSystem, customPath: widget.customPath)),
          ],
        ),
      ),
    );
  }
}