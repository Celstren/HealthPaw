// To parse this JSON data, do
//
//     final stadistic = stadisticFromJson(jsonString);

import 'dart:convert';

Stadistic stadisticFromJson(String str) => Stadistic.fromJson(json.decode(str));

String stadisticToJson(Stadistic data) => json.encode(data.toJson());

class Stadistic {
    Stadistic({
        this.variable,
        this.status,
        this.minimum,
        this.maximum,
        this.average,
        this.todayHistory,
        this.history,
    });

    String variable;
    String status;
    num minimum;
    num maximum;
    num average;
    List<History> todayHistory;
    List<History> history;

    factory Stadistic.fromJson(Map<String, dynamic> json) => Stadistic(
        variable: json["variable"] ?? "",
        status: json["status"] ?? "",
        minimum: json["minimum"] ?? 0,
        maximum: json["maximum"] ?? 0,
        average: json["average"] ?? 0,
        todayHistory: json["todayHistory"] != null ? List<History>.from(json["todayHistory"].map((x) => History.fromJson(x))) : [],
        history: json["history"] != null ? List<History>.from(json["history"].map((x) => History.fromJson(x))) : [],
    );

    Map<String, dynamic> toJson() => {
        "variable": variable,
        "status": status,
        "minimum": minimum,
        "maximum": maximum,
        "average": average,
        "todayHistory": List<dynamic>.from(todayHistory.map((x) => x.toJson())),
        "history": List<dynamic>.from(history.map((x) => x.toJson())),
    };

    StatOverview get todayOverview => StatOverview(minimum: this.minimum, maximum: this.maximum, average: this.average, lastValue: this.todayHistory != null && this.todayHistory.isNotEmpty ? this.todayHistory.last.value : 0);
    StatOverview get historyOverview {
      num mini = 0, maxi = 0, last = 0, ave = 0, total = 0;
      if (this.history != null && this.history.isNotEmpty) {
        mini = this.history.first.value;
        last = this.history.last.value;
      }
      this.history.forEach((element) {
        total += element.value;
        if (mini > element.value) {
          mini = element.value;
        }
        if (maxi < element.value) {
          maxi = element.value;
        }
      });
      ave = this.history.length != 0 ? total / this.history.length : 0;
      return StatOverview(minimum: mini, maximum: maxi, average: ave, lastValue: last);
    }
}

class StatOverview {
    final num minimum;
    final num maximum;
    final num average;
    final num lastValue;

  StatOverview({this.minimum, this.maximum, this.average, this.lastValue});
}

class History {
    History({
        this.timestamp,
        this.value,
    });

    int timestamp;
    double value;

    factory History.fromJson(Map<String, dynamic> json) => History(
        timestamp: json["timestamp"] ?? 0,
        value: json["value"]?.toDouble() ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "value": value,
    };

    DateTime get date => DateTime.fromMillisecondsSinceEpoch(this.timestamp);
}
