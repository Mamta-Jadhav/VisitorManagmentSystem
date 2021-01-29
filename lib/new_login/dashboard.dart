import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vms/QR_code_scan.dart';
import 'package:vms/add_visitor_meeting_details.dart';
import 'package:vms/visitor_details_complete.dart';
import 'package:vms/visitor_request_received.dart';

import '../visitor_records.dart';

class DashBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashBoard();
}

class _DashBoard extends State<DashBoard> {
  List<Dash> lst = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/vmsnewtabicon.png',
          height: 80,
          width: 80,
        ),
        // backgroundColor: Colors.blue[900],
        backgroundColor: Color(0xFF073763),
        // #073763
        leading: Icon(
          Icons.wrap_text,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          InkWell(
            child: Container(
              height: 200,
              // color: Color(0xFFF3C0C0),
              decoration: BoxDecoration(
                  color: Color(0xFFF3C0C0),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code_scanner,
                    size: 45,
                  ),
                  Text(
                    "Scan Visitor's QR ID",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            onTap: () {
              print("tapped on container");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QRCodeSCan()));
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              height: 200,
              // color: Color(0xFFF3C0C0),
              decoration: BoxDecoration(
                  color: Color(0xFFF3C0C0),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_add_alt_1_sharp,
                    size: 45,
                  ),
                  Text(
                    "Enter Visitor Details",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            onTap: () {
              print("tapped on container");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          VisitorDetailsComplete())); //AddVisitorMeetingDetails()));
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              height: 200,
              // color: Color(0xFFF3C0C0),
              decoration: BoxDecoration(
                  color: Color(0xFFF3C0C0),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.view_list,
                    size: 45,
                  ),
                  Text(
                    "View Records",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            onTap: () {
              print("tapped on container");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VisitorRequestReceived()));
            },
          ),
        ],
      ),
    );
  }
}

class Dash {
  IconData icon;
  String name;

  Dash(this.icon, this.name);
}