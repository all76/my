import 'package:flutter/material.dart';



class LoginDoctor extends StatelessWidget {
  LoginDoctor({super.key});

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
        backgroundColor: const Color(0XFF3da7ff),
        title: const Center(
          child: const Text(' تسجيل دكتور  Doctor Registration'
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

                const Center(
                  child: const Text(
                    'تسجيل دكتور Doctor Registration', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                  ),
                  ),
                ),
                Container(
                  height: 45,
                ),
                const CircleAvatar(
                  radius: 90,
                  backgroundColor: const Color(0XFF3da7ff),
                  child: const CircleAvatar(
                    radius: 80,
                    backgroundImage:  AssetImage('images/dent1.jpeg'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(60),
                  child: Text(

'ملاحظة : هذه الاستمارة تسجيل دكتور أختصاص أو تسجيل طلبة المراحل الاخيرة الذين يحتاجون مراجعين مرضى تحت أشراف أطباء من حملة الشهادات العليا تكون  '
    'أسعار الخدمة 5 الاف دينار للدكتور الاختصاص لكل حالة وبأسعار رمزية الى طلبة المراحل الاخيرة الذين يحتاجون مراجعين مرضى',



                                                                style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),),
                ),
                const Text(  'هذه الاسعار تكلفة أدامة وتطوير التطبيق',style: TextStyle(
    fontWeight: FontWeight.w900,),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child:  const Text('الاسعار', style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),),
                ),
               const Text('  تنظيف الاسنان 10 الاف دينار عراقي ',
                  style: TextStyle(fontWeight: FontWeight.w900),),
                const Text('  قلع الاسنان 15 الاف دينار عراقي',
                  style: TextStyle(fontWeight: FontWeight.w900),),
              const  Text('  حشوة الاسنان 15 الف دينار عراقي',
                  style: TextStyle(fontWeight: FontWeight.w900),),
              const  Text(' طقم الاسنان او تقويم الاسنان 25 الف دينار عراقي',
                  style: TextStyle(fontWeight: FontWeight.w900),),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'الدفع عن طريق خدمة زين كاش أو أسيا حوالة وللأستفسار اكثر'
                    , style: TextStyle(fontWeight: FontWeight.w900,),
                  ),
                ),
               const Text(
                  ' 07703989069'
                  , style: TextStyle(fontWeight: FontWeight.w900,),),

                    const Text(
                      ' 07811555589'
                      , style: TextStyle(fontWeight: FontWeight.w900,),),
    const SizedBox(
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
                 decoration: const InputDecoration(
                    labelText: ' الاسم الثلاثي   Full Name ',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
               const SizedBox(
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
                      decoration: const InputDecoration(
                        labelText: 'العمر - The Age',
                        prefixIcon: Icon(Icons.edit_calendar_rounded),
                      ),
                    ),
                   const SizedBox(
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
                      decoration: const InputDecoration(
                        labelText: 'دكتور أختصاص أو طالب مرحلة اخيرة  Specialist Doctor Or Final Stage Student',
                      prefixIcon: Icon(Icons.medical_information_rounded),
                      ),
                    ),
                    const SizedBox(
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
                      decoration: const InputDecoration(
                        labelText: 'المحافظة - Governorate',
                        prefixIcon: Icon(Icons.place_rounded),
                      ),
                    ),
                   const SizedBox(
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
                      decoration: const InputDecoration(
                        labelText: 'الجامعة - The University',
                        prefixIcon: Icon(Icons.school_rounded),
                      ),
                    ),
                   const SizedBox(
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
                      decoration: const InputDecoration(
                        labelText: 'رقم الهاتف الاول - First Phone Number',
                        prefixIcon: Icon(Icons.phone_iphone_rounded),
                      ),
                    ),
                  const  SizedBox(
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
                      decoration: const InputDecoration(
                        labelText: 'رقم الهاتف الثاني - Second Phone Number',
                        prefixIcon: Icon(Icons.phone_android_rounded),
                      ),
                    ),
                    const SizedBox(
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
                      decoration: const InputDecoration(
                        labelText: 'الايميل - Email',
                        prefixIcon: Icon(Icons.email_rounded),
                      ),
                    ),
                  const  SizedBox(
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
                      decoration: const InputDecoration(
                        labelText: 'مالحالات التي ترغب بها ( التنظيف - القلع - الحشوات - التقويم ) What cases do you want (cleaning - extractions - fillings - orthodontics)',
                        prefixIcon: Icon(Icons.question_mark_rounded),
                      ),
                    ),
                   const  SizedBox(
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
                      decoration: const InputDecoration(
                        labelText: 'ماذا تقترح لتطوير التطبيق - What do you suggest to develop the application',
                        prefixIcon: Icon(Icons.settings_suggest_outlined),
                      ),
                    ),
                   const SizedBox(
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
                      },child: const Text('أرسال المعلومات - Send Information', style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white,

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

