import 'package:file/local.dart';
import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/circular_button.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/views/default_sounds/default_sounds.dart';
import 'package:HealthPaw/views/record_audio/record_audio.dart';
import 'package:flutter/material.dart';

class SoundManagerContent extends StatefulWidget {
  final LocalFileSystem localFileSystem;
  final String customPath;

  SoundManagerContent({Key key, LocalFileSystem localFileSystem, this.customPath = ""}) : this.localFileSystem = localFileSystem ?? LocalFileSystem(), super(key: key);

  @override
  _SoundManagerContentState createState() => _SoundManagerContentState();
}

class _SoundManagerContentState extends State<SoundManagerContent> {
  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PetAvatar(),
        CircularButton(
          size: 80,
          onPress: () => NavigationMethods.of(context).navigateTo(RecordAudioView(localFileSystem: widget.localFileSystem, customPath: widget.customPath)),
          label: AppStrings.record,
          icon: Icon(Icons.mic, size: 30, color: AppColors.PrimaryBlack),
        ),
        CircularButton(
          size: 80,
          onPress: () => NavigationMethods.of(context).navigateTo(DefaultSoundsView()),
          label: AppStrings.defaultSound,
          icon: Icon(Icons.music_note, size: 30, color: AppColors.PrimaryBlack),
        ),
      ],
    );
  }
}
