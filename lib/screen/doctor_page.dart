import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DoctorPage extends StatelessWidget {
  DoctorPage({super.key});
  static String id = "Doctor Page";
  CollectionReference doctor = FirebaseFirestore.instance.collection('Doctors');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color(0XFF3da7ff),
        title: Center(
          child: Text('أسناني - العراق  My Teeth Iraq'),
        ),
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.black, fontSize: 18),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text('Name '),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('The Age'),
                Text('Governorate'),
                Text('The University')
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Phone Number'),
                Text('Phone Number'),
                Text('Email')
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('cases'),
                Text('suggestion'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
