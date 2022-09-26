import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_page.dart';
 class ScreenSupport extends StatelessWidget {
  const ScreenSupport({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0XFF3da7ff),
      title: Center(
        child:  Text('الدعم والمساعدة  Support And Help' ),
      ),
    ),
   body: Image.asset('images/support.jpeg',
    fit: BoxFit.fill,
    width: double.infinity,
    height: double.infinity,
   ),
      
    );
  }
       }