import 'package:flutter/material.dart';
import 'package:flutterapp/models/crypto.dart';

class CryptoTile extends StatelessWidget {
  final Crypto c;
  const CryptoTile({Key key, this.c}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.red,
      child: Center(
          child: Wrap(
        children: [
          Container(
              height: 25,
              color: Colors.orange[100],
              child: Center(child: Text("cp : ${c.cp}"))),
          Container(
              height: 25,
              color: Colors.brown[200],
              child: Center(child: Text("id : ${c.id}"))),
          Container(
              height: 25,
              color: Colors.orange[100],
              child: Center(child: Text("mktcap : ${c.marketcap}"))),
          Container(
              height: 25,
              color: Colors.brown[200],
              child: Center(child: Text("max supply : ${c.maxsupply}"))),
          Container(
              height: 25,
              color: Colors.orange[100],
              child: Center(child: Text("name : ${c.name}"))),
          Container(
              height: 25,
              color: Colors.brown[200],
              child: Center(child: Text("priceUsd : ${c.pusd}"))),
          Container(
              height: 25,
              color: Colors.brown[200],
              child: Center(child: Text("rank : ${c.rank}"))),
          Container(
              height: 25,
              color: Colors.brown[200],
              child: Center(child: Text("supply : ${c.supply}"))),
          Container(
              height: 25,
              color: Colors.brown[200],
              child: Center(child: Text("symbol : ${c.symbol}"))),
          Container(
              height: 25,
              color: Colors.brown[200],
              child: Center(child: Text("volume : ${c.volume}"))),
          Container(
              height: 25,
              color: Colors.brown[200],
              child: Center(child: Text("vw : ${c.vw}")))
        ],
      )),
    );
  }
}
