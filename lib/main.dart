
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_page.dart';



void main () {
  runApp(Dent());
}
  class Dent extends StatelessWidget {
  const Dent({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'تطبيق أسناني',
  home: HomePage() ,
  );
  }
  }

