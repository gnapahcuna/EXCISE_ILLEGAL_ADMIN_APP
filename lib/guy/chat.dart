import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

import 'package:prototype_app_pang/font_family/font_style.dart';

int ye = 543;
String _getDateNow() {
  var now = new DateTime.now();
  var formatter = new DateFormat('  HH:mm น. d-MM-2562');
  return formatter.format(now);
}

class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> _messages;
  ScrollController scrollController;

  Future<File> imageFile;

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  pickCamera(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: ImageSource.camera);
    });
    return imageFile;
  }

  TextEditingController textEditingController;
  @override
  void initState() {
    _messages = List<String>();
    _messages.add("สวัสดีครับ \n\n 12:10 5-05-2562");
    _messages.add("ครับว่าไง \n\n 12:11 5-05-2562");
    _messages.add("เป็นไงบ้าง \n\n 12:12 5-05-2562");
    _messages.add("สบายดี \n\n 12:13 5-05-2562");
    _messages.add("ครับ \n\n 12:15 5-05-2562");
    _messages.add("คดีเสือดำเป็นไงบ้าง \n\n 14:15 7-05-2562");
    _messages.add("ทำสำนวนคดีอยู่ครับ \n\n 14:30 7-05-2562");
    _messages.add("บิ้ก สำนวนคดีอย่าลืมส่งมานะ \n\n 19:50 10-05-2562");

    textEditingController = TextEditingController();

    scrollController = ScrollController();

    super.initState();
  }

  void handleSendMessage() {
    var text = textEditingController.value.text;
    textEditingController.clear();
    setState(() {
      _messages.add(text + "\n\n" + _getDateNow());

      enableButton = false;
    });

    Future.delayed(Duration(milliseconds: 100), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          curve: Curves.ease, duration: Duration(milliseconds: 500));
    });
  }

  bool enableButton = false;

  @override
  Widget build(BuildContext context) {
    TextStyle textLabelStyle =
        TextStyle(fontSize: 16.0, fontFamily: FontStyles().FontFamily);
    TextStyle textLabelStyle1 =
        TextStyle(fontSize: 18.0, fontFamily: FontStyles().FontFamily);
    TextStyle textLabelStyle3 =
        TextStyle(fontSize: 13.0, fontFamily: FontStyles().FontFamily);

    var textInput = Row(
      // mainAxisAlignment: prefix0.MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {
              pickCamera(ImageSource.camera);
            }),
        IconButton(
          icon: Icon(Icons.photo),
          onPressed: () {
            pickImageFromGallery(ImageSource.gallery);
          },
        ),
        IconButton(
          icon: Icon(Icons.folder),
          onPressed: () async {
            File file = await FilePicker.getFile(type: FileType.ANY);
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  enableButton = text.isNotEmpty; //อนูญาตให้ใช้ปุ่มเมื่อช่องไม่ว่าง
                });
              },
              decoration: InputDecoration.collapsed(
                  hintText: "ส่งข้อความ", hintStyle: textLabelStyle),
              controller: textEditingController,
            ),
          ),
        ),
        enableButton
            ? IconButton(
                color: Colors.blue,
                icon: Icon(Icons.send),
                disabledColor: Colors.grey,
                onPressed: handleSendMessage,
              )
            : IconButton(
                color: Colors.blue,
                icon: Icon(Icons.send),
                disabledColor: Colors.grey,
                onPressed: null,
              )
      ],
    );

    return MaterialApp(
      title: 'Flutter d',
      home: Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          backgroundColor: Color(0xff5887f9),
          title: Text(
            "จ่าตุ่น",
            style: textLabelStyle1,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  bool reverse = false;

                  if (index % 2 == 0) {
                    reverse = true;
                  }

                  var avatar = Padding(
                    padding:
                        const EdgeInsets.only(left: 8, bottom: 8, right: 8),
                    child: Icon(
                      Icons.person_pin,
                      size: 40,
                    ),
                  );

                  var messagebody = DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.circular(8)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          _messages[index],
                          style: textLabelStyle,
                        ),
                      ),
                    ),
                  );

                  Widget message;

                  if (reverse) {
                    message = Stack(
                      children: <Widget>[
                        messagebody,
                      ],
                    );
                  } else {
                    message = Stack(
                      children: <Widget>[
                        messagebody,
                      ],
                    );
                  }

                  if (reverse) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: message,
                        ),
                        avatar,
                      ],
                    );
                  } else {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        avatar,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: message,
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            Divider(
              height: 2,
            ),
            textInput,
          ],
        ),
      ),
    );
  }
}
