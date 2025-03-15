import 'package:flutter/material.dart';

class Answer1 extends StatefulWidget {
  const Answer1({super.key});

  @override
  State<Answer1> createState() => _Answer1State();
}

class _Answer1State extends State<Answer1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("โปรไฟล์ผู้ใช้งาน"),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple[50],
                  image: DecorationImage(
                      image: AssetImage("assets/leaf-blue.png"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "ชื่อผู้ใช้ : John Doe",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              "อีเมล: johndoe@example.com",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              title: Text('การตั้งค่า'),
              onTap: () {},
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.lock,
                color: Colors.blue,
              ),
              title: Text('เปลี่ยนรหัสผ่าน'),
              onTap: () {},
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.question_mark,
                color: Colors.blue,
              ),
              title: Text('ความเป็นส่วนตัว'),
              onTap: () {},
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("แก้ไขโปรไฟล์")),
                  );
                },
                child: Text('แก้ไขโปรไฟล์')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("ออกจากระบบ")),
                  );
                },
                child: Text('ออกจากระบบ')),
          ],
        ),
      ),
    );
  }
}
