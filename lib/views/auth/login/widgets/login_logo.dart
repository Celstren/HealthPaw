import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Container(
          height: 50,
          width: 50,
          child: Placeholder(),
        ),
      ),
    );
  }
}