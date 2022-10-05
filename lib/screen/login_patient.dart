import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_teeth_app/screen/patient_page.dart';
import 'dart:io';
import 'package:path/path.dart';

class LoginPatient extends StatefulWidget {
  const LoginPatient({super.key});
  static String id = "Login Patient";
  @override
  State<LoginPatient> createState() => _LoginPatientState();
}

class _LoginPatientState extends State<LoginPatient> {
  GlobalKey<FormState> formKey = GlobalKey();
  File? file;
  String? name;

  String? birthday;

  String? diseases;

  String? governorate;

  String? university;

  String? phone;

  String? secondPhone;

  String? email;

  String? cases;

  String? suggest;
  String? imageurl;
  Reference? ref;
  CollectionReference patientrRef =
      FirebaseFirestore.instance.collection("Patients");

  addPatients() async {
    if (file == null) {
      return AwesomeDialog(
          context: this.context,
          title: "Important",
          body: Text(
            "Please choose image because it is important.",
          ),
          dialogType: DialogType.error)
        ..show();
    }

    var formdata = formKey.currentState;
    if (formdata != null) {
      if (formdata.validate()) {
        formdata.save();
        await patientrRef.add({
          " Full Name": name,
          "Phone Number": phone,
          "birthday": birthday,
          "Governorate": governorate,
          "Second Phone Number": secondPhone == null ? '' : secondPhone,
          "Diseases": diseases,
          "Email": email,
          "Cases": cases,
          "suggestion": suggest == null ? '' : suggest,
          "ImageUrl": imageurl,
          "UserId": FirebaseAuth.instance.currentUser!.uid
        }).then((value) => Navigator.of(this.context)
            .pushNamed(PatientPage.id)
            .catchError((e) {}));
      }
    }
  }

  _imageFromCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {});
    if (image != Null) {
      file = File(image!.path);
      var ran = Random().nextInt(10000);
      String imageName = "$ran" + basename(image.name);
      ref = FirebaseStorage.instance.ref("Images/Camera").child(imageName);
      await ref!.putFile(file!);
      imageurl = imageName;
    } else {
      return AwesomeDialog(
          context: this.context,
          title: "Important",
          body: Text(
            "please pick image.",
          ),
          dialogType: DialogType.error)
        ..show();
    }
  }

  _imageFromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {});
    if (image != Null) {
      file = File(image!.path);
      var ran = Random(10000);
      String imageName = "$ran" + basename(image.name);
      ref = FirebaseStorage.instance.ref("Images/Gallery").child(imageName);
      imageurl = imageName;
    } else {
      return AwesomeDialog(
          context: this.context,
          title: "Important",
          body: Text(
            "please pick image.",
          ),
          dialogType: DialogType.error)
        ..show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color(0XFF3da7ff),
        title: Center(
          child: Text('تسجيل مريض  Patient Registration'),
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
                      'تسجيل مريض Patient Registration',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 90,
                      backgroundColor: Color(0XFF3da7ff),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('images/dent1.jpeg'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(60),
                    child: Text(
                      'ملاحظة : هذه الاستمارة تسجيل مريض يحتاج الى معالجة الاسنان حيث أن تطبيق أسناني يوفر هذه الخدمة مجانا للمرضى تحت أشراف أطباء من حملة الشهادات العليا  مراعاة للظروف العراق والظروف الانسانية وأيضا يوفر خدمة أختيار طبيبك '
                      'بأسعار مناسبة'
                      'يرجى من المريض اضافة صورة حالة الاسنان لكي يتم تقييم الحالة من قبل الدكتور بصورة دقيقة',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Text(
                    'للمساعدة والاستفسار أكثر يرجى التواصل على الرقم التالي',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
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
                  TextFormField(
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'This Question Is Required - هذا السؤال مطلوب';
                      }
                    },
                    onSaved: ((value) => name = value!),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: ' الاسم الثلاثي Full Name ',
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
                    onSaved: ((value) => governorate = value!),
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'This Question Is Required - هذا السؤال مطلوب';
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'المحافظة والمدينة - Governorate And The City',
                      prefixIcon: Icon(Icons.place_rounded),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: ((value) => diseases = value!),
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'This Question Is Required - هذا السؤال مطلوب';
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText:
                          'هل لديك أمراض مزمنة - Do you have chronic diseases',
                      prefixIcon: Icon(Icons.sick_rounded),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'This Question Is Required - هذا السؤال مطلوب';
                      }
                    },
                    onSaved: ((value) => phone = value!),
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
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'This Question Is Required - هذا السؤال مطلوب';
                      }
                    },
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
                  Text(
                    'اختيار صورة حالة المريض - Choose Patient Case Picture',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 125,
                        backgroundColor: Color(0XFF3da7ff),
                        child: CircleAvatar(
                          radius: 120,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              file == null ? null : FileImage(file!),
                        ),
                      ),
                      Positioned(
                        top: 180,
                        child: RawMaterialButton(
                          elevation: 10,
                          fillColor: Color(0XFF3da7ff),
                          child: Icon(Icons.add_a_photo),
                          padding: EdgeInsets.all(15),
                          shape: CircleBorder(),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'اختيار صورة - Choose Picture',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              _imageFromCamera();
                                              Navigator.pop(context);
                                            },
                                            splashColor: Color(0XFF3da7ff),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: const Icon(
                                                      Icons.camera_alt_rounded),
                                                ),
                                                Text(
                                                  'Camera - الكاميرا',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0XFF3da7ff),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              _imageFromGallery();
                                              Navigator.pop(context);
                                            },
                                            splashColor: Color(0XFF3da7ff),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: const Icon(
                                                      Icons.image_rounded),
                                                ),
                                                Text(
                                                  'Gallery - الاستوديو',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0XFF3da7ff),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'This Question Is Required - هذا السؤال مطلوب';
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText:
                          'ماذا تقترح لتطوير التطبيق - What do you suggest to develop the application',
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
                        await addPatients();
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
