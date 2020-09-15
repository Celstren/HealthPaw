import 'package:HealthPaw/models/pet/stadistic.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class StatsField extends StatelessWidget {
  final List<History> data;
  final bool animate;

  const StatsField({Key key, this.data, this.animate = false}) : super(key: key);

  static List<charts.Series<History, num>> _castData(List<History> _data) {
    return [
      new charts.Series<History, num>(
        id: 'Stats',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (History element, _) => element.date.hour,
        measureFn: (History element, _) => element.value,
        data: _data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(_castData(data), animate: animate);
  }
}