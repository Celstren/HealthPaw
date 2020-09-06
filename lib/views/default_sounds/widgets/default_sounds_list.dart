import 'package:HealthPaw/views/default_sounds/widgets/default_sound_item.dart';
import 'package:flutter/material.dart';

class DefaultSoundsGrid extends StatefulWidget {
  DefaultSoundsGrid({Key key}) : super(key: key);

  @override
  _DefaultSoundsGridState createState() => _DefaultSoundsGridState();
}

class _DefaultSoundsGridState extends State<DefaultSoundsGrid> {
  List<String> _sounds = ["", "", "", "", "", "", "", ""];

  List<List<Widget>> _children() {
    List<List<Widget>> _rows = [];
    for (int i = 0; i < _sounds.length; i += 3) {
      List<Widget> _columns = [DefaultSoundItem()];
      if (i + 1 < _sounds.length) _columns.add(DefaultSoundItem());
      if (i + 2 < _sounds.length) _columns.add(DefaultSoundItem());
      _rows.add(_columns);
      _rows.add([SizedBox(height: 10)]);
    }
    _rows.add([SizedBox(height: 20)]);
    return _rows;
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
