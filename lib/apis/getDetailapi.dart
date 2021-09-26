import 'package:flutter/material.dart';
import 'package:flutterapp/models/dataentry.dart';
import 'package:flutterapp/widgets/dataTile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Entry>> getDetails() async {
  var valid;
  var url = Uri.parse('https://salty-refuge-64610.herokuapp.com/user/');
  await http.get(url).then((response) {
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse['response']);
      valid = jsonResponse['response'];
      print(valid.length);
      List<Entry> ll = List.from(valid
          .map((e) => Entry(
                id: e['_id'],
                address: e['address'],
                contact: e['contact'],
                name: e['name'],
              ))
          .toList());
      print("jfnds");
      for (var item in ll) {
        print(item.name);
      }
      valid = ll;
    } else {
      print('false');
      valid = [];
    }
  }).catchError((error) {
    print("error occured");
    valid = [];
  });
  return valid;
}
