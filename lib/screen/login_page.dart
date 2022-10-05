import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_teeth_app/screen/doctor_page.dart';
import 'package:my_teeth_app/screen/login_doctor.dart';
import 'package:my_teeth_app/screen/login_patient.dart';
import 'package:my_teeth_app/screen/patient_page.dart';
import 'package:my_teeth_app/screen/register_page.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_home_field.dart';
import '../widgets/show_nack_bar.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = 'Login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? myEmail, myPassword;
  bool isLoading = false;
  bool isDoctor = false;
  bool isLoggedIn = false;

  void initiateFacebookLogin() async {}

  GlobalKey<FormState> keyForm = GlobalKey();
  @override
  Widget build(BuildContext context) {
    bool isDoctor = ModalRoute.of(context)!.settings.arguments as bool;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: keyForm,
            child: ListView(
              children: [
                SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Color(0XFF3da7ff),
                  child: Image.asset(
                    'images/dent1.jpeg',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'تسجيل دخول',
                      style: TextStyle(fontSize: 32),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextHomeField(
                  hintText: 'ادخل الايميل من فضلك',
                  onChanged: (data) {
                    myEmail = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextHomeField(
                  obscureText: true,
                  hintText: 'ادخل كلمة السر من فضلك',
                  onChanged: (data) {
                    myPassword = data;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButon(
                  text: 'تسجيل دخول',
                  onTap: () async {
                    if (keyForm.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await signIn();
                        if (isDoctor == true)
                          Navigator.pushReplacementNamed(
                              context, DoctorPage.id);
                        else
                          Navigator.pushReplacementNamed(
                              context, PatientPage.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(context, 'No user found for that email.',
                              color: Colors.red);
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(
                              context, 'Wrong password provided for that user.',
                              color: Colors.red);
                        }
                      } catch (e) {
                        showSnackBar(context, 'There is an error.',
                            color: Colors.red);
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButon(
                    text: "تسجيل دخول باستخدام الفيس بوك",
                    onTap: () async {
                      isLoading = true;
                      setState(() {});
                    }),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'ليس لديك حساب مسبقا؟ ',
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, RegisterPage.id,
                          arguments: isDoctor),
                      child: const Text(
                        'انشاء حساب',
                        style: TextStyle(color: Color(0XFF3da7ff)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: myEmail!, password: myPassword!);
  }
}
