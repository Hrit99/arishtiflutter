import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> submit(
    {@required String name,
    @required String contact,
    @required String address}) async {
  var valid;
  var url = Uri.parse('https://salty-refuge-64610.herokuapp.com/user/store');
  await http
      .post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{'name': name, 'contact': contact, 'address': address}),
  )
      .then((response) {
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse['stored']);
      valid = jsonResponse['id'];
    } else {
      print('false');
      valid = null;
    }
  }).catchError((error) {
    print("error occured");
    valid = null;
  });
  return valid;
}

Future<bool> delete({@required String id}) async {
  var valid;
  var url = Uri.parse('https://salty-refuge-64610.herokuapp.com/user/delete');
  await http
      .post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'id': id}),
  )
      .then((response) {
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse['deleted']);
      valid = jsonResponse['deleted'];
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
