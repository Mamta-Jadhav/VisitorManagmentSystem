import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vms/common/common.dart';
import 'package:vms/history/visitor_history.dart';
import 'package:vms/history/visitor_records.dart';
import 'package:vms/scanner/scan_qr_page.dart';
import 'package:vms/visitors_detail/add_visitor_meeting_details.dart';

class DashBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashBoard();
}

class _DashBoard extends State<DashBoard> {
  List<Dash> lst = List();

  // void showOption() {
  //   showMaterialModalBottomSheet(
  //     backgroundColor: Colors.transparent,
  //     context: context,
  //     builder: (context) => Container(
  //       child: Padding(
  //         padding: const EdgeInsets.all(15.0),
  //         child: Wrap(
  //           children: [
  //             Container(
  //               decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(10),
  //                   shape: BoxShape.rectangle),
  //               child: Column(
  //                 children: [
  //                   InkWell(
  //                     onTap: () {
  //                       Navigator.pop(context);
  //                       // showAlertDialog(context);
  //                     },
  //                     child: Container(
  //                       color: Colors.white,
  //                       // width: double.infinity,
  //                       child: Padding(
  //                         padding: const EdgeInsets.all(15.0),
  //                         child: Text(
  //                           'Update Profile',
  //                           textAlign: TextAlign.center,
  //                           style: GoogleFonts.lato(
  //                               fontSize: 18, fontWeight: FontWeight.normal),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     // width: getScreenWidth(context),
  //                     height: 1,
  //                     color: Colors.grey,
  //                   ),
  //                   InkWell(
  //                     onTap: () {
  //                       Navigator.pop(context);
  //                       // cameraconnect();
  //                     },
  //                     child: Container(
  //                       color: Colors.white,
  //                       // width: getScreenWidth(context),
  //                       child: Padding(
  //                         padding: const EdgeInsets.all(15.0),
  //                         child: Text(
  //                           'Change Password',
  //                           textAlign: TextAlign.center,
  //                           style: GoogleFonts.lato(
  //                               fontSize: 18, fontWeight: FontWeight.normal),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     // width: getScreenWidth(context),
  //                     height: 1,
  //                     color: Colors.grey,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Container(
  //               height: 10,
  //               color: Colors.transparent,
  //             ),
  //             InkWell(
  //               onTap: () {
  //                 Navigator.pop(context);
  //               },
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                     color: Colors.white,
  //                     borderRadius: BorderRadius.circular(5),
  //                     shape: BoxShape.rectangle),
  //                 width: double.infinity,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(15.0),
  //                   child: Text(
  //                     'Logout',
  //                     textAlign: TextAlign.center,
  //                     style: GoogleFonts.lato(
  //                         fontSize: 18, fontWeight: FontWeight.normal),
  //                   ),
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Sagar Jadhav',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'NIS158',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Nectar Infotel Pvt.Ltd',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'GateKeeper',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue[50],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.lock,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Change Password',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.language,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Change language',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.info,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'About Us',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.logout,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        // leading: InkWell(
        //     onTap: () {
        //       // showOption();
        //     },
        //     child: Icon(
        //       Icons.menu,
        //       size: 30,
        //     )),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset(
          'assets/images/logo_png.png',
          height: 80,
          width: 80,
        ),
        backgroundColor: Colors.grey[200],
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.notifications,
              color: Colors.blueAccent,
              size: 30,
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                height: 150,
                // color: Color(0xFFF3C0C0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage('assets/images/qr_code_scanner_48.png'),
                      color: Color(0xff37b5ff),
                      size: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Scan Visitor ID",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => QRPage()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(
                height: 150,
                // color: Color(0xFFF3C0C0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage('assets/images/person_add_48.png'),
                      color: Color(0xff37b5ff),
                      size: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Enter Visitor Details",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => QRPage()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                goToPage(context, VisitorRecordss());
              },
              child: Container(
                height: 150,
                // color: Color(0xFFF3C0C0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage('assets/images/view_list_48.png'),
                      color: Color(0xff37b5ff),
                      size: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "View Records",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Dash {
  IconData icon;
  String name;

  Dash(this.icon, this.name);
}
