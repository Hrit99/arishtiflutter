import 'package:flutter/material.dart';
import 'package:flutterapp/apis/getDetailapi.dart';
import 'package:flutterapp/models/dataentry.dart';
import 'package:flutterapp/providers/entryProvider.dart';
import 'package:flutterapp/widgets/dataTile.dart';
import 'package:provider/provider.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({Key key}) : super(key: key);

  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    EntryPro entrypro = Provider.of<EntryPro>(context);
    List<Entry> l = entrypro.getEntries;
    return Scaffold(
        body: Center(
            child: Container(
                child: ListView.separated(
                    itemBuilder: (context, index) => DataTile(
                          address: l[index].address,
                          contact: l[index].contact,
                          name: l[index].name,
                          id: l[index].id,
                        ),
                    separatorBuilder: (context, index) => Container(
                          height: 3,
                          color: Colors.green,
                        ),
                    itemCount: l.length))));
  }
}
