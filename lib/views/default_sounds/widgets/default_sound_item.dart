import 'dart:io';

import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/utils/widgets/rounded_icon_button.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DefaultSoundItem extends StatefulWidget {
  final File soundFile;
  DefaultSoundItem({Key key, this.soundFile}) : super(key: key);

  @override
  _DefaultSoundItemState createState() => _DefaultSoundItemState();
}

class _DefaultSoundItemState extends State<DefaultSoundItem> {
  bool playing = false;
  AudioPlayer audioPlayer = AudioPlayer();

  void onPlayAudio() async {
    await audioPlayer.play(widget.soundFile.path, isLocal: true);
  }

  void onStopPlaying() async {
    await audioPlayer.stop();
  }

  void onPause() async {
    await audioPlayer.pause();
  }

  void onResume() async {
    await audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 80,
            width: 80,
            child: Placeholder(),
          ),
          StreamBuilder<AudioPlayerState>(
              initialData: AudioPlayerState.COMPLETED,
              stream: audioPlayer.onPlayerStateChanged,
              builder: (context, AsyncSnapshot<AudioPlayerState> snapshot) {
                switch (snapshot.data) {
                  case AudioPlayerState.STOPPED:
                    return RoundedButton(
                      size: Size(90, 30),
                      text: AppStrings.play,
                      style: AppTextStyle.blackStyle(
                          fontSize: AppFontSizes.text10),
                      onPress: onPlayAudio,
                    );
                    break;
                  case AudioPlayerState.PLAYING:
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RoundedIconButton(
                          size: 30,
                          iconData: Icons.stop,
                          onPress: onStopPlaying,
                        ),
                        RoundedIconButton(
                          size: 30,
                          iconData: Icons.pause,
                          onPress: onPause,
                        ),
                      ],
                    );
                    break;
                  case AudioPlayerState.PAUSED:
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RoundedIconButton(
                          size: 30,
                          iconData: Icons.stop,
                          onPress: onStopPlaying,
                        ),
                        RoundedIconButton(
                          size: 30,
                          iconData: Icons.play_arrow,
                          onPress: onResume,
                        ),
                      ],
                    );
                    break;
                  case AudioPlayerState.COMPLETED:
                    return RoundedButton(
                      size: Size(90, 30),
                      text: AppStrings.play,
                      style: AppTextStyle.blackStyle(
                          fontSize: AppFontSizes.text10),
                      onPress: onPlayAudio,
                    );
                    break;
                  default:
                    return Container();
                    break;
                }
              }),
        ],
      ),
    );
  }
}
