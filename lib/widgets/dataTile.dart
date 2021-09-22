import 'package:flutter/material.dart';

class DataTile extends StatelessWidget {
  final String name;
  final String contact;
  final String address;
  const DataTile({Key key, this.name, this.address, this.contact})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.red,
      child: Center(
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
    );
  }
}
