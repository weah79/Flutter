import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('First App by Old man'),
              centerTitle: true,
            ),
            body: Home()));
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "สวัสดี flutter",
        style: TextStyle(
            fontSize: 80,
            color: Colors.orange[700],
            fontFamily: "Passadoo",
            fontWeight: FontWeight.bold),
      )),
    );
  }
}

