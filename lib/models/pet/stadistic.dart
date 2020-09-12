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
        this.history,
        this.timestamp,
    });

    String variable;
    String status;
    int minimum;
    int maximum;
    int timestamp;
    List<History> history;

    factory Stadistic.fromJson(Map<String, dynamic> json) => Stadistic(
        variable: json["variable"] ?? "",
        status: json["status"] ?? "",
        minimum: json["minimum"] ?? 0,
        maximum: json["maximum"] ?? 0,
        history: json["history"] != null ? List<History>.from(json["history"].map((x) => History.fromJson(x))) : [],
        timestamp: json["timestamp"] ?? 0,
    );

    factory Stadistic.sample() => Stadistic(
        variable: "Sample",
        status: "Estable",
        minimum: 10,
        maximum: 100,
        history: [
          History(timestamp: 1599868800000, value: 50),
          History(timestamp: 1599872400000, value: 30),
          History(timestamp: 1599876000000, value: 75),
          History(timestamp: 1599879600000, value: 10),
          History(timestamp: 1599883200000, value: 90),
        ],
        timestamp: 1599868800000,
    );

    Map<String, dynamic> toJson() => {
        "variable": variable,
        "status": status,
        "minimum": minimum,
        "maximum": maximum,
        "history": history != null ? List<dynamic>.from(history.map((x) => x.toJson())) : [],
    };
}

class History {
    History({
        this.timestamp,
        this.value,
    });

    int timestamp;
    num value;

    factory History.fromJson(Map<String, dynamic> json) => History(
        timestamp: json["timestamp"] ?? 0,
        value: json["value"]?.toDouble() ?? 0.0,
    );

    Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "value": value,
    };

    DateTime get date => DateTime.fromMillisecondsSinceEpoch(this.timestamp);
}
