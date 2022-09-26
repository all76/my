
// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


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

