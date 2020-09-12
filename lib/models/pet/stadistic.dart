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
    });

    String variable;
    String status;
    int minimum;
    int maximum;
    List<History> history;

    factory Stadistic.fromJson(Map<String, dynamic> json) => Stadistic(
        variable: json["variable"] ?? "",
        status: json["status"] ?? "",
        minimum: json["minimum"] ?? 0,
        maximum: json["maximum"] ?? 0,
        history: json["history"] != null ? List<History>.from(json["history"].map((x) => History.fromJson(x))) : [],
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
    double value;

    factory History.fromJson(Map<String, dynamic> json) => History(
        timestamp: json["timestamp"] ?? 0,
        value: json["value"]?.toDouble() ?? 0.0,
    );

    Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "value": value,
    };
}
