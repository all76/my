import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginDoctor extends StatelessWidget {
   var nameController = TextEditingController();
  var birthController = TextEditingController();
  var finalstageController = TextEditingController();
  var governorateController = TextEditingController();
  var universityController = TextEditingController();
  var fphoneController = TextEditingController();
  var sphoneController = TextEditingController();
  var emailController = TextEditingController();
  var casesController = TextEditingController();
  var suggestController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF3da7ff),
        title: Center(
          child: Text(' تسجيل دكتور  Doctor Registration'
          ),
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
                    'تسجيل دكتور Doctor Registration', style: TextStyle(
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
                  ),),
                ),
                Text(  'هذه الاسعار تكلفة أدامة وتطوير التطبيق',style: TextStyle(
    fontWeight: FontWeight.w900,),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text('الاسعار', style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),),
                ),
                Text('  تنظيف الاسنان 10 الاف دينار عراقي ',
                  style: TextStyle(fontWeight: FontWeight.w900),),
                Text('  قلع الاسنان 15 الاف دينار عراقي',
                  style: TextStyle(fontWeight: FontWeight.w900),),
                Text('  حشوة الاسنان 15 الف دينار عراقي',
                  style: TextStyle(fontWeight: FontWeight.w900),),
                Text(' طقم الاسنان او تقويم الاسنان 25 الف دينار عراقي',
                  style: TextStyle(fontWeight: FontWeight.w900),),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'الدفع عن طريق خدمة زين كاش أو أسيا حوالة وللأستفسار اكثر'
                    , style: TextStyle(fontWeight: FontWeight.w900,),
                  ),
                ),
                Text(
                  ' 07703989069'
                  , style: TextStyle(fontWeight: FontWeight.w900,),),

                    Text(
                      ' 07811555589'
                      , style: TextStyle(fontWeight: FontWeight.w900,),),
    SizedBox(
        height: 15,
    ),
    TextFormField(
        validator: (data) {
          if(data!.isEmpty) {
            return 'This Question Is Required - هذا السؤال مطلوب';
          }
        },
        controller: nameController,
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
                      validator: (data) {
                        if(data!.isEmpty) {
                          return 'This Question Is Required - هذا السؤال مطلوب';
                        }
                      },
                      controller: birthController,
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
                      validator: (data) {
                        if(data!.isEmpty) {
                          return 'This Question Is Required - هذا السؤال مطلوب';
                        }
                      },
                      controller: finalstageController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'دكتور أختصاص أو طالب مرحلة اخيرة  Specialist Doctor Or Final Stage Student',
                      prefixIcon: Icon(Icons.medical_information_rounded),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (data) {
                        if(data!.isEmpty) {
                          return 'This Question Is Required - هذا السؤال مطلوب';
                        }
                      },
                      controller: governorateController,
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
                      validator: (data) {
                        if(data!.isEmpty) {
                          return 'This Question Is Required - هذا السؤال مطلوب';
                        }
                      },
                      controller: universityController,
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
                      validator: (data) {
                        if(data!.isEmpty) {
                          return 'This Question Is Required - هذا السؤال مطلوب';
                        }
                      },
                      controller: fphoneController,
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
                      validator: (data) {
                        if(data!.isEmpty) {
                          return 'This Question Is Required - هذا السؤال مطلوب';
                        }
                      },
                      controller: sphoneController,
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
                      validator: (data) {
                        if(data!.isEmpty) {
                          return 'This Question Is Required - هذا السؤال مطلوب';
                        }
                      },
                      controller: emailController,
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
                      validator: (data) {
                        if(data!.isEmpty) {
                          return 'This Question Is Required - هذا السؤال مطلوب';
                        }
                      },
                      controller: casesController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'مالحالات التي ترغب بها ( التنظيف - القلع - الحشوات - التقويم ) What cases do you want (cleaning - extractions - fillings - orthodontics)',
                        prefixIcon: Icon(Icons.question_mark_rounded),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (data) {
                        if(data!.isEmpty) {
                          return 'This Question Is Required - هذا السؤال مطلوب';
                        }
                      },
                      controller: suggestController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'ماذا تقترح لتطوير التطبيق - What do you suggest to develop the application',
                        prefixIcon: Icon(Icons.settings_suggest_outlined),
                      ),
                    ),
                    SizedBox(
                      height:30,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      color: Color(0XFF3da7ff),
                      child: MaterialButton(onPressed: () async {
                        if(formKey.currentState!.validate())


                        print (nameController.text);
                        print (birthController.text);
                        print (finalstageController.text);
                        print (governorateController.text);
                        print (universityController.text);
                        print (fphoneController.text);
                        print (sphoneController.text);
                        print (emailController.text);
                        print (casesController.text);
                        print (suggestController.text);
                      },child: Text('أرسال المعلومات - Send Information', style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white,

                      ),),
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

