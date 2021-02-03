import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vms/common/common.dart';
import 'package:vms/visitors_detail/host_name.dart';
import 'package:vms/visitors_detail/request_sent.dart';

class AddVisitorMeetingDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddVisitorMeetingDetails();
}

class _AddVisitorMeetingDetails extends State<AddVisitorMeetingDetails> {
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


  @override
  void initState() {
    fun();
    // _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => fun());
    super.initState();
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          child: Icon(Icons.arrow_back_sharp, color: Colors.black),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Visitor Details", style: TextStyle(color: Colors.black),),
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
            padding: EdgeInsets.all(10),
            children: [
              getHeader("Visitor Name"),
              getSpace(),
              TextField(
                // controller: _editingControllerName,
                style: TextStyle(fontSize: 18),
                onTap: () {
                  setState(() {
                    ErrorValue = '';
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Enter Full Name',
                    hintStyle: TextStyle(fontSize: 15),
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelStyle: TextStyle(color: Colors.white, fontSize: 17),
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
                height: 15,
              ),
              getHeader('ID Type'),
              getSpace(),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: DropdownButton<String>(
                  value: dropdownValueId,
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                  iconSize: 30,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValueId = newValue;
                    });
                  },
                  isExpanded: true,
                  items: <String>[
                    'Select ID Type',
                    'Passport',
                    'Driving License',
                    'BI'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              getHeader('ID No.'),
              getSpace(),
              TextField(
                textCapitalization: TextCapitalization.characters,
                // controller: _editingControllerName,
                style: TextStyle(fontSize: 18),
                onTap: () {
                  setState(() {
                    ErrorValue = '';
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Enter Full ID No.',
                    hintStyle: TextStyle(fontSize: 15),
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelStyle: TextStyle(color: Colors.white, fontSize: 17),
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
                height: 15,
              ),
              getHeader(
                'Contact No.',
              ),
              getSpace(),
              TextField(
                keyboardType: TextInputType.phone,
                // controller: _editingControllerName,
                style: TextStyle(fontSize: 18),
                onTap: () {
                  setState(() {
                    ErrorValue = '';
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Enter Mobile No.',
                    hintStyle: TextStyle(fontSize: 15),
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelStyle: TextStyle(color: Colors.white, fontSize: 17),
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
                height: 15,
              ),
              getHeader(
                'Host Name',
              ),
              getSpace(),

              // InkWell(
              //   onTap: (){
              //     goToPage(context, HostName());
              //   },
              //   child: Container(
              //     height: 40,
              //     decoration: BoxDecoration(
              //       border: Border.all(
              //         color: Colors.black,
              //       ),
              //     ),
              //   ),
              // ),

              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: DropdownButton<String>(
                  value: dropdownValueHost,
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                  iconSize: 30,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValueHost = newValue;
                    });
                  },
                  isExpanded: true,
                  items: <String>[
                    'Select Host',
                    'Aman Kumar',
                    'Ajit Jadhav',
                    'Manish Agarwal',
                    'Santosh Agarwal',
                    'Sahil Agarwal',
                    'Anaika Agarwal',
                    'Manish Singh',
                    'Jay Agarwal',
                    'Tushti Purna'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              getHeader('Meeting Reason'),
              getSpace(),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: DropdownButton<String>(
                  value: dropdownValueReason,
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                  iconSize: 30,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValueReason = newValue;
                    });
                  },
                  isExpanded: true,
                  items: <String>[
                    'Select Reason',
                    'Meeting',
                    'Interview',
                    'Repair Work',
                    'Delivery',
                    'Other'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(value),
                      ),
                    );
                  }).toList(),
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff37b5ff)),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text('In Time',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: Color(0xff37b5ff))),
                    Text(Time,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5)),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RaisedButton(
                padding: EdgeInsets.all(15.0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RequestSent(dropdownValueHost)));
                  print('HElllooooo');
                },
                color: Color(0xff37b5ff),
                textColor: Colors.white,
                child: Text(
                  'Send Entry Request',
                  style: TextStyle(fontFamily: 'Sans-Serif', fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //         flex: 1,
              //         child: RaisedButton(
              //           padding: EdgeInsets.all(15.0),
              //           onPressed: () {},
              //           child: Text(
              //             "Allow Entry",
              //             style:
              //                 TextStyle(fontFamily: 'Sans-Serif', fontSize: 20),
              //           ),
              //           color: Color(0xff4ad604),
              //           textColor: Colors.white,
              //         )),
              //     const SizedBox(
              //       width: 15,
              //     ),
              //     Expanded(
              //         flex: 1,
              //         child: RaisedButton(
              //           padding: EdgeInsets.all(15.0),
              //           onPressed: () {},
              //           child: Text(
              //             "Reject Entry",
              //             style:
              //                 TextStyle(fontFamily: 'Sans-Serif', fontSize: 20),
              //           ),
              //           color: Color(0xffe92821),
              //           textColor: Colors.white,
              //         )
              //     ),
              //   ],
              // ),
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
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }

  getSpace() {
    return const SizedBox(
      height: 5,
    );
  }
}