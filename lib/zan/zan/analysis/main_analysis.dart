import 'package:flutter/material.dart';
import 'package:prototype_app_pang/font_family/font_style.dart';
import 'network.dart';
import 'report.dart';

Color labelColor = Color(0xff087de1);
    TextStyle textInputStyle = TextStyle(fontSize: 16.0,color: Colors.black,fontFamily: FontStyles().FontFamily);
    TextStyle textLabelStyle = TextStyle(fontSize: 16.0, color: labelColor, fontFamily: FontStyles().FontFamily);
    TextStyle textStyleSelect = TextStyle(fontSize: 16.0,color: Colors.black,fontFamily: FontStyles().FontFamily);
    TextStyle styleTextAppbar = TextStyle(fontSize: 18.0, color: Colors.white,fontFamily: FontStyles().FontFamily);
    EdgeInsets paddingInputBox = EdgeInsets.only(top: 4.0, bottom: 4.0);
    EdgeInsets paddingLabel = EdgeInsets.only(top: 12.0);


class NetPerson extends StatefulWidget {
  @override
  _NetPersonState createState() => _NetPersonState();
}

class _NetPersonState extends State<NetPerson> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
           bottom: TabBar(
             labelStyle: textLabelStyle,
            tabs: <Widget>[
              Tab(text: "ผู้ต้องหา",),
              Tab(text: "รายงาน"),
              
            ],
          ),
          
          title: Text('วิเคราะห์ข้อมูลผู้ต้องหา',style: styleTextAppbar,),
          centerTitle: true,
        ),body: TabBarView(
          children: <Widget>[
            NetworkPerson(),
            ReportPerson(),
            
          ],
        ),
      ),
    );
  }
}




