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
        "bye bye covid",
        style: TextStyle(
            fontSize: 50, color: Colors.orange[200], fontFamily: "Passadoo"),
      )),
    );
  }
}

// final ButtonStyle raiseButtonStyle = ElevatedButton.styleFrom(
//   onPrimary: Colors.blue[400],
//   primary: Colors.blue[900],
//   minimumSize: Size(88, 50),
//   padding: EdgeInsets.symmetric(horizontal: 16),
//   shape: const RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(Radius.circular(5)),
//   ),
// );
