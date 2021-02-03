import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'new_login.dart';

class SplashNew extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashNew();
}

class _SplashNew extends State<SplashNew> with SingleTickerProviderStateMixin {
  AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    rotationController.repeat();

    Timer(Duration(seconds: 2), () {
      Route route = MaterialPageRoute(builder: (context) => LoginNew());
      Navigator.pushReplacement(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/vmsnewicon.png',
            ),
            // const SizedBox(
            //   height: 150,
            // ),
            // AnimatedBuilder(
            //   animation: rotationController,
            //   child: Container(
            //     height: 50,
            //     width: 50,
            //     child: Image.asset(
            //       'assets/images/loading.png',
            //     ),
            //   ),
            //   builder: (BuildContext context, Widget _widget) {
            //     return Transform.rotate(
            //       angle: rotationController.value * 6.3,
            //       child: _widget,
            //     );
            //   },
            // ),
            // const SizedBox(
            //   height: 200,
            // ),
            // const Text('V1.0.2'),
            // const SizedBox(
            //   height: 50,
            // ),
          ],
        ),
      ),
    );
  }
}
