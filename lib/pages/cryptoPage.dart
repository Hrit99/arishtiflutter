import 'package:flutter/material.dart';
import 'package:flutterapp/apis/getDetailapi.dart';
import 'package:flutterapp/apis/webapi.dart';
import 'package:flutterapp/models/crypto.dart';
import 'package:flutterapp/models/dataentry.dart';
import 'package:flutterapp/widgets/cryptoTile.dart';
import 'package:flutterapp/widgets/dataTile.dart';

class CryptoPage extends StatefulWidget {
  const CryptoPage({Key key}) : super(key: key);

  @override
  _CryptoPageState createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
          child: FutureBuilder(
        future: webapi(),
        builder: (context, snapshot) {
          print("jjfnjdf");
          print(snapshot.data);
          if (snapshot.hasData) {
            print("dsjfld");
            print(snapshot.data);
            if (snapshot.data != null) {
              List<Crypto> l = snapshot.data;
              return ListView.separated(
                  itemBuilder: (context, index) => CryptoTile(
                        c: l[index],
                      ),
                  separatorBuilder: (context, index) => Container(
                        height: 20,
                        color: Colors.white,
                      ),
                  itemCount: l.length);
            } else {
              return Center(child: Text("no data"));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )),
    ));
  }
}
