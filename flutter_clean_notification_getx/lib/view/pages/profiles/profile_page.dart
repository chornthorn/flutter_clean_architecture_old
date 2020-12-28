import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('บัญชีผู้ใช้'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50),
                Container(
                  width: 120,
                  height: 120,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: new NetworkImage(
                          "https://i.insider.com/5e3c739fd9db1d319166a2b8?width=700"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18, top: 10, bottom: 10),
                  child: Text(
                    "Elon Musk ",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "ตำแหน่งผู้อำนวยการบริหารงานทั่วไป กลุ่มวิเคราะห์สินค้าและของกลาง ",
                  style: TextStyle(fontSize: 20),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: RaisedButton(
          color: Colors.grey[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            'ออกจากระบบ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => Get.offAllNamed('/login'),
        ),
      ),
    );
  }
}
