import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vms/new_login/dashboard.dart';
import 'package:vms/request_sent.dart';

class AddVisitorMeetingDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddVisitorMeetingDetails();
}

class _AddVisitorMeetingDetails extends State<AddVisitorMeetingDetails> {
  TextEditingController _editingControllerName = TextEditingController();
  TextEditingController _editingControllerIdNo = TextEditingController();
  TextEditingController _editingControllerContactNo = TextEditingController();
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF073763),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Add Visitor's Details"),
        centerTitle: false,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            ListView(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Full Name',
                ),
                const SizedBox(
                  height: 2,
                ),
                TextField(
                  controller: _editingControllerName,
                  style: TextStyle(color: Colors.black, fontSize: 17),
                  onTap: () {
                    setState(() {
                      ErrorValue = '';
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Full Name',
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                const Text(
                  'ID Submitted',
                ),
                const SizedBox(
                  height: 2,
                ),
                Container(
                  height: 30,
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: dropdownValueId,
                    icon: Icon(Icons.arrow_drop_down_sharp),
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
                      'One',
                      'Two',
                      'Free',
                      'Four'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'ID No.',
                ),
                const SizedBox(
                  height: 2,
                ),
                TextField(
                  controller: _editingControllerIdNo,
                  style: TextStyle(color: Colors.black, fontSize: 17),
                  onTap: () {
                    setState(() {
                      ErrorValue = '';
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Full ID No.',
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                const Text(
                  'Contact No.',
                ),
                const SizedBox(
                  height: 2,
                ),
                TextField(
                  controller: _editingControllerContactNo,
                  style: TextStyle(color: Colors.black, fontSize: 17),
                  onTap: () {
                    setState(() {
                      ErrorValue = '';
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Mobile No.',
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                const Text(
                  'Host Name',
                ),
                const SizedBox(
                  height: 2,
                ),
                Container(
                  height: 30,
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                    items: <String>['Select Host', 'One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Meeting Reason',
                ),
                const SizedBox(
                  height: 2,
                ),
                Container(
                  height: 30,
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                      'One',
                      'Two',
                      'Free',
                      'Four'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
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
                    border: Border.all(color: Colors.grey),
                    color: const Color(0xffE8E8E8),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text('In Time',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15)),
                      Text(fun(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25)),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Expanded(
                      flex: 1,
                      // fit: FlexFit.loose,
                      child: RaisedButton(
                        padding: EdgeInsets.all(12.0),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RequestSent()));
                          print('HElllooooo');
                        },
                        color: Color(0xFF073763),
                        textColor: Colors.white,
                        child: Text(
                          'Send Entry Request',
                          style:
                              TextStyle(fontFamily: 'Sans-Serif', fontSize: 17),
                        ),
                      )),
                ]),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      onPressed: () {},
                      child: Text("Allow Entry"),
                      color: Colors.green,
                      textColor: Colors.white,
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: RaisedButton(
                      onPressed: () {},
                      child: Text("Reject Entry"),
                      color: Colors.red,
                      textColor: Colors.white,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            // Text('V1.0.2',textAlign: TextAlign.center, ),
          ],
        ),
      ),
    );
  }

  String fun()
  {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm').format(now);
    return formattedDate;
  }
}
