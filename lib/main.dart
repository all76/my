import 'package:flutter/material.dart';
import 'package:my_teeth_app/screen/doctor_page.dart';
import 'package:my_teeth_app/screen/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_teeth_app/screen/login_doctor.dart';
import 'package:my_teeth_app/screen/login_page.dart';
import 'package:my_teeth_app/screen/login_patient.dart';
import 'package:my_teeth_app/screen/patient_page.dart';
import 'package:my_teeth_app/screen/register_page.dart';
import 'package:my_teeth_app/screen/varify_email.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyteethApp());
}

class MyteethApp extends StatelessWidget {
  const MyteethApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', ''), // English, no country code
      ],
      debugShowCheckedModeBanner: false,
      title: 'تطبيق أسناني',
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        RegisterPage.id: (context) => RegisterPage(),
        LoginPatient.id: (context) => LoginPatient(),
        LoginDoctor.id: (context) => LoginDoctor(),
        LoginPage.id: (context) => LoginPage(),
        VarifyEmailPage.id: (context) => VarifyEmailPage(),
        DoctorPage.id: (context) => DoctorPage(),
        PatientPage.id: (context) => PatientPage()
      },
    );
  }
}
