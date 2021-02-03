import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vms/common/common.dart';
import 'package:vms/new_login/dashboard.dart';
import 'package:vms/utils/api.dart';

import 'new_forgotpwd.dart';

class LoginNew extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginNew();
}

class _LoginNew extends State<LoginNew> {
  TextEditingController _editingControllerName =
      TextEditingController(text: 'sagar@gmail.com');
  TextEditingController _editingControllerPass =
      TextEditingController(text: '12345678');
  bool _obscureText = false;
  String ErrorValue = "";
  bool btnclick = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          padding: const EdgeInsets.all(50),
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                'assets/images/vmsnewicon.png',
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: const Text(
                'Login to LogicMind',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _editingControllerName,
              onTap: () {
                setState(() {
                  ErrorValue = '';
                });
              },
              decoration: InputDecoration(
                  labelText: 'Registered Email / Mobile No.',
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1)),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(

              controller: _editingControllerPass,
              obscureText: !_obscureText,
              onTap: () {
                setState(() {
                  ErrorValue = '';
                });
              },
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: GestureDetector(
                  onTap: () {
                    _toggle();
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
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
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    // fit: FlexFit.loose,
                    child: btnclick
                        ? Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              SizedBox(
                                child: CircularProgressIndicator(),
                                height: 50.0,
                                width: 50.0,
                              )
                            ],
                          )
                        : RaisedButton(
                            padding: EdgeInsets.all(12.0),
                            onPressed: () {
                              apiLogin();
                              setState(() {
                                btnclick = true;
                              });
                              Route route = MaterialPageRoute(
                                  builder: (context) => DashBoard());
                              Navigator.pushReplacement(context, route);

                              // if (_editingControllerName.text == 'admin' &&
                              //     _editingControllerPass.text == '12345') {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => DashBoard()));
                              //   print('HElllooooo');
                              // } else {
                              //   // _editingControllerforgot.text =
                              //   //     'Invalid Credentials';
                              //
                              //   setState(() {
                              //     ErrorValue = 'Invalid Credentials';
                              //   });
                              // }
                            },
                            color: Color(0xff37b5ff),
                            textColor: Colors.white,
                            child: Text(
                              'LOGIN',
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgotPwd()));
              },
              child: Text(
                'Can\'t access account?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff37b5ff),
                    decoration: TextDecoration.underline),
              ),
            ),
            // const SizedBox(
            //   height: 70,
            // ),
            // const Text(
            //   'V1.0.2',
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
    );
  }

  void apiLogin() async {
    CallApi api = CallApi();

    Map<String, Object> param = new HashMap();
    param['email'] = _editingControllerName.text;
    param['password'] = _editingControllerPass.text;

    var res = await api.postData(param, 'login', context);
    var body = json.decode(res.body);

    String token = body['token'];
    String token_type = body['token_type'];

    print('token ' + token);

    // if (body['token'] != null) {
    //   api.addtoken(token);
    //   print('if wala block');
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => DashBoard()));
    // } else {
    //   showToast('Invalid Credentials');
    //   // setState(() {
    //   //   ErrorValue = 'Invalid Credentials';
    //   // });
    // }
  }
}
