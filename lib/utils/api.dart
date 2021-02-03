import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  final String _url =
      'http://192.168.168.158:8080/visitor_management/public/api/';

  postData(Map<String, Object> data, apiurl, BuildContext context) async {
    var fullUrl = _url + apiurl;

    fullUrl = _url + apiurl + getParam(data);
    print('*********fullUrl: ' + fullUrl);

    var resp = await http.post(fullUrl);
    // print('*********Resp:' + resp.body);
    return resp;
  }

  // Map<String, String> get headers => {
  //   "Content-Type": "application/json",
  //   "Accept": "application/json",
  //   "Host": "",
  // };
  // _setHeaders() => {'Host': '<calculated when request is sent>'};

  addtoken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', token);
  }

  getTokenOnly() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    // //print('token'+token);
    return token;
  }

  getParam(Map<String, Object> data) {
    String param = "";
    for (int i = 0; i < data.length; i++) {
      String key = data.keys.elementAt(i);
      String val = data.values.elementAt(i);
      if (param.isEmpty) {
        param = "?";
      }
      if (i > 0) {
        param = param + "&" + key + "=" + val;
      } else {
        param = param + key + "=" + val;
      }
    }
    return param;
  }
}