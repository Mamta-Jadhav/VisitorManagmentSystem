import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vms/common/common.dart';
import 'package:vms/new_login/dashboard.dart';

class RequestSent extends StatefulWidget {
  String hostname;

  RequestSent(this.hostname);

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
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context);
        Navigator.pop(context);
        // goToPageWithReplace(context, DashBoard());
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 105,
              ),
              Center(
                child: Image.asset(
                  'assets/images/checkmark.png',
                  fit: BoxFit.contain,
                  width: 60,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Success!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontStyle: FontStyle.normal),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Request Sent To',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  widget.hostname,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xff37b5ff)),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       flex: 1,
              //       child: RaisedButton(
              //         onPressed: () {
              //           Navigator.pop(context);
              //           Navigator.pop(context);
              //           goToPageWithReplace(context, DashBoard());
              //           // Navigator.pop(context);
              //         },
              //         child: Text(
              //           'BACK',
              //           textAlign: TextAlign.center,
              //         ),
              //         padding: EdgeInsets.all(15),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
