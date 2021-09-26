import 'package:flutter/material.dart';
import 'package:flutterapp/apis/submitapi.dart';
import 'package:flutterapp/providers/entryProvider.dart';
import 'package:provider/provider.dart';

class DataTile extends StatelessWidget {
  final String id;
  final String name;
  final String contact;
  final String address;
  const DataTile({Key key, this.name, this.address, this.contact, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    EntryPro entrypro = Provider.of<EntryPro>(context, listen: false);
    return Container(
      height: 200,
      color: Colors.red,
      child: Scaffold(
          body: Center(
              child: Column(
            children: [
              Container(
                  height: 25,
                  color: Colors.orange[100],
                  child: Center(child: Text(name))),
              Container(
                  height: 25,
                  color: Colors.brown[200],
                  child: Center(child: Text(contact))),
              Container(
                  alignment: Alignment.center,
                  height: 150,
                  color: Colors.grey[300],
                  child: Center(child: Text(address))),
            ],
          )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              delete(id: id).then((value) {
                if (value) {
                  entrypro.delEntry = id;
                  print('deleted');
                }
              }).catchError((_) {
                print('do nothing');
              });
            },
            child: Icon(Icons.delete),
          )),
    );
  }
}
