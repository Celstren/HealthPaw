import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(      
      height: MediaQuery.of(context).size.width*0.40,
      width: MediaQuery.of(context).size.width*0.7,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.black, width: 1.5),
              image: DecorationImage(
            image: AssetImage('assets/icons/logo.PNG'),
            fit: BoxFit.fitWidth,
          )),
        ),
      ),
    );
  }
}
