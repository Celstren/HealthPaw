import 'package:HealthPaw/models/pet/stadistic.dart';
/// Example of a simple line chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class StatsField extends StatelessWidget {
  final List<History> data;
  final bool animate;

  const StatsField({Key key, this.data, this.animate = false}) : super(key: key);

  static List<charts.Series<History, num>> _castData(List _data) {
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

class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SimpleLineChart.withSampleData() {
    return new SimpleLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList, animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

/// Sample linear data type.
class StatsData {
  final int minimum;
  final int maximum;

  StatsData(this.minimum, this.maximum);
}