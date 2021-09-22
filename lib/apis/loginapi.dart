import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> login({@required String un, @required String pw}) async {
  var valid;
  var url = Uri.parse('https://salty-refuge-64610.herokuapp.com/cred/login');
  await http
      .post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': un,
      'password': pw,
    }),
  )
      .then((response) {
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse['logedin']);
      valid = jsonResponse['logedin'];
    } else {
      print('false');
      valid = false;
    }
  }).catchError((error) {
    print("error occured");
    valid = false;
  });
  return valid;
}
