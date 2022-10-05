import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_teeth_app/screen/home_page.dart';
import 'package:my_teeth_app/screen/login_doctor.dart';
import 'package:my_teeth_app/screen/login_patient.dart';
import 'package:my_teeth_app/widgets/show_nack_bar.dart';

class VarifyEmailPage extends StatefulWidget {
  VarifyEmailPage({super.key});
  static String id = "Varify Email Page";

  @override
  State<VarifyEmailPage> createState() => _VarifyEmailPageState();
}

class _VarifyEmailPageState extends State<VarifyEmailPage> {
  User? user = FirebaseAuth.instance.currentUser;
  Timer? timer;
  bool isEmailVerfied = false;
  bool isDoctor = true;

  @override
  void initState() {
    user!.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVeriation();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDoctor = ModalRoute.of(context)!.settings.arguments as bool;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 153, 201, 240),
      body: isEmailVerfied
          ? (isDoctor ? LoginDoctor() : LoginPatient())
          : Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/a.png',
                    height: 250,
                    width: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'من فضلك قم بزيارة ايميلك ${user!.email} لتفعيل الحساب ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Future<void> checkEmailVeriation() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerfied = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (user!.emailVerified) {
      timer!.cancel();
    }
  }
}
