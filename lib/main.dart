import 'package:flutter/material.dart';
import 'package:flutterapp/apis/loginapi.dart';
import 'package:flutterapp/apis/signupapi.dart';
import 'package:flutterapp/pages/homepage.dart';
import 'package:flutterapp/pages/initialPage.dart';
import 'package:flutterapp/providers/entryProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EntryPro(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController uctr = new TextEditingController();
  TextEditingController pctr = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Login Page"),
            Container(
              height: 70,
              width: 300,
              color: Colors.grey[200],
              child: TextFormField(
                controller: uctr,
                cursorColor: Colors.black,
                decoration: InputDecoration(hintText: "Username"),
              ),
            ),
            Container(
              height: 70,
              width: 300,
              color: Colors.grey[200],
              child: TextFormField(
                controller: pctr,
                cursorColor: Colors.black,
                obscureText: true,
                decoration: InputDecoration(hintText: "Password"),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                  onPressed: () {
                    signup(un: uctr.value.text, pw: pctr.value.text)
                        .then((value) {
                      pctr.clear();
                      uctr.clear();
                      if (value) {
                        print("true");
                      } else {
                        print("false");
                      }
                    });
                  },
                  child: Text("SignUp")),
              ElevatedButton(
                  onPressed: () {
                    login(un: uctr.value.text, pw: pctr.value.text)
                        .then((value) {
                      pctr.clear();
                      uctr.clear();
                      if (value) {
                        print("true");
                        Navigator.of(context).pushAndRemoveUntil(
                            PageRouteBuilder(
                                transitionDuration: Duration(seconds: 1),
                                opaque: false,
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        InitialPage()),
                            (Route<dynamic> route) => false);
                      } else {
                        print("false");
                      }
                    });
                  },
                  child: Text("Login"))
            ]),
          ],
        ),
      ),
    ));
  }
}
