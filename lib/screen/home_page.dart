import 'package:flutter/material.dart';
import 'package:my_teeth_app/screen/login_doctor.dart';
import 'package:my_teeth_app/screen/login_page.dart';
import 'package:my_teeth_app/screen/login_patient.dart';
import 'package:my_teeth_app/screen/register_page.dart';
import 'package:my_teeth_app/screen/screen_support.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static String id = 'HomePage';
  bool isDoctor = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF3da7ff),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color(0XFF3da7ff),
        title: Center(
          child: Text('أسناني - العراق  My Teeth Iraq'),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  height: 48,
                ),
              ),
              CircleAvatar(
                radius: 155,
                backgroundColor: Color(0XFF3da7ff),
                child: CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage('images/dent1.jpeg'),
                ),
              ),
              Container(
                height: 48,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.id,
                      arguments: isDoctor);
                },
                icon: Icon(
                  Icons.app_registration_rounded,
                  color: Color(0XFF3da7ff),
                ),
                label: Text(
                  'تسجيل دكتور Doctor Registration',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              Container(
                height: 36,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.id,
                      arguments: !isDoctor);
                },
                icon: Icon(Icons.sentiment_satisfied_alt,
                    color: Color(0XFF3da7ff)),
                label: Text(
                  'تسجيل مريض Patient Registration',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              Container(
                height: 36,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenSupport(),
                    ),
                  );
                },
                icon: Icon(Icons.feedback_rounded, color: Color(0XFF3da7ff)),
                label: Text(
                  'الدعم والمساعدة  Support And Help',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
