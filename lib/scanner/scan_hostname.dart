import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vms/common/common.dart';
import 'package:vms/visitors_detail/request_sent.dart';

class ScanDetails extends StatefulWidget {
  String receivedString;
  String contactNo;

  ScanDetails(this.receivedString, this.contactNo);

  @override
  State<StatefulWidget> createState() => _ScanDetailsState();
}

class _ScanDetailsState extends State<ScanDetails> {
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
        title: Text("Visitor's Meeting Details"),
        centerTitle: false,
      ),
      body: Container(
        color: Colors.white,
        // margin: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Container(
              height: 300,
              color: Color(0xffEEEEEE),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getSpaceD(5),
                    getHeader(
                      widget.receivedString,
                    ),
                    getSpaceD(5),
                    getHeader(
                      'CONTACT NUMBER : ' + widget.contactNo,
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
                  getHeader(
                    'Host Name',
                  ),
                  getSpace(),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValueHost,
                      icon: Icon(Icons.arrow_drop_down_sharp),
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
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValueReason,
                      icon: Icon(Icons.arrow_drop_down_sharp),
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
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: Color(0xffEEEEEE),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text('In Time',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15)),
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
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 10.0,
                      padding: EdgeInsets.all(15.0),
                      onPressed: () {
                        goToPageWithReplace(
                            context, RequestSent(dropdownValueHost));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => RequestSent()));
                        print('HElllooooo');
                      },
                      color: Color(0xFF073763),
                      textColor: Colors.white,
                      child: Text(
                        'Send Entry Request',
                        style:
                            TextStyle(fontFamily: 'Sans-Serif', fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: RaisedButton(
                            padding: EdgeInsets.all(15.0),
                            onPressed: () {},
                            child: Text(
                              "Allow Entry",
                              style: TextStyle(
                                  fontFamily: 'Sans-Serif', fontSize: 20),
                            ),
                            color: Color(0xff32760A),
                            textColor: Colors.white,
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          flex: 1,
                          child: RaisedButton(
                            padding: EdgeInsets.all(15.0),
                            onPressed: () {},
                            child: Text(
                              "Reject Entry",
                              style: TextStyle(
                                  fontFamily: 'Sans-Serif', fontSize: 20),
                            ),
                            color: Color(0xffA60000),
                            textColor: Colors.white,
                          )),
                    ],
                  ),
                ],
              ),
            )
          ],
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
