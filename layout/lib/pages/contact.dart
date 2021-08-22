import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  //const ContactPage({ Key? key }) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/Avatar1.png',
                scale: 3,
              ),
              SizedBox(
                height: 20,
              ),
              Text("เเอพนี้พัฒนาโดย Old man"),
              Text("Mail : oldman@gmail.com"),
              Text("Line ID : oldman"),
              Text("TEL : 088-741852963"),
            ],
          ),
        ),
      )
    ]);
  }
}
