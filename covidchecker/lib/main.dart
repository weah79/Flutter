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
    // var url =
    //     Uri.http('covid19.th-stat.com', '/json/covid19v2/getTodayCases.json');
    // var response = await http.get(url);

    // print('----DATA----');
    // print(response.body);

    // var result = json.decode(response.body);
    // var v1 = result['Confirmed'];
    // var v2 = result['Recovered'];
    // var v3 = result['Hospitalized'];
    // var v4 = result['Deaths'];
    // var v5 = result['NewConfirmed'];
    // var v6 = result['NewRecovered'];
    // var v7 = result['NewHospitalized'];
    // var v8 = result['NewDeaths'];
    // var v9 = result['UpdateDate'];

    // var formatter = NumberFormat('###,###,###');

    // setState(() {
    //   confirmed.text = formatter.format(v1);
    //   recovered.text = formatter.format(v2);
    //   hospitalized.text = formatter.format(v3);
    //   deaths.text = formatter.format(v4);
    //   newConfirmed.text = formatter.format(v5);
    //   newRecovered.text = formatter.format(v6);
    //   newHospitalized.text = formatter.format(v7);
    //   newDeaths.text = formatter.format(v8);
    //   updateDate.text = v9;
    // });

    print('----DATA----');
    // var headers = {
    //   'Accept-Language': 'en-GB,th-TH',
    //   'Accept': 'application/json'
    // };
    // var request = http.Request(
    //     'GET',
    //     Uri.parse(
    //         'https://th-sombatp-nb2.orion.internal/MainLocalComponents/api-cert/back-office/patient-finance/policy-authorizations/?patientReferralIdentifier=27116@urn:orion:pas:referral:patient-referral:referral-number'));
    // request.body = '''''';
    // request.headers.addAll(headers);

    // http.StreamedResponse response = await request.send();

    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    // } else {
    //   print(response.reasonPhrase);
    // }

    var headers = {
      'Accept-Language': 'en-GB,th-TH',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6InlWTWptUUhwRzJvYU8xeEFTZ0hIVklHUURkUSJ9.eyJhdXRobWV0aG9kIjoiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2F1dGhlbnRpY2F0aW9ubWV0aG9kL3Bhc3N3b3JkIiwiYXV0aF90aW1lIjoiMjAyMS0wOS0yMFQwOTo0NzozMi45ODc3MTYyWiIsImh0dHA6Ly9zY2hlbWFzLm9yaW9uaGVhbHRoLmNvbS93cy8yMDE0LzEwL2lkZW50aXR5L2NsYWltcy9lbXBsb3llZS1pZCI6IkFFNDU0RTM3LTdEODctMTFERC04MzJELTAwMTM3MkE0ODk3NCIsImh0dHA6Ly9zY2hlbWFzLm9yaW9uaGVhbHRoLmNvbS93cy8yMDE0LzEwL2lkZW50aXR5L2NsYWltcy9lbXBsb3llZS1qb2ItdHlwZS1jb2RlIjoiRE9DIiwiaHR0cDovL3NjaGVtYXMub3Jpb25oZWFsdGguY29tL3dzLzIwMTQvMTAvaWRlbnRpdHkvY2xhaW1zL2VtcGxveWVlLWpvYi10eXBlLW5hbWUtZSI6IkRvY3RvcnMiLCJodHRwOi8vc2NoZW1hcy5vcmlvbmhlYWx0aC5jb20vd3MvMjAxNC8xMC9pZGVudGl0eS9jbGFpbXMvZW1wbG95ZWUtam9iLXR5cGUtbmFtZS1sIjoiKkRvY3RvcnMqIiwiaHR0cDovL3NjaGVtYXMub3Jpb25oZWFsdGguY29tL3dzLzIwMTQvMTAvaWRlbnRpdHkvY2xhaW1zL2VtcGxveWVlLW51bWJlciI6Ijg0MTg2IiwiaHR0cDovL3NjaGVtYXMub3Jpb25oZWFsdGguY29tL3dzLzIwMTQvMTAvaWRlbnRpdHkvY2xhaW1zL2VtcGxveWVlLW91LWlkIjoiRDQzRkI3NzctQjQ3Ni1ERTExLTg1MjktMDAxMjNGRkYzNUNDIiwiaHR0cDovL3NjaGVtYXMub3Jpb25oZWFsdGguY29tL3dzLzIwMTQvMTAvaWRlbnRpdHkvY2xhaW1zL2VtcGxveWVlLW91LW5hbWUtZSI6IkVFTlQgQ2xpbmljcyIsImh0dHA6Ly9zY2hlbWFzLm9yaW9uaGVhbHRoLmNvbS93cy8yMDE0LzEwL2lkZW50aXR5L2NsYWltcy9lbXBsb3llZS1vdS1uYW1lLWwiOiIqRUVOVCBDbGluaWNzKiIsImh0dHA6Ly9zY2hlbWFzLm9yaW9uaGVhbHRoLmNvbS93cy8yMDE0LzEwL2lkZW50aXR5L2NsYWltcy91c2VyLWlkIjoiQUU0NTRFOEMtN0Q4Ny0xMURELTgzMkQtMDAxMzcyQTQ4OTc0IiwidW5pcXVlX25hbWUiOiJTWVNURU1TXFxoaXN1c2VyIiwiaXNzIjoic3RzLnNlY3VyaXR5Lm9yaW9uaGVhbHRoLmNvbSIsImF1ZCI6Imh0dHBzOi8vdGgtc29tYmF0cC1uYjIub3Jpb24uaW50ZXJuYWwvTWFpbkxvY2FsQ29tcG9uZW50cy9wbGF0Zm9ybS9hdXRoZW50aWNhdGlvbi90cnVzdC9pc3N1ZWR0b2tlbm1peGVkL3Rva2Vuc2VydmljZS5zdmMvMTMiLCJleHAiOjE2MzI3MzYwNTIsIm5iZiI6MTYzMjEzMTI1Mn0.LUaNlZoyLeslAYpR3lJ4IXWdcc6HXsJE_jEHH33vDB8oV0aFRvIQrI-5DP3kYzgT7sMhzOapSUTpJuV22r23ULGQbcfyeIfDof-hMeVXKJh3HPRSB3LWgMbDWtgkQdApXk9Fj-4XhMzxzD6H-ZUR3z-e-SrQj1I3QmjCFiXCOl7Cspwmz6z0XHr9RIBFMbFRmPgGQvzOqcP1xKdKf0YEY-0IDkTobNYcT3vNAOaEKy04neb4Kt8KJ9dDeavM-QTQJ9FlTgZeNWB7qGiFOqJ-Muyuq6C9xQTte_Kh10myLlQksFzHwkRVKHmt2Owvc6yNTuQuHmjwOkR99kYXX4RpuQ'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://th-sombatp-nb2.orion.internal/MainLocalComponents/api/back-office/patient-finance/policy-authorizations/?patientReferralIdentifier=27116@urn:orion:pas:referral:patient-referral:referral-number'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
