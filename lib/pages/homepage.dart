import 'package:flutter/material.dart';
import 'package:flutterapp/apis/submitapi.dart';
import 'package:flutterapp/models/dataentry.dart';
import 'package:flutterapp/pages/cryptoPage.dart';
import 'package:flutterapp/pages/displayPage.dart';
import 'package:flutterapp/providers/entryProvider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController namectr = new TextEditingController();
  TextEditingController cctr = new TextEditingController();
  TextEditingController actr = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    EntryPro entrypro = Provider.of<EntryPro>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Container(
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Entry Page"),
              Container(
                height: 70,
                width: 300,
                color: Colors.grey[200],
                child: TextFormField(
                  controller: namectr,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(hintText: "name"),
                ),
              ),
              Container(
                height: 70,
                width: 300,
                color: Colors.grey[200],
                child: TextFormField(
                  controller: cctr,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(hintText: "contact"),
                ),
              ),
              Container(
                height: 70,
                width: 300,
                color: Colors.grey[200],
                child: TextFormField(
                  controller: actr,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(hintText: "address"),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.of(context).push(
                //         PageRouteBuilder(
                //             transitionDuration: Duration(seconds: 1),
                //             opaque: false,
                //             pageBuilder:
                //                 (context, animation, secondaryAnimation) =>
                //                     DisplayPage()),
                //       );
                //     },
                //     child: Text("Display")),
                ElevatedButton(
                    onPressed: () {
                      if ((namectr.value.text != null) &&
                          (cctr.value.text != null) &&
                          (actr.value.text != null)) {
                        print(actr.value.text);
                        submit(
                                name: namectr.value.text,
                                contact: cctr.value.text,
                                address: actr.value.text)
                            .then((value) {
                          if (value != null) {
                            entrypro.addEntry = Entry(
                                id: value,
                                address: actr.value.text,
                                contact: cctr.value.text,
                                name: namectr.value.text);

                            print("true");
                          } else {
                            print("false");
                          }
                          namectr.clear();
                          cctr.clear();
                          actr.clear();
                        });
                      } else {
                        namectr.clear();
                        cctr.clear();
                        actr.clear();
                      }
                    },
                    child: Text("Submit")),
              ]),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            opaque: false,
            pageBuilder: (context, animation, secondaryAnimation) =>
                CryptoPage()));
      }),
    );
  }
}
