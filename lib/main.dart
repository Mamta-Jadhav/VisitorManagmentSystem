import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      title: 'VMS',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.red),
      home: SplashNew(),
    );
  }
}