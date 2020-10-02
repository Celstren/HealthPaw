import 'package:HealthPaw/models/pet/stadistic.dart';

class Temperature {
  final num celsius;
  final int timestamp;

  Temperature({this.celsius = 0, this.timestamp = 0});

  factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
    celsius: json["value"] ?? 0,
    timestamp: json["timestamp"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "value": this.celsius ?? 0,
    "timestamp": this.timestamp ?? 0,
  };

  History toHistory() => History(
    value: this.celsius ?? 0,
    timestamp: this.timestamp ?? 0,
  );
}