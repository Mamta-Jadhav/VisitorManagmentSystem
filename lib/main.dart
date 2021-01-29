import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//C:\src>git clone https://github.com/flutter/flutter.git -b stable
import 'new_login/new_splash.dart';
void main() {
  runApp(Vms());
}

class Vms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Arah',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.red),
      home: SplashNew(),
    );
  }
}