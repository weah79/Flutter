import 'package:firstapp/pages/calc.dart';
import 'package:firstapp/pages/contact.dart';
import 'package:firstapp/pages/home.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  //const MainPage({ Key? key }) : super(key: key);
  //
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabs = [HomePage(), CalculatePage(), ContactPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('เเอพคำนวณ')),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Calculation"),
          BottomNavigationBarItem(icon: Icon(Icons.contact_phone), label: "Contact"),
        ],

        onTap: (index){
          setState(() {
            //print(index);
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
