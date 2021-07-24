import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Image.asset('assets/orange.png', scale: 0.5,),        
        Text('โปรแกรมคำนวณส้ม', style: TextStyle(fontSize: 30),),
        TextField(
          decoration: InputDecoration(
              labelText: 'จำนวนส้ม', 
              border: OutlineInputBorder()),
        )
      ],
    ));
  }
}
