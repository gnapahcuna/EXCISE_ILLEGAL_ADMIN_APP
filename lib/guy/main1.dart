
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'camera.dart';
import 'image.dart';
import 'package:camera/camera.dart';
import 'package:chatja/font_family/font_style.dart';
import 'font_family/font_style.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'search.dart';
import 'dart:ui';
import 'package:chatja/font_family/font_style.dart';
import 'package:file_picker/file_picker.dart';
import 'upfile.dart';

final dateformate = DateFormat('HH:mm : dd-MM-yyyy');
String datestring = dateformate.format(DateTime.now());


String police = "จ่าเอก";











void main() {
  runApp(MaterialApp(
    title: 'Navigation',
    home: MainHome(),
    debugShowCheckedModeBanner: false,
  ));
}


class MainHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textLabelStyle = TextStyle(fontSize: 16.0,fontFamily: FontStyles().FontFamily);
   TextStyle textLabelStyle1 = TextStyle(fontSize: 18.0,fontFamily: FontStyles().FontFamily);
   
    return Scaffold(
      
      appBar: AppBar(
        title: Text('ห้องสนทนา',style: textLabelStyle1),
        centerTitle: true,
        backgroundColor: Color(0xff5887f9),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            iconSize: 30,
            onPressed: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new Searchchat()),
              );
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Divider(),
          //คืือการเคาะลงมา

          ListTile(
            leading: Icon(
              Icons.person_pin,
              size: 50,
            ),
            title: Text('หมวดเอก',style: textLabelStyle),
            subtitle: Text('เห้ย ตู่นเองอยู่ไหน',style: textLabelStyle),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
             /* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new FriendlychatApp()),
             );*/
            },
          ),
        ],
      ),
    );
  }
}



TextStyle styleTextSearch = TextStyle(fontSize: 16.0,fontFamily: FontStyles().FontFamily);
class Searchchat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: new ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.white,
          hintColor: Colors.grey[400]
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0), // here the desired height
          child: AppBar(
            title: new Padding(
              padding: EdgeInsets.only(right: 22.0),
              child: new Row(children: <Widget>[
                new SizedBox(width: 10.0,),
                new Expanded(child: new Stack(
                    alignment: const Alignment(1.0, 1.0),
                    children: <Widget>[
                      new TextField(
                        style: styleTextSearch,
                        decoration: InputDecoration(
                          hintText: 'ค้นหา', hintStyle: styleTextSearch,),
                        onChanged: (text) {
                          
                        },
                        onSubmitted: (String text) {
                          if(text == police){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => new MainHome()));
                          }else{
                              CupertinoAlertDialog _cupertinoSearchEmpty(mContext) {
    TextStyle TitleStyle = TextStyle(fontSize: 16.0,fontFamily: FontStyles().FontFamily);
    TextStyle ButtonAcceptStyle = TextStyle(
      color: Colors.blue, fontSize: 18.0, fontWeight: FontWeight.w500,fontFamily: FontStyles().FontFamily);
    return new CupertinoAlertDialog(
        content: new Padding(
          padding: EdgeInsets.only(top: 32.0, bottom: 32.0),
          child: Text("ไม่พบข้อมูล.",
            style: TitleStyle,
          ),
        ),
        actions: <Widget>[
          new CupertinoButton(
              onPressed: () {
                Navigator.pop(mContext);
                
              },
              child: new Text('ยืนยัน', style: ButtonAcceptStyle)),
        ]
    );
  }
                          }
                        },
                     )
                    ]
                ),),
              ],
              ),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios,), onPressed: () {
              Navigator.pop(context, police);
            }),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 34.0,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border(
                      top: BorderSide(color: Colors.grey[300], width: 1.0),
                      //bottom: BorderSide(color: Colors.grey[300], width: 1.0),
                    )
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: new Text('ILG60_B_01_00_02_00',
                        style: TextStyle(color: Colors.grey[400],fontFamily: FontStyles().FontFamily,fontSize: 12.0)),
                    )
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}



*/








