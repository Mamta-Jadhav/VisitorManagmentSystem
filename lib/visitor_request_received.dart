import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vms/new_login/dashboard.dart';
import 'package:vms/request_sent.dart';

class VisitorRequestReceived extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VisitorDetailsComplete();
}

class _VisitorDetailsComplete extends State<VisitorRequestReceived> {
  TextEditingController _editingControllerName = TextEditingController();
  TextEditingController _editingControllerIdNo = TextEditingController();
  TextEditingController _editingControllerContactNo = TextEditingController();
  bool _obscureText = false;
  String ErrorValue = "";
  String dropdownValueReason = 'Select Reason';
  String dropdownValueHost = 'Select Host';

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
        title: Text("Visitor Request Received"),
        centerTitle: false,
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            ListView(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  'Full Name : Felip Morra',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Province : Luanda',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Country : Angola',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Contact No. : 8748 45421',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                    ],
                  ),
                ),
                Container(
                  child: Stack(
                    children: [
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Meeting Reason',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
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
                                  height: 300,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                        child: RaisedButton(
                                      onPressed: () {},
                                      child: Text("Allow"),
                                      color: Colors.green,
                                      textColor: Colors.white,
                                    )),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                        child: RaisedButton(
                                      onPressed: () {},
                                      child: Text("Reject"),
                                      color: Colors.red,
                                      textColor: Colors.white,
                                    )),
                                  ],
                                ),
                              ])),
                    ],
                  ),
                ),

              ],
            ),
            const SizedBox(
              height: 100,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        // Text('V1.0.2',textAlign: TextAlign.center, ),
      ),
    );
  }

  String fun() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm').format(now);
    return formattedDate;
  }
}
