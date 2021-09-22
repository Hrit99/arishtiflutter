import 'package:flutter/material.dart';
import 'package:flutterapp/apis/getDetailapi.dart';
import 'package:flutterapp/models/dataentry.dart';
import 'package:flutterapp/widgets/dataTile.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({Key key}) : super(key: key);

  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
          child: FutureBuilder(
        future: getDetails(),
        builder: (context, snapshot) {
          print("jjfnjdf");
          print(snapshot.data);
          if (snapshot.hasData) {
            print("dsjfld");
            print(snapshot.data);
            if (snapshot.data != null) {
              List<Entry> l = snapshot.data;
              return ListView.separated(
                  itemBuilder: (context, index) => DataTile(
                        address: l[index].address,
                        contact: l[index].address,
                        name: l[index].name,
                      ),
                  separatorBuilder: (context, index) => Container(
                        height: 3,
                        color: Colors.green,
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
