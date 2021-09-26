// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterapp/apis/getDetailapi.dart';
import 'package:flutterapp/models/dataentry.dart';
import 'package:flutterapp/pages/cryptoPage.dart';
import 'package:flutterapp/pages/displayPage.dart';
import 'package:flutterapp/pages/homepage.dart';
import 'package:flutterapp/providers/entryProvider.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int _selectedPage = 0;
  // bool? _accessGiven = false;
  EntryPro entrypro;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    entrypro = Provider.of<EntryPro>(context, listen: false);
  }

  Future<bool> fetchServAndSubServ() async {
    // await Future.delayed(Duration(seconds: 5));
    //set services and subservices
    List<Entry> el = await getDetails();
    entrypro.setAllEntries(el);
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    // cttx = context;
    print("hp");
    // var locationpro = Provider.of<LocationPro>(context);
    List<Widget> _screens = [Homepage(), DisplayPage(), CryptoPage()];
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: FutureBuilder(
                future: fetchServAndSubServ(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data == true) {
                      print(_screens.length);
                      return Scaffold(
                        backgroundColor: Colors.white,
                        body: _screens[_selectedPage],
                        bottomNavigationBar: BottomNavigationBar(
                          items: [
                            BottomNavigationBarItem(
                                icon: Icon(Icons.home),
                                label: "Submit",
                                backgroundColor: Colors.transparent),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.photo_library),
                                label: "Display",
                                backgroundColor: Colors.transparent),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.account_circle_rounded),
                                label: "Crypto",
                                backgroundColor: Colors.transparent),
                          ],
                          currentIndex: _selectedPage,
                          onTap: (index) {
                            setState(() {
                              _selectedPage = index;
                            });
                          },
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
