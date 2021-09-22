import 'package:flutter/material.dart';
import 'package:flutterapp/models/crypto.dart';
import 'package:flutterapp/models/dataentry.dart';
import 'package:flutterapp/widgets/dataTile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Crypto>> webapi() async {
  var valid;
  var url = Uri.parse('https://api.coincap.io/v2/assets');
  await http.get(url).then((response) {
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse['data']);
      valid = jsonResponse['data'];
      print(valid.length);
      List<Crypto> ll = List.from(valid
          .map((e) => Crypto(
                cp: e["changePercent24Hr"],
                id: e["id"],
                marketcap: e["marketCapUsd"],
                maxsupply: e["maxSupply"],
                name: e["name"],
                pusd: e["priceUsd"],
                rank: e["rank"],
                supply: e["supply"],
                symbol: e["symbol"],
                volume: e["volumeUsd24Hr"],
                vw: e["vwap24Hr"],
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
