import 'package:flutter/material.dart';
 class ScreenSupport extends StatelessWidget {
  const ScreenSupport({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color(0XFF3da7ff),
      title: Center(
        child:   const Text('الدعم والمساعدة  Support And Help' ),
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