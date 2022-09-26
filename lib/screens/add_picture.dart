import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
void main () {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
class AddPicture extends StatefulWidget {
  @override
  _AddPictureState createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  File? imageFile;
  _showoption(BuildContext context){
 return showDialog(context: context,
     builder: (context) =>
    AlertDialog(
      title: Text('Choose Picture - اختيار صورة'),
      content: (SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.image_rounded),
              title: Text('الاستوديو - Gallery'),
              onTap: ()=>_ImageFromGallery(context),
                 ),
                  ListTile(
                   leading: Icon(Icons.image_rounded),
                   title: Text('إزالة الصورة - Remove Picture'),
              onTap: ()=>_ImageRemove(context),
            ),
          ],
        ),
      ),),
    ),
    );
  }
  Future _ImageFromGallery(BuildContext context) async {
  var image = await ImagePicker.pickImage(source: ImageSource.camera);
  setState(() {
    imageFile = image  ;
    Navigator.pop(context);
  });
}
Future _ImageRemove(BuildContext context) async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  setState(() {
    imageFile = image ;
  });
  Navigator.pop(context);
}

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload A image - تحميل صورة'),
        centerTitle: true ,
      ),
      body: Center(
        child: imageFile!=null
        ?Image.file(imageFile, width: 400, height: 400,)
            :Text('يرجى اضافة صورة الحالة')

      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=> _showoption(context), child: Icon(Icons.add_photo_alternate_rounded) ,),

    );
  }

_

