import 'package:HealthPaw/models/pet/stadistic.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

enum PeriodType { Hours, Minutes, Seconds }

class StatsField extends StatelessWidget {
  final List<History> data;
  final bool animate;
  final PeriodType periodType;

  const StatsField({Key key, this.data, this.animate = false, this.periodType = PeriodType.Hours}) : super(key: key);

  static List<charts.Series<History, num>> _castData(List<History> _data, PeriodType periodType) {
    return [
      new charts.Series<History, num>(
        id: 'Stats',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (History element, _) => getDomainValues(element.date, periodType),
        measureFn: (History element, _) => element.value,
        data: _data,
      )
    ];
  }

  static num getDomainValues(DateTime date, PeriodType periodType) {
    switch(periodType) {
      case PeriodType.Hours:
        return date.hour;
        break;
      case PeriodType.Minutes:
        return date.minute;
        break;
      case PeriodType.Seconds:
        return date.second;
        break;
      default:
        return date.hour;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(_castData(this.data, this.periodType), animate: animate);
  }
}