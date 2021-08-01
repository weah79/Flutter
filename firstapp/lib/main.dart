import 'package:flutter/material.dart';
import 'dart:math' as math;

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text('เเอพคำนวณ')),
          body: Home(),
        ));
  }
}

class Home extends StatefulWidget {
  //const Home({ Key? key }) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var ctl_weight = TextEditingController();
  var ctl_height = TextEditingController();
  var result = '----------';
  var evaluateText = '';
  var evaluateResult = '';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
          child: Center(
              child: Column(
            children: [
              Image.asset(
                'assets/bmi.png',
                scale: 1.5,
              ),
              Text(
                'โปรแกรมคำนวณ BMI',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ctl_weight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'น้ำหนัก (กิโลกรัม)',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ctl_height,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'ส่วนสูง (เซนติเมตร)',
                    border: OutlineInputBorder()),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: ElevatedButton(
                  child: Text("คำนวณ"),
                  onPressed: () {
                    var weight = double.parse(ctl_weight.text);
                    var height = double.parse(ctl_height.text);
                    double calculate = weight / math.pow((height / 100), 2);

                    var calculateDisplay = calculate.toStringAsFixed(2);

                    //print("ค่า BMI ของคุณ: $calculateDisplay\nอยู่ในเกณฑ์:: $evaluate");

                    setState(() {
                      result =
                          "น้ำหนัก: $weight กิโลกรัม\nส่วนสูง: $height เซนติเมตร\nค่า BMI ของคุณ: $calculateDisplay";
                      evaluateText = "อยู่ในเกณฑ์: ";
                      if (calculate < 18.5) {
                        evaluateResult = "ผอม";
                      } else if (calculate <= 22.9) {
                        evaluateResult = "ปกติ";
                      } else if (calculate <= 24.9) {
                        evaluateResult = "ท้วม";
                      } else if (calculate <= 29.9) {
                        evaluateResult = "อ้วน";
                      } else {
                        evaluateResult = "อ้วนมาก";
                      }
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(50, 10, 50, 10)),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 25)),
                  ),
                ),
              ),
              Text(result, style: TextStyle(fontSize: 25)),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                child: Row(
                  children: [
                    Text(evaluateText,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        )),
                    Text(evaluateResult,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: _getColor(evaluateResult))),
                  ],
                ),
              ),
            ],
          )),
        )
      ],
    );
  }
}

Color _getColor(String input) {
  if (input == "ผอม") {
    return Colors.grey.shade600;
  }

  if (input == "ปกติ") {
    return Colors.green;
  }

  if (input == "ท้วม") {
    return Colors.pink.shade400;
  }

  if (input == "อ้วน") {
    return Colors.red.shade400;
  }

  if (input == "อ้วนมาก") {
    return Colors.red.shade900;
  }

  return Colors.black;
}
