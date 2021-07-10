import 'package:flutter/material.dart';
import 'dart:math' as math;

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
  var ctl_radius = TextEditingController();
  var result = '-----Result-----';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(children: [
          Center(
            child: Text(
              'เเอปคำนวณพื้นที่วงกลม',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  fontFamily: 'SdProtector',
                  color: Colors.blue[900]),
            ),
          ),
          Icon(
            Icons.calculate_rounded,
            size: 80,
            color: Colors.orange,
          )
        ], mainAxisAlignment: MainAxisAlignment.center),
        Padding(
          padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: Image.asset('assets/circle.png', scale: 0.5),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: TextField(
              controller: ctl_radius,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'รัศมี', border: OutlineInputBorder()),
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: ElevatedButton(
            style: raiseButtonStyle,
            onPressed: () {
              var radius = int.parse(ctl_radius.text);
              var area = math.pi * (radius * radius);
              print("Area: $area");
              setState(() {
                result = "ผลลัพธ์\nรัศมี: $radius\nพื้นที่วงกลม: $area";
              });
            },
            child: Text(
              'คำนวณ',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: Text(
              result,
              style: TextStyle(fontSize: 30.0),
            )),
      ],
    );
  }
}

final ButtonStyle raiseButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.blue[400],
  primary: Colors.blue[900],
  minimumSize: Size(88, 50),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
);
