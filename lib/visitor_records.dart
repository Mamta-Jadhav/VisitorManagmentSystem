import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'person.dart';

class VisitorRecordss extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<VisitorRecordss> {
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
                children: <Widget>[
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF073763),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Visitor Records"),
          centerTitle: false,
        ),
        body: Column(
          children: <Widget> [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                    // color: Color(0xFFF3C0C0),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Today',
                            style: TextStyle(fontSize: 20, color: Color(0xFF073763)),
                          ),
                        ),
                        Column(
                            children: persons.map((p) {
                          return personDetailCard(p);
                        }).toList()),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            '30 Dec 2020',
                            style: TextStyle(fontSize: 20, color: Color(0xFF073763)),
                          ),
                        ),
                        Column(
                            children: persons.map((p) {
                          return personDetailCard(p);
                        }).toList()),
                      ]),
                    ])),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text("Accepted"),
                      color: Color(0xFF00ADD2),
                      textColor: Colors.black,
                    )),
                Expanded(
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text("Rejected"),
                      textColor: Colors.black,
                    )),
              ],
            )
          ],
        ));
  }
}
