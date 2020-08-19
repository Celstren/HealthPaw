import 'package:flutter/material.dart';

class AppBorderRadius {
  static const Radius radius10 = Radius.circular(10);
  static const Radius radius15 = Radius.circular(15);
  static const Radius radius20 = Radius.circular(20);
  static const Radius radius25 = Radius.circular(25);
  static const Radius radius30 = Radius.circular(30);

  static BorderRadius onlyBottom({Radius bottomRadius = radius10})  => BorderRadius.only(bottomLeft: bottomRadius, bottomRight: bottomRadius);
  static BorderRadius onlyTop({Radius bottomRadius = radius10})     => BorderRadius.only(topLeft: bottomRadius, topRight: bottomRadius);
  static BorderRadius all({Radius radius = radius10})               => BorderRadius.all(radius);
}