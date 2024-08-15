import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class APiServices {
  final String url = "http://127.0.0.1:8000";
  final String token = "8|BUXyEoiiVWxFe8IHYT7mwiNeMST115diJqRlgTt3ebffa012";
  Future getData({required String endPoint}) async {
    try {
      var data = await http.get(Uri.parse("$url$endPoint"), headers: {
        "Content-Type": "application/json",
        "Cookie": "refresh=$token",
      });
      log(data.statusCode.toString());
      log(data.body.toString());
      return json.decode(data.body);
    } catch (e) {
      log(e.toString());
    }
  }

  Future postData({required String endPoint, required String name}) async {
    var data = await http.post(
      Uri.parse("$url$endPoint"),
      body: json.encode({"email": name}),
    );
    return json.decode(data.body);
  }
}
