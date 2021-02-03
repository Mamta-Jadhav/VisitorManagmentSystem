import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:vms/common/common.dart';
import 'package:vms/common/person.dart';
import 'package:vms/scanner/scan_hostname.dart';
import 'package:vms/visitors_detail/request_sent.dart';

class VisitorsHistory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VisitorsHistoryState();
}

class _VisitorsHistoryState extends State<VisitorsHistory> {
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

  List<Person> persons = [
    Person(name: 'ABC', host: 'XYZ', intime: '09:52', outtime: '-:-'),
    Person(name: 'ABC', host: 'XYZ', intime: '08:32', outtime: '12:06'),
    Person(name: 'ABC', host: 'XYZ', intime: '03:20', outtime: '19:54'),
    Person(name: 'ABC', host: 'XYZ', intime: '18:52', outtime: '-:-'),
  ];

  Widget personDetailCard(Person) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.black),
          ),
          child: Card(
            margin: EdgeInsets.zero,
            child: Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Visitor : " + Person.name,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Host : " + Person.host,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "In Time : " + Person.intime,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Out Time : " + Person.outtime,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ))
            ]),
          ),
        ));
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
        title: Text("Visitor Records"),
        centerTitle: false,
      ),

      body: Container(
        color: Colors.white,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ListView(
              padding: const EdgeInsets.all(15),
              children: [
                Text("Today"),
                // personDetailCard(persons),
              ],
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      onPressed: () {},
                      child: Text(
                        "Accepted",
                        style: TextStyle(
                            fontFamily: 'Sans-Serif',
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                      color: Color(0xff95BCF2),
                      textColor: Colors.white,
                    )),
                Expanded(
                    flex: 1,
                    child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      onPressed: () {},
                      child: Text(
                        "Rejected",
                        style: TextStyle(
                            fontFamily: 'Sans-Serif',
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                      color: Color(0xffDCDCDC),
                      textColor: Colors.white,
                    )),
              ],
            ),
            Positioned(
              right: 20,
              bottom: 70,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Color(0xff073763),
                child: Icon(
                  Icons.search,
                  size: 35,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
