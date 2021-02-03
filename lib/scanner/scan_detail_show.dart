import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:vms/common/common.dart';
import 'package:vms/scanner/scan_hostname.dart';
import 'package:vms/visitors_detail/request_sent.dart';

class ScanDetailsShow extends StatefulWidget {
  String receivedString;

  ScanDetailsShow(this.receivedString);

  @override
  State<StatefulWidget> createState() => _ScanDetailsShowsState();
}

class _ScanDetailsShowsState extends State<ScanDetailsShow> {
  TextEditingController _editingControllerName = TextEditingController();
  TextEditingController _editingControllerIdSubmitted = TextEditingController();
  TextEditingController _editingControllerIdNo = TextEditingController();
  TextEditingController _editingControllerContactNo = TextEditingController();
  TextEditingController _editingControllerHostName = TextEditingController();
  TextEditingController _editingControllerMeetingReason =
      TextEditingController();
  bool _obscureText = false;
  String ErrorValue = "";
  String dropdownValueReason = 'Select Reason';
  String dropdownValueHost = 'Select Host';
  String dropdownValueId = 'Select ID Type';
  bool isEmpty = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    fun();
    // _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => fun());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF073763),
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Verify Visitor's Details"),
        centerTitle: false,
      ),
      body: Container(
        color: Colors.white,
        // margin: const EdgeInsets.all(30),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: ListView(
            children: [
              Container(
                // height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getHeader(
                        'QR Details',
                      ),
                      getSpaceD(15),
                      getHeader(
                        widget.receivedString,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    getHeader("Visitor's Contact No."),
                    getSpace(),
                    getSpace(),
                    TextField(
                      maxLength: 10,
                      controller: _editingControllerContactNo,
                      style: TextStyle(fontSize: 18),
                      onTap: () {
                        setState(() {
                          ErrorValue = '';
                        });
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      // Only numbers can be entered
                      decoration: InputDecoration(
                          hintText: 'Contact Number',
                          hintStyle: TextStyle(fontSize: 15),
                          isDense: true,
                          // errorText: ErrorValue,
                          contentPadding: EdgeInsets.all(10),
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 17),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 10.0,
                        padding: EdgeInsets.all(15.0),
                        onPressed: () {
                          if (!_editingControllerContactNo.text.isEmpty) {
                            goToPage(
                                context,
                                ScanDetails(widget.receivedString,
                                    _editingControllerContactNo.text));
                          } else {
                            // ErrorValue = 'Enter Mobile Number';
                            showToast('Please provide Contact number');
                          }
                        },
                        color: Color(0xFF073763),
                        textColor: Colors.white,
                        child: Text(
                          'Next',
                          style:
                              TextStyle(fontFamily: 'Sans-Serif', fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String Time = "";

  String fun() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm').format(now);
    setState(() {
      Time = formattedDate;
    });
    return formattedDate;
  }

  getHeader(String s) {
    return Text(
      s,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }

  getSpace() {
    return const SizedBox(
      height: 5,
    );
  }

  getSpaceD(double size) {
    return SizedBox(
      height: size,
    );
  }
}
