import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
            child: Column(
          children: [
            Text(
              "เเอพคำนวณค่าดัชนีมวลกาย (BMI)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "วิธีการใช้งาน",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("1. คลิกที่แท๊บคำนวณ",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  Text("2. ระบุน้ำหนัก(กิโลกรัม)",
                      style: TextStyle(fontSize: 15)),
                  Text("3. ระบุส่วนสูง(เซนติเมตร)",
                      style: TextStyle(fontSize: 15)),
                  Text("4. กดปุ่มคำนวณสีฟ้า", style: TextStyle(fontSize: 15)),
                  Text("<ผลลัพธ์จะเเสดงด้านล่างปุ่มคำนวณ>",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
            ),
            Image.asset(
              'assets/HowToBMI.png',
              scale: 1.85,
            ),
          ],
        ))
      ],
    );
  }
}
