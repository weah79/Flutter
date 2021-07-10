import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//{"Confirmed":289233,"Recovered":223437,"Hospitalized":63520,"Deaths":2276,"NewConfirmed":6166,"NewRecovered":2534,"NewHospitalized":3582,"NewDeaths":50,"UpdateDate":"05\/07\/2021 22:16"
  var confirmed = TextEditingController();
  var recovered = TextEditingController();
  var hospitalized = TextEditingController();
  var deaths = TextEditingController();
  var newConfirmed = TextEditingController();
  var newRecovered = TextEditingController();
  var newHospitalized = TextEditingController();
  var newDeaths = TextEditingController();
  var updateDate = TextEditingController();

  @override
  void initState() {
    super.initState();
    confirmed.text = '-';
    recovered.text = '-';
    hospitalized.text = '-';
    deaths.text = '-';
    newConfirmed.text = '-';
    newRecovered.text = '-';
    newDeaths.text = '-';
    updateDate.text = '-';
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Checker by Old man'),
        actions: [
          IconButton(
              onPressed: () {
                print('Get Data Covid');
                _GetCovidData();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 30),
          Center(
            child: Text(
              'ติดเชื้อสะสม',
              style: TextStyle(fontSize: 20, color: Colors.orange[800]),
            ),
          ),
          Center(
            child: Text(
              confirmed.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              'หายแล้ว',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              recovered.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              'รักษาอยู่ใน รพ',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              hospitalized.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              'เสียชีวิต',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              deaths.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              'ติดเชื้อเพิ่ม',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              newConfirmed.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              'หายแล้วเพิ่ม',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              newRecovered.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              'รักษาอยู่ใน รพ เพิ่ม',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              newHospitalized.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              'เสียชีวิตเพิ่ม',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              newDeaths.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              'ข้อมูลล่าสุด',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              updateDate.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  Future _GetCovidData() async {
    var url =
        Uri.http('covid19.th-stat.com', '/json/covid19v2/getTodayCases.json');
    var response = await http.get(url);

    print('----DATA----');
    print(response.body);

    var result = json.decode(response.body);
    var v1 = result['Confirmed'];
    var v2 = result['Recovered'];
    var v3 = result['Hospitalized'];
    var v4 = result['Deaths'];
    var v5 = result['NewConfirmed'];
    var v6 = result['NewRecovered'];
    var v7 = result['NewHospitalized'];
    var v8 = result['NewDeaths'];
    var v9 = result['UpdateDate'];

    var formatter = NumberFormat('###,###,###');
    
    setState(() {
      confirmed.text = formatter.format(v1);
      recovered.text = formatter.format(v2);
      hospitalized.text = formatter.format(v3);
      deaths.text = formatter.format(v4);
      newConfirmed.text = formatter.format(v5);
      newRecovered.text = formatter.format(v6);
      newHospitalized.text = formatter.format(v7);
      newDeaths.text = formatter.format(v8);
      updateDate.text = v9;
    });
  }
}
