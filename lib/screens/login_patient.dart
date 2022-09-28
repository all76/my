import 'dart:io';
import 'package:path/path.dart' ;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class LoginPatient extends StatefulWidget {
  const LoginPatient({super.key});


  @override
  State<LoginPatient> createState() => _LoginPatientState();
}

class _LoginPatientState extends State<LoginPatient> {

  var nameController = TextEditingController();

  var birthController = TextEditingController();

  var governorateController = TextEditingController();

  var sickController = TextEditingController();

  var fphoneController = TextEditingController();

  var sphoneController = TextEditingController();

  var casesController = TextEditingController();
  var suggestController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  File? file ;

  _imageFromCamera() async {
   var image = await ImagePicker().pickImage(source: ImageSource.camera);
   setState(() {

   });
    if (image != Null) {
      file == File(image!.path);
      String imageName = basename(image.path);
      print('image: $imageName');
    } else {
      print('please pick image');
    }
  }

    _imageFromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {

    });
    if (image != Null) {
      file = File(image!.path);
      String imageName = basename(image.path);
      print('image: $imageName');
    } else {
      print('please pick image');
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF3da7ff),
        title: const Center(
          child:  const Text('تسجيل مريض  Patient Registration'
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
                    'تسجيل مريض Patient Registration', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                Container(
                  height: 45,
                ),
                const Center(
                  child: const CircleAvatar(
                    radius: 90,
                    backgroundColor: Color(0XFF3da7ff),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('images/dent1.jpeg'),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(60),
                  child:  Text(
                    'ملاحظة : هذه الاستمارة تسجيل مريض يحتاج الى معالجة الاسنان حيث أن تطبيق أسناني يوفر هذه الخدمة مجانا للمرضى تحت أشراف أطباء من حملة الشهادات العليا  مراعاة للظروف العراق والظروف الانسانية وأيضا يوفر خدمة أختيار طبيبك '
                        'بأسعار مناسبة'

                               'يرجى من المريض اضافة صورة حالة الاسنان لكي يتم تقييم الحالة من قبل الدكتور بصورة دقيقة'
                   , style: TextStyle(fontWeight: FontWeight.w900,),),
                   ),

                  const  Text(
                    'للمساعدة والاستفسار أكثر يرجى التواصل على الرقم التالي'
                    , style: TextStyle(fontWeight: FontWeight.w900,),
                  ),
               const  Text(
                  ' 07703989069'
                  , style: TextStyle(fontWeight: FontWeight.w900,),),
                const Text(
                  ' 07811555589'
                  , style: TextStyle(fontWeight: FontWeight.w900,),),

                TextFormField(
                  validator: (data) {
                    if(data!.isEmpty) {
                      return 'This Question Is Required - هذا السؤال مطلوب';
                    }
                  },
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration:  const InputDecoration(
                    labelText: ' الاسم الثلاثي Full Name ',
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
               const  SizedBox(
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
                  decoration:  const InputDecoration(
                    labelText: 'المحافظة والمدينة - Governorate And The City',
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
                  controller: sickController,
                  keyboardType: TextInputType.text,
                  decoration:  const InputDecoration(
                    labelText: 'هل لديك أمراض مزمنة - Do you have chronic diseases',
                    prefixIcon: Icon(Icons.sick_rounded),
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
                  controller: fphoneController,
                  keyboardType: TextInputType.phone,
                  decoration:  const InputDecoration(
                    labelText: 'رقم الهاتف الاول - First Phone Number',
                    prefixIcon: Icon(Icons.phone_iphone_rounded),
                  ),
                ),
              const   SizedBox(
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
                  decoration:  const InputDecoration(
                    labelText: 'رقم الهاتف الثاني - Second Phone Number',
                    prefixIcon: Icon(Icons.phone_android_rounded),
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
                const Text(
                  'اختيار صورة حالة المريض - Choose Patient Case Picture',style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                ),

               const  SizedBox(
                  height: 15,
                ),
                           CircleAvatar(
                           radius: 125,
                           backgroundColor: Color(0XFF3da7ff),
                            child: CircleAvatar(
                             radius:120,
                              backgroundColor: Colors.white,
                              backgroundImage: file ==null
                                  ? null
                                  : FileImage(file!),
                            ),
                             ),
                             Positioned(
                              top: 120,
                              left:110,

                      child: RawMaterialButton(
                      elevation: 10,
                           fillColor: Color(0XFF3da7ff),
                            child: const Icon(Icons.add_a_photo),
                            padding: const EdgeInsets.all(15),
                             shape:  const CircleBorder(),
                              onPressed: () {

                                 showDialog(
                                 context: context,
                                 builder: (BuildContext context){
                                 return AlertDialog (
                                 title: const Text('اختيار صورة - Choose Picture'
                                 ,style: TextStyle(fontWeight: FontWeight.w700,),
                                  ),
                                   content: SingleChildScrollView(
                                     child: ListBody(
                                       children: [
                                         InkWell(
                                           onTap: (){
                                             _imageFromCamera() ;
                                             Navigator.pop(context);

                                           } ,
                                           splashColor: const Color(0XFF3da7ff),
                                           child: Row(
                                             children: const [
                                               Padding(
                                                 padding: EdgeInsets.all(8.0),
                                                 child: Icon(Icons.camera_alt_rounded),
                                                  ),
                                                Text('Camera - الكاميرا', style: TextStyle(
                                                 fontSize: 18,
                                                 fontWeight: FontWeight.w500,
                                                 color: Color(0XFF3da7ff),
                                               ),),
                                             ],
                                           ),),
                                           InkWell(
                                               onTap: (){
                                              _imageFromGallery() ;
                                              Navigator.pop(context);
                                                } ,
                                          splashColor: const Color(0XFF3da7ff),
                                          child: Row(
                                       children: const [
                                       Padding(
                                       padding: EdgeInsets.all(8.0),
                                       child: Icon(Icons.image_rounded),
                                       ),
                                      Text('الاستوديو - Gallery', style: TextStyle(
                                       fontSize: 18,
                                       fontWeight: FontWeight.w500,
                                       color: Color(0XFF3da7ff),
                                          ),),
                                          ],
                                ),),
                             ],),
                                   ),
                             );
                             });
                             },
                             ),
                             ),
                 TextFormField(
                     validator: (data) {
                       if(data!.isEmpty) {
                         return 'This Question Is Required - هذا السؤال مطلوب';
                           }
    },
                  controller: suggestController,
                  keyboardType: TextInputType.text,
                  decoration:  const InputDecoration(
                    labelText: 'ماذا تقترح لتطوير التطبيق - What do you suggest to develop the application',
                    prefixIcon: Icon(Icons.settings_suggest_outlined),
                  ),
                ),
               const  SizedBox(
                  height:30,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  color: const Color(0XFF3da7ff),
                  child: MaterialButton(onPressed: (){
                    if(formKey.currentState!.validate())
                    print (nameController.text);
                    print (birthController.text);
                    print (governorateController.text);
                    print (sickController.text);
                    print (fphoneController.text);
                    print (sphoneController.text);
                    print (casesController.text);
                    print (suggestController.text);
                  },child:  const Text('أرسال المعلومات - Send Information', style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white,

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




