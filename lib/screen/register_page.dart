import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_teeth_app/screen/varify_email.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_home_field.dart';
import '../widgets/show_nack_bar.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = 'Register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? myEmail, password;
  bool isDoctor = false;
  bool isLoading = false;
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;

  _checkIfisLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;

    setState(() {
      _checking = false;
    });

    if (accessToken != null) {
      print(accessToken.toJson());
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
      });
    } else {
      _login();
    }
  }

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;

      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    } else {
      print(result.status);
      print(result.message);
    }
    setState(() {
      _checking = false;
    });
  }

  GlobalKey<FormState> formKey = GlobalKey();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    bool isDoctor = ModalRoute.of(context)!.settings.arguments as bool;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 30,
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
                      'انشاء حساب',
                      style: TextStyle(fontSize: 32),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
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
                    password = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextHomeField(
                  obscureText: true,
                  hintText: 'تاكيد كلمة السر من فضلك',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButon(
                  text: 'انشاء حساب',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await register();
                        Navigator.pushNamed(context, VarifyEmailPage.id,
                            arguments: isDoctor);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                              context, 'The password provided is too weak.',
                              color: Colors.red);
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              'The account already exists for that email.',
                              color: Colors.red);
                        }
                      } catch (e) {
                        showSnackBar(context, 'There is an error',
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
                    text: 'انشاء حساب باستخدام الفيس بوك',
                    onTap: () async {
                      isLoading = true;
                      setState(() {});
                      _checkIfisLoggedIn();

                      isLoading = false;
                      setState(() {});
                    }),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'هل لديك حساب مسبقا؟',
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        '  تسجيل دخول',
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

  Future<void> register() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: myEmail!, password: password!);
  }
}
