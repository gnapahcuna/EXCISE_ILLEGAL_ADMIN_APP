import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype_app_pang/font_family/font_style.dart';
import 'package:prototype_app_pang/main_menu/auction/auction_screen.dart';
import 'package:prototype_app_pang/main_menu/destroy/destroy_screen.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/arrest_screen_1.dart';
import 'package:prototype_app_pang/main_menu/transfer/transfer_screen.dart';
import 'package:prototype_app_pang/model/ItemsPersonInfomation.dart';

class TransferFragment extends StatefulWidget {
  ItemsPersonInformation ItemsData;
  TransferFragment({
    Key key,
    @required this.ItemsData,
  }) : super(key: key);
  @override
  _FragmentState createState() => new _FragmentState();
}
class _FragmentState extends State<TransferFragment>  {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return new Scaffold(
        body: new Center(
            child: new Container(
              padding: EdgeInsets.only(top: size.height / 4.5),
              child: new Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new SizedBox(
                      height: (size.width*50)/100,
                      width: (size.width*50)/100,
                      child: new IconButton(
                        padding: new EdgeInsets.all(0.0),
                        color: Colors.white,
                        icon: new Icon(
                            Icons.add_circle, color: Color(0xff087de1),
                            size: (size.width*50)/100),
                        onPressed: () {
                          Navigator.of(context)
                              .push(
                              new MaterialPageRoute(
                                  builder: (context) => TransferMainScreenFragment(
                                    ItemstransferMain: null,
                                    IsPreview: false,
                                    IsCreate: true,
                                    IsUpdate: false,
                                    //ItemsMain: widget.ItemsData,
                                  )));
                        },
                      )
                  ),
                  new Padding(padding: EdgeInsets.only(top: 32.0),
                    child: Text("สร้างงานโอนย้ายของกลาง", style: TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w500,fontFamily: FontStyles().FontFamily),),)
                ],
              ),
            )
        )
    );
  }
}