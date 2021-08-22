import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

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
        child: ListView(
          children: [
            MyBox(
                context,
                "VS Code",
                "เครื่องมือสำหรับพัฒนาเเอพพลิเคชั่น รองรับหลายภาษา เช่น Flutter, Python",
                "https://media.istockphoto.com/photos/blurry-blue-circuit-wallpaper-picture-id1053210080?s=612x612"),
            SizedBox(
              height: 10,
            ),
            MyBox(context, "Git", "เครื่องมือสำหรับควบคุมเวอร์ชั่น",
                "https://media.istockphoto.com/vectors/futuristic-blue-cloud-with-pixel-digital-transformation-abstract-new-vector-id1134020821?k=6&m=1134020821&s=612x612&w=0&h=GuFjR0K-CWqStJY3r1oF6tfZQ-Au6zwP4O3U6Xt0KXk="),
            SizedBox(
              height: 10,
            ),
            MyBox(
                context,
                "Docker",
                "แพลตฟอร์มซอฟต์แวร์ที่ช่วยให้คุณสร้าง และทดสอบ แอพพลิเคชันได้อย่างรวดเร็ว",
                "https://media.istockphoto.com/vectors/laptop-with-code-on-screen-hanging-over-icons-programming-app-web-vector-id1205513619?k=6&m=1205513619&s=612x612&w=0&h=OsI2tNhNn8pXwlIBnzBPewJmZ_bRNt7lO5GTW4XQ368="),
            SizedBox(
              height: 10,
            ),
            MyBox(
                context,
                "StackOverflow",
                "เวบไซค์ช่วยในการค้นหาเมื่อพบปัญหาในการเขียนโปรแกรม",
                "https://media.istockphoto.com/photos/survey-poll-or-questionnaire-for-user-experience-or-customer-and-picture-id1065782440?k=6&m=1065782440&s=612x612&w=0&h=tkq0_Yza7lkLTwmM-fviV1dEo0cBNNTJwTK0L111oi4="),
          ],
        ),
      ),
    );
  }
}

Widget MyBox(
    BuildContext context, String title, String subtitle, String imageurl) {
  return Container(
      padding: EdgeInsets.all(20),
      height: 150,
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailPage()));
                },
                child: Text("อ่านต่อ"))
          ]));
}
