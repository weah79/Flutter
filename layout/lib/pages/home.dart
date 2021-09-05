import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เครื่องมือและเวบไซค์สำหรับการพัฒนาซอฟต์แวร์"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              //var data = json.decode(snapshot.data.toString()); // [{},{},{}]

              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return MyBox(snapshot.data[index]['title'], snapshot.data[index]['subtitle'],
                      snapshot.data[index]['image_url'], snapshot.data[index]['detail']);
                },
                itemCount: snapshot.data.length,
              );
            },
            // future:
            //     DefaultAssetBundle.of(context).loadString('assets/data.json'),
            future: getData(), // will get data (data.json) from github

          )),
    );
  }

  Widget MyBox(String title, String subtitle, String imageurl, String detail) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = imageurl;
    v4 = detail;
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(imageurl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken)),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  offset: Offset(3, 3),
                  blurRadius: 3,
                  spreadRadius: 0)
            ]),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                subtitle,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 18),
              TextButton(
                  onPressed: () {
                    print("Next Page >>>");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(v1, v2, v3, v4)));
                  },
                  child: Text("อ่านต่อ"))
            ]));
  }

  Future getData() async {
    //https://raw.githubusercontent.com/weah79/BasicAPI/main/data.json
    var url = Uri.https('raw.githubusercontent.com', '/weah79/BasicAPI/main/data.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    return result;
  }
}
