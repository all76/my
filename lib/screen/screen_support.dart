import 'package:flutter/material.dart';

class ScreenSupport extends StatelessWidget {
  const ScreenSupport({super.key});
  static String id = "ScreenSupport";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF3da7ff),
        title: Center(
          child: Text('الدعم والمساعدة  Support And Help',style: TextStyle(fontSize: 18),),
        ),
      ),
      body: Image.asset(
        'images/support.jpeg',
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
