import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
          child: Column(
        children: [
          Image.asset('assets/earth.png', scale: 0.5),
          Text(
            "สวัสดีชาวโลก",
            style: TextStyle(
                fontSize: 80,
                color: Colors.orange[700],
                fontFamily: "SdProtector",
                fontWeight: FontWeight.bold),
          )
        ],
      )),
    );
  }
}
