import 'dart:io';
import 'package:HealthPaw/utils/general/app_sounds.dart';
import 'package:HealthPaw/views/default_sounds/widgets/default_sound_item.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class DefaultSoundsGrids extends StatefulWidget {
  DefaultSoundsGrids({Key key}) : super(key: key);

  @override
  _DefaultSoundsGridsState createState() => _DefaultSoundsGridsState();
}

class _DefaultSoundsGridsState extends State<DefaultSoundsGrids> {
  List<File> _savedSounds = [];
  Box<List<String>> box;

  List<List<Widget>> _children() {
    List<List<Widget>> _rows = [];
    for (int i = 0; i < _savedSounds.length; i += 3) {
      List<Widget> _columns = [DefaultSoundItem(soundFile: _savedSounds[i])];
      if (i + 1 < _savedSounds.length)
        _columns.add(DefaultSoundItem(soundFile: _savedSounds[i + 1]));
      if (i + 2 < _savedSounds.length)
        _columns.add(DefaultSoundItem(soundFile: _savedSounds[i + 2]));
      _rows.add(_columns);
      _rows.add([SizedBox(height: 10)]);
    }
    _rows.add([SizedBox(height: 20)]);
    return _rows;
  }

  void initializeData() async {
    box = await Hive.openBox<List<String>>("audios");
    List<String> audios = box.get("audios", defaultValue: []);
    AudioCache audioCache = AudioCache();
    List<File> defaultAudios = await audioCache.loadAll(AppSounds.petAudioPaths);
    if (mounted) {
      setState(() {
        audios.forEach((element) {
          if (element.isNotEmpty) {
            _savedSounds.add(File(element));
          }
        });
        _savedSounds.addAll(defaultAudios);
      });
    }
  }

  @override
  void initState() {
    initializeData();
    super.initState();
  }
  
  @override
  void dispose() {
    box?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: _children()
            .map<Row>((e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: e))
            .toList(),
      ),
    );
  }
}
