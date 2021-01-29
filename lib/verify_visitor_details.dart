import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vms/new_login/dashboard.dart';
import 'package:vms/request_sent.dart';
import 'package:vms/visitor_meeting_details.dart';

class VerifyVisitorDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VisitorDetailsComplete();
}

class _VisitorDetailsComplete extends State<VerifyVisitorDetails> {
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
        title: Text("Verify Visitor's Details"),
        centerTitle: false,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Full Name : Felip Morra', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'ID No. : 000123456780000', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Date of Birth : 08/04/1986', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Gender : Male', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'ID Valid Till : 14/09/2029', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Province : Luanda', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Country : Angola', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const Text(
                    'Visitor\'s Contact No.', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    onTap: () {
                      setState(() {
                        ErrorValue = '';
                      });
                    },
                    decoration: InputDecoration(
                        hintText: '8748 45421',
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
                    height: 100,
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
                                    builder: (context) => VisitorMeetingDetails()));
                            print('HElllooooo');
                          },
                          color: Color(0xFF073763),
                          textColor: Colors.white,
                          child: Text(
                            'Next',
                            style:
                                TextStyle(fontFamily: 'Sans-Serif', fontSize: 17),
                          ),
                        )),
                  ]),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
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
