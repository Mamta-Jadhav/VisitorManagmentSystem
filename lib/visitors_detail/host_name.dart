import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HostName extends StatefulWidget {
  @override
  _HostNameState createState() => _HostNameState();
}

class _HostNameState extends State<HostName> {
  @override
  Widget build(BuildContext context) {
    List<String> lst = List();

    lst.add('Aman Kumar');
    lst.add('Ajit Jadhav');
    lst.add('Manish Agarwal');
    lst.add('Santosh Agarwal');
    lst.add('Sahil Agarwal');
    lst.add('Anaika Agarwal');
    lst.add('Manish Singh');
    lst.add('Jay Agarwal');
    lst.add('Tushti Purna');
    lst.add('Aman Kumar');
    lst.add('Sanam Kumar');

    return Scaffold(
      body: ListView.builder(
        itemCount: lst.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  lst[index],
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
