import 'package:prototype_app_pang/main_menu/tab_menu/chat_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

/*
void main() {
  runApp(new MaterialApp(
    home: Screenpic(),
  ));
}

class Screenpic extends StatefulWidget {
  @override
  _ScreenpicState createState() => _ScreenpicState();
}

class _ScreenpicState extends State<Screenpic> {
File imageFile;

 _openGallary(BuildContext context) async{
var picture=  await ImagePicker.pickImage(source: ImageSource.gallery);
this.setState((){
imageFile = picture;
});
Navigator.of(context).pop();
}
 
  _opencamera(BuildContext context) async{
var picture=  await ImagePicker.pickImage(source: ImageSource.camera);
this.setState((){
imageFile = picture;
});
   Navigator.of(context).pop();
 }
 
 Future<void> showchoice(BuildContext contex){
    return showDialog(context: contex,builder: (BuildContext context){
      return AlertDialog(

        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("gal"),
                onTap: (){
                  _openGallary(context);
                },
              ),
              Padding(padding: EdgeInsets.all(8.0),),
              GestureDetector(
                child: Text("came"),
                onTap: (){
                  _opencamera(context);
                },
              )

            ],
          ),

        ),

      );


    }
  

);

 }
 
Widget _desideImageview(){
  if(imageFile == null){
    return Text('NONO');
  } else{
    Image.file(imageFile,width: 400,height: 400,);
  }

}

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('gg'),
      ),
    body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
       _desideImageview(), 
        Image.file(imageFile,width: 400,height: 400,),
        RaisedButton(onPressed: (){
          showchoice(context);
        },child: Text("select image"),
        
        )
      ],
      ),
    ),
    
    );
  }
}
*/

class Cameras extends StatefulWidget {
    Cameras() : super();
  @override
  _CamerasState createState() => _CamerasState();
}

class _CamerasState extends State<Cameras> {
  Future<File> imageFile;
 
  pickCamera(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: ImageSource.camera);
    });
  }
 
  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
            width: 300,
            height: 300,
          );
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }
 
  @override
  Widget build(BuildContext context) {
  
  }
}






