import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String text) {
  return Fluttertoast.showToast(msg: text, gravity: ToastGravity.CENTER);
}

goToPage(BuildContext context, Widget Page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Page));
}

goToPageWithReplace(BuildContext context, Widget Page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => Page));
}