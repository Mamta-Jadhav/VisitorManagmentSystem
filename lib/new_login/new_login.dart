import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vms/new_login/dashboard.dart';

import 'new_forgotpwd.dart';

class LoginNew extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginNew();
}

class _LoginNew extends State<LoginNew> {
  TextEditingController _editingControllerName = TextEditingController();
  TextEditingController _editingControllerPass = TextEditingController();
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
                const SizedBox(height: 15,),
                Center(
                  child: Image.asset(
                    'assets/images/vmsnewicon.png',
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  'Registerd Email',
                ),
                TextField(
                  controller: _editingControllerName,
                  onTap: () {
                   setState(() {
                     ErrorValue = '';
                   });
                  },
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1)),
                      disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Password'),
                TextField(
                  controller: _editingControllerPass,
                  obscureText: !_obscureText,
                  onTap: () {
                    setState(() {
                      ErrorValue = '';
                    });
                  },
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _toggle();
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Visibility(
                  visible: ErrorValue != "",
                  child: Center(
                      child: Text(
                    ErrorValue,
                    style: TextStyle(color: Colors.red),
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        // fit: FlexFit.loose,
                        child: RaisedButton(
                          elevation: 10.0,
                          padding: EdgeInsets.all(12.0),
                          onPressed: () {
                            if (_editingControllerName.text == 'admin' &&
                                _editingControllerPass.text == '12345') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashBoard()));
                              print('HElllooooo');
                            } else {
                              // _editingControllerforgot.text =
                              //     'Invalid Credentials';

                              setState(() {
                                ErrorValue = 'Invalid Credentials';
                              });
                            }
                          },
                          color: Colors.blue[800],
                          textColor: Colors.white,
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontFamily: 'Sans-Serif', fontSize: 17),
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPwd()));
                  },
                  child: Text(
                    'Forgot Password?',textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blue[800],
                        decoration: TextDecoration.underline),
                  ),
                ),
                const SizedBox(
                  height: 170,
                ),
                const Text('V1.0.2',textAlign: TextAlign.center, ),
              ],
            ),
            // Text('V1.0.2',textAlign: TextAlign.center, ),
          ],
        ),
      ),
    );
  }
}
