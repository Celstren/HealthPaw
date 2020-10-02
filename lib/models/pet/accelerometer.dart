import 'package:HealthPaw/models/pet/stadistic.dart';

class Acceleration {
  final num x;
  final num y;
  final num z;
  final int timestamp;

  Acceleration({this.x = 0, this.y = 0, this.z = 0, this.timestamp = 0});

  factory Acceleration.fromJson(Map<String, dynamic> json) => Acceleration(
    x: json["x"] ?? 0,
    y: json["y"] ?? 0,
    z: json["z"] ?? 0,
    timestamp: json["timestamp"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "x": this.x ?? 0,
    "y": this.y ?? 0,
    "z": this.z ?? 0,
    "rimestamp": this.timestamp ?? 0,
  };

  num get value => (x + y + z) / 3; //TODO: Necesitamos establecer otra fórmula para los valores obtenidos del acelerometro

  History toHistory() => History(
    timestamp: this.timestamp ?? 0,
    value: this.value ?? 0,
  );
}