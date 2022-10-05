import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_teeth_app/screen/doctor_page.dart';

class LoginDoctor extends StatefulWidget {
  static String id = "Login Doctor";

  const LoginDoctor({super.key});

  @override
  State<LoginDoctor> createState() => _LoginDoctorState();
}

class _LoginDoctorState extends State<LoginDoctor> {
  String? name;

  String? birthday;

  String? finalStage;

  String? governorate;

  String? university;

  String? phone;

  String? secondPhone;

  String? email;

  String? cases;

  String? suggest;

  GlobalKey<FormState> formKey = GlobalKey();

  CollectionReference doctorRef =
      FirebaseFirestore.instance.collection("Doctors");

  addDoctors() async {
    var formdata = formKey.currentState;
    if (formdata != null) {
      if (formdata.validate()) {
        formdata.save();
        await doctorRef.add({
          "Full Name": name,
          "Phone Number": phone,
          "birthday": birthday,
          "Univesity": university,
          "Governorate": governorate,
          "Second Phone Number": secondPhone == null ? '' : secondPhone,
          "Final Stage": finalStage,
          "Email": email,
          "Cases": cases,
          "suggestion": suggest == null ? '' : suggest,
          "UserId": FirebaseAuth.instance.currentUser!.uid
        }).then((value) =>
            Navigator.of(context).pushNamed(DoctorPage.id).catchError((e) {}));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color(0XFF3da7ff),
        title: Center(
          child: Text(' تسجيل دكتور  Doctor Registration'),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'تسجيل دكتور Doctor Registration',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                  ),
                  CircleAvatar(
                    radius: 90,
                    backgroundColor: Color(0XFF3da7ff),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('images/dent1.jpeg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(60),
                    child: Text(
                      'ملاحظة : هذه الاستمارة تسجيل دكتور أختصاص أو تسجيل طلبة المراحل الاخيرة الذين يحتاجون مراجعين مرضى تحت أشراف أطباء من حملة الشهادات العليا تكون  '
                      'أسعار الخدمة 5 الاف دينار للدكتور الاختصاص لكل حالة وبأسعار رمزية الى طلبة المراحل الاخيرة الذين يحتاجون مراجعين مرضى',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Text(
                    'هذه الاسعار تكلفة أدامة وتطوير التطبيق',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'الاسعار',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Text(
                    '  تنظيف الاسنان 10 الاف دينار عراقي ',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '  قلع الاسنان 15 الاف دينار عراقي',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '  حشوة الاسنان 15 الف دينار عراقي',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  Text(
                    ' طقم الاسنان او تقويم الاسنان 25 الف دينار عراقي',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'الدفع عن طريق خدمة زين كاش أو أسيا حوالة وللأستفسار اكثر',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Text(
                    ' 07703989069',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    ' 07811555589',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: ((value) => name = value!),
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'This Question Is Required - هذا السؤال مطلوب';
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: ' الاسم الثلاثي   Full Name ',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: ((value) => birthday = value!),
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'This Question Is Required - هذا السؤال مطلوب';
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'العمر - The Age',
                      prefixIcon: Icon(Icons.edit_calendar_rounded),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: ((value) => finalStage = value!),
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'This Question Is Required - هذا السؤال مطلوب';
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText:
                          'دكتور أختصاص أو طالب مرحلة اخيرة  Specialist Doctor Or Final Stage Student',
                      prefixIcon: Icon(Icons.medical_information_rounded),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: ((value) => governorate = value!),
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'This Question Is Required - هذا السؤال مطلوب';
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'المحافظة - Governorate',
                      prefixIcon: Icon(Icons.place_rounded),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: ((value) => university = value!),
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'This Question Is Required - هذا السؤال مطلوب';
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'الجامعة - The University',
                      prefixIcon: Icon(Icons.school_rounded),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: ((value) => phone = value!),
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'This Question Is Required - هذا السؤال مطلوب';
                      }
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'رقم الهاتف الاول - First Phone Number',
                      prefixIcon: Icon(Icons.phone_iphone_rounded),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: ((value) => secondPhone = value!),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'رقم الهاتف الثاني - Second Phone Number',
                      prefixIcon: Icon(Icons.phone_android_rounded),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: ((value) => email = value!),
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'This Question Is Required - هذا السؤال مطلوب';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'الايميل - Email',
                      prefixIcon: Icon(Icons.email_rounded),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: ((value) => cases = value!),
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'This Question Is Required - هذا السؤال مطلوب';
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText:
                          'مالحالات التي ترغب بها ( التنظيف - القلع - الحشوات - التقويم ) What cases do you want (cleaning - extractions - fillings - orthodontics)',
                      prefixIcon: Icon(Icons.question_mark_rounded),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: ((value) => suggest = value!),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText:
                          'ماذا تقترح لتطوير التطبيق What do you suggest to develop the application',
                      prefixIcon: Icon(Icons.settings_suggest_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    color: Color(0XFF3da7ff),
                    child: MaterialButton(
                      onPressed: () async {
                        await addDoctors();
                      },
                      child: Text(
                        'أرسال المعلومات - Send Information',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
