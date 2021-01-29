import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vms/new_login/dashboard.dart';

class RequestSent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RequestSent();
}

class _RequestSent extends State<RequestSent> {
  bool _obscureText = false;
  String ErrorValue = "";

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(50),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ListView(
              children: [
                const SizedBox(
                  height: 105,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/checkmark.png',
                    fit: BoxFit.contain,
                    width: 40,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Request Sent To',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'William Turner',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/ellipsis.png',
                    fit: BoxFit.contain,
                    width: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
