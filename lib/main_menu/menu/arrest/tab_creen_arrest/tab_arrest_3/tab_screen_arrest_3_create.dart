import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype_app_pang/font_family/font_style.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/future/arrest_future.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_main.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_staff.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_master_response.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_title.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/response/item_arrest_response_message.dart';

class TabScreenArrest3Create extends StatefulWidget {
  ItemsListArrestMain ItemsMain;
  ItemsListArrestStaff Items;
  ItemsMasterTitleResponse itemsTitle;
  bool IsUpdate;
  TabScreenArrest3Create({
    Key key,
    @required this.ItemsMain,
    @required this.Items,
    @required this.IsUpdate,
    @required this.itemsTitle,
  }) : super(key: key);
  @override
  _TabScreenArrest3CreateState createState() => new _TabScreenArrest3CreateState();
}
class _TabScreenArrest3CreateState extends State<TabScreenArrest3Create> {

  TabController tabController;
  TextEditingController controller = new TextEditingController();
  ItemsListArrestStaff _searchResult;


  final FocusNode myFocusNodeIdentifyNumber = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();
  final FocusNode myFocusNodePosition = FocusNode();
  final FocusNode myFocusNodeUnder = FocusNode();

  TextEditingController editIdentifyNumber = new TextEditingController();
  TextEditingController editName = new TextEditingController();
  TextEditingController editPosition = new TextEditingController();
  TextEditingController editUnder = new TextEditingController();

  ItemsListTitle _title;
  int titleType=1;


  TextStyle textInputStyle = TextStyle(fontSize: 16.0, color: Colors.black,fontFamily: FontStyles().FontFamily);
  TextStyle textLabelStyle = TextStyle(fontSize: 16.0, color: Color(0xff087de1),fontFamily: FontStyles().FontFamily);
  TextStyle styleTextAppbar = TextStyle(fontSize: 18.0,fontFamily: FontStyles().FontFamily,color: Colors.white);
  TextStyle textStylePageName = TextStyle(
      fontSize: 12.0, color: Colors.grey[400],fontFamily: FontStyles().FontFamily);
  TextStyle textStyleStar = TextStyle(
      color: Colors.red, fontFamily: FontStyles().FontFamily);

  EdgeInsets paddingInputBox = EdgeInsets.only(top: 4.0, bottom: 4.0);
  EdgeInsets paddingLabel = EdgeInsets.only(top: 12.0);

  List<ItemsListArrestStaff> itemsStaff=[];
  @override
  void initState() {
    super.initState();
    if(widget.Items!=null) {
      editIdentifyNumber.text = widget.Items.ID_CARD;
      editName.text = widget.Items.FIRST_NAME + " " +
              widget.Items.LAST_NAME;
      editPosition.text = widget.Items.OPREATION_POS_NAME;
      editUnder.text = widget.Items.OPERATION_OFFICE_NAME;
    }

    if(widget.IsUpdate){
      String title = widget.Items.TITLE_SHORT_NAME_TH;
      for(int i=0;i<widget.itemsTitle.RESPONSE_DATA.length;i++){
        String sTitle = widget.itemsTitle.RESPONSE_DATA[i].TITLE_SHORT_NAME_TH==null?widget.itemsTitle.RESPONSE_DATA[i].TITLE_NAME_TH
            :widget.itemsTitle.RESPONSE_DATA[i].TITLE_SHORT_NAME_TH;
        if(sTitle.endsWith(title)){
          _title = widget.itemsTitle.RESPONSE_DATA[i];
        }
      }
    }

  }

  @override
  void dispose() {
    super.dispose();
    myFocusNodeIdentifyNumber.dispose();
    myFocusNodeName.dispose();
    myFocusNodePosition.dispose();
    myFocusNodeUnder.dispose();
  }

  Widget _buildContent(BuildContext context) {
    Color labelColor = Color(0xff087de1);
    var size = MediaQuery
        .of(context)
        .size;
    //final double Width = (size.width * 80) / 100;
    Widget _buildLine = Container(
      padding: EdgeInsets.only(top: 0.0, bottom: 4.0),
      //width: Width,
      height: 1.0,
      color: Colors.grey[300],
    );

    return Container(
      padding: EdgeInsets.all(22.0),
      height: size.height,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            border: Border(
              top: BorderSide(color: Colors.grey[300], width: 1.0),
              //bottom: BorderSide(color: Colors.grey[300], width: 1.0),
            )
        ),
      width: size.width,
      child: Center(
        child: Container(
          padding: EdgeInsets.only(top: 4.0, bottom: 12.0),
          //width: Width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: paddingLabel,
                child: Row(
                  children: <Widget>[
                    Text("รหัสบัตรประชาชน",
                      style: textLabelStyle,),
                    Text("*", style: textStyleStar,),
                  ],
                ),
              ),
              Padding(
                padding: paddingInputBox,
                child: TextField(
                  //maxLength: 14,
                  focusNode: myFocusNodeIdentifyNumber,
                  controller: editIdentifyNumber,
                  keyboardType: TextInputType.number,
                  textCapitalization: TextCapitalization.words,
                  style: textInputStyle,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              _buildLine,
              Container(
                padding: paddingLabel,
                child: Text("คำนำหน้าชื่อ", style: textLabelStyle,),
              ),
              Container(
                width: size.width,
                //padding: paddingInputBox,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<ItemsListTitle>(
                    isExpanded: true,
                    value: _title,
                    onChanged: (ItemsListTitle newValue) {
                      setState(() {
                        _title = newValue;
                      });
                    },
                    items: widget.itemsTitle.RESPONSE_DATA
                        .map<DropdownMenuItem<ItemsListTitle>>((ItemsListTitle value) {
                      return DropdownMenuItem<ItemsListTitle>(
                        value: value,
                        child: Text(value.TITLE_SHORT_NAME_TH==null?value.TITLE_NAME_TH:value.TITLE_SHORT_NAME_TH
                          ,style: textInputStyle,),
                      );
                    })
                        .toList(),
                  ),
                ),
              ),
              _buildLine,
              Container(
                padding: paddingLabel,
                child: Text("ชื่อ-นามสกุล", style: textLabelStyle,),
              ),
              Padding(
                padding: paddingInputBox,
                child: TextField(
                  focusNode: myFocusNodeName,
                  controller: editName,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  style: textInputStyle,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              _buildLine,
              Container(
                padding: paddingLabel,
                child: Text("ตำแหน่ง", style: textLabelStyle,),
              ),
              Padding(
                padding: paddingInputBox,
                child: TextField(
                  focusNode: myFocusNodePosition,
                  controller: editPosition,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  style: textInputStyle,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              _buildLine,
              Container(
                padding: paddingLabel,
                child: Text("หน่วยงาน", style: textLabelStyle,),
              ),
              Padding(
                padding: paddingInputBox,
                child: TextField(
                  focusNode: myFocusNodeUnder,
                  controller: editUnder,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  style: textInputStyle,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              _buildLine,
            ],
          ),
        ),
      )
    );
  }

  ArrestFuture future = new ArrestFuture();
  Future<bool> onLoadActionInsStaff(Map map) async {
    if(widget.IsUpdate) {
      await future.apiRequestMasStaffupdAll(map).then((onValue) {
        print(onValue.SUCCESS);
      });
      Map mapGetByCon = {
        "TEXT_SEARCH": "",
        "STAFF_ID": widget.Items.STAFF_ID
      };
      await future.apiRequestMasStaffgetByCon(mapGetByCon).then((onValue) {
        onValue.RESPONSE_DATA.forEach((item){
          widget.Items = item;
          widget.Items.IsCheck=true;
        });
        Navigator.pop(context);
      });
    }else{
      int RESPONSE_DATA;
      await future.apiRequestMasStaffinsAll(map).then((onValue) {
        if(onValue.SUCCESS){
          RESPONSE_DATA = onValue.RESPONSE_DATA;
          //Navigator.pop(context);
        }
      });
      Map mapGetByCon = {
        "TEXT_SEARCH": "",
        "STAFF_ID": RESPONSE_DATA
      };
      await future.apiRequestMasStaffgetByCon(mapGetByCon).then((onValue) {
        itemsStaff = onValue.RESPONSE_DATA;
        Navigator.pop(context);
      });
    }
    setState(() {});
    return true;
  }

  Future<bool> onLoadActionupdByCon(List<Map> map) async {
    if(widget.IsUpdate) {
      await future.apiRequestArrestStaffupdByCon(map).then((onValue) {
        print(onValue.IsSuccess);
      });
      Map mapGetByCon = {
        "TEXT_SEARCH": "",
        "STAFF_ID": widget.Items.STAFF_ID
      };
      await future.apiRequestMasStaffgetByCon(mapGetByCon).then((onValue) {
        onValue.RESPONSE_DATA.forEach((item){
          widget.Items = item;
          widget.Items.IsCheck=true;
        });
        Navigator.pop(context);
      });
    }
    setState(() {});
    return true;
  }

  void onSave(Map map)async{
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: CupertinoActivityIndicator(
            ),
          );
        });
    await onLoadActionInsStaff(map);
    if(widget.IsUpdate){
      Navigator.pop(context, widget.Items);
    }else{
      Navigator.pop(context,itemsStaff);
    }
  }
  void onUpdate(List<Map> map)async{
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: CupertinoActivityIndicator(
            ),
          );
        });
    await onLoadActionupdByCon(map);
    if(widget.IsUpdate){
      Navigator.pop(context, widget.Items);
    }
  }

  CupertinoAlertDialog _cupertinoSearchEmpty(mContext,text) {
    TextStyle TitleStyle = TextStyle(fontSize: 16.0,fontFamily: FontStyles().FontFamily);
    TextStyle ButtonAcceptStyle = TextStyle(
        color: Colors.blue, fontSize: 18.0, fontWeight: FontWeight.w500,fontFamily: FontStyles().FontFamily);
    return new CupertinoAlertDialog(
        content: new Padding(
          padding: EdgeInsets.only(top: 32.0, bottom: 32.0),
          child: Text(text,
            style: TitleStyle,
          ),
        ),
        actions: <Widget>[
          new CupertinoButton(
              onPressed: () {
                Navigator.pop(mContext);
                controller.clear();
              },
              child: new Text('ยืนยัน', style: ButtonAcceptStyle)),
        ]
    );
  }

  void _showSearchEmptyAlertDialog(context,text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _cupertinoSearchEmpty(context,text);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () {
      //
    },
    child: new Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // here the desired height
        child: AppBar(
          title: new Padding(
            padding: EdgeInsets.only(right: 22.0),
            child: new Text("สร้างผู้จับกุม",
              style: styleTextAppbar,
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context,"Back");
              }),
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                if(editIdentifyNumber.text.isEmpty){
                  _showSearchEmptyAlertDialog(context,"กรุณากรอกรหัสบัตรประชาชน");
                }else if(_title==null){
                  _showSearchEmptyAlertDialog(context,"กรุณาเลือกคำนำหน้าชื่อ");
                }else if(editName.text.isEmpty){
                  _showSearchEmptyAlertDialog(context,"กรุณากรอกชื่อ-นามสกุล");
                }else if(editPosition.text.isEmpty){
                  _showSearchEmptyAlertDialog(context,"กรุณากรอกตำแหน่ง");
                }else if(editUnder.text.isEmpty){
                  _showSearchEmptyAlertDialog(context,"กรุณากรอกหน่วยงาน");
                }else{
                  String identify = editIdentifyNumber.text;
                  String titleName = _title.TITLE_NAME_TH;
                  String shortTitle=_title.TITLE_SHORT_NAME_TH;
                  String name=editName.text;
                  String position=editPosition.text;
                  String under=editUnder.text;
                  String arrestType="ผู้จับกุม";
                  bool check = false;

                  List splits = name.split(" ");
                  String firstname,lastname;
                  print(splits);
                  if(splits.length>0){
                    if(splits.length>=2){
                      firstname = splits[0];
                      lastname = splits[1];
                    }else{
                      firstname = splits[0];
                      lastname = "";
                    }
                  }
                  if(titleName.endsWith("นาย")){
                    titleType=1;
                    shortTitle="นาย";
                  }else if(titleName.endsWith("นางสาว")){
                    titleType=2;
                    shortTitle="นส.";
                  }else if(titleName.endsWith("นาง")){
                    titleType=3;
                    shortTitle="นาง";
                  }

                  Map map;
                  if(widget.IsUpdate){
                    map ={
                      "STAFF_ID": widget.Items.STAFF_ID,
                      "TITLE_ID": titleType,
                      "STAFF_CODE": "",
                      "ID_CARD": identify,
                      "STAFF_TYPE": 0,
                      "TITLE_NAME_TH": titleName,
                      "TITLE_SHORT_NAME_TH": shortTitle,
                      "FIRST_NAME": firstname,
                      "LAST_NAME": lastname,
                      "OPREATION_POS_NAME": position,
                      "OPERATION_OFFICE_NAME": under,
                      "STATUS": 1,
                      "IS_ACTIVE": 1
                    };
                  }else{
                    map ={
                      "STAFF_ID": "",
                      "TITLE_ID": titleType,
                      "STAFF_CODE": "",
                      "ID_CARD": identify,
                      "STAFF_TYPE": 0,
                      "TITLE_NAME_TH": titleName,
                      "TITLE_SHORT_NAME_TH": shortTitle,
                      "FIRST_NAME": firstname,
                      "LAST_NAME": lastname,
                      "OPREATION_POS_NAME": position,
                      "OPERATION_OFFICE_NAME": under,
                      "STATUS": 1,
                      "IS_ACTIVE": 1
                    };
                  }
                  if(widget.ItemsMain!=null){
                    List<Map> map=[];
                    widget.ItemsMain.ArrestStaff.forEach((item){
                      if(item.STAFF_REF_ID==widget.Items.STAFF_ID){
                        print(item.STAFF_ID.toString()+":"+item.STAFF_REF_ID.toString());
                        map.add({
                          "STAFF_ID": item.STAFF_ID,
                          "ARREST_ID": widget.ItemsMain.ARREST_ID,
                          "STAFF_REF_ID": item.STAFF_REF_ID,
                          "TITLE_ID": "1",
                          "STAFF_CODE": "",
                          "ID_CARD": identify,
                          "STAFF_TYPE": 1,
                          "TITLE_NAME_TH": titleName,
                          "TITLE_NAME_EN": _title.TITLE_NAME_EN,
                          "TITLE_SHORT_NAME_TH": shortTitle,
                          "TITLE_SHORT_NAME_EN": _title.TITLE_SHORT_NAME_EN,
                          "FIRST_NAME": firstname,
                          "LAST_NAME": lastname,
                          "AGE": 24,
                          "OPERATION_POS_CODE": "18",
                          "OPREATION_POS_NAME": position,
                          "OPREATION_POS_LEVEL": "",
                          "OPERATION_POS_LEVEL_NAME": "ชำนาญงาน",
                          "OPERATION_DEPT_CODE": "",
                          "OPERATION_DEPT_NAME": "",
                          "OPERATION_DEPT_LEVEL": "",
                          "OPERATION_UNDER_DEPT_CODE": "",
                          "OPERATION_UNDER_DEPT_NAME": "",
                          "OPERATION_UNDER_DEPT_LEVEL": "",
                          "OPERATION_WORK_DEPT_CODE": "",
                          "OPERATION_WORK_DEPT_NAME": "",
                          "OPERATION_WORK_DEPT_LEVEL": "",
                          "OPERATION_OFFICE_CODE": "",
                          "OPERATION_OFFICE_NAME": under,
                          "OPERATION_OFFICE_SHORT_NAME": "สสพ.ลำพูน",
                          "MANAGEMENT_POS_CODE": "",
                          "MANAGEMENT_POS_NAME": "",
                          "MANAGEMENT_POS_LEVEL": "",
                          "MANAGEMENT_POS_LEVEL_NAME": "",
                          "MANAGEMENT_DEPT_CODE": "",
                          "MANAGEMENT_DEPT_NAME": "",
                          "MANAGEMENT_DEPT_LEVEL": "",
                          "MANAGEMENT_UNDER_DEPT_CODE": "",
                          "MANAGEMENT_UNDER_DEPT_NAME": "",
                          "MANAGEMENT_UNDER_DEPT_LEVEL": "",
                          "MANAGEMENT_WORK_DEPT_CODE": "",
                          "MANAGEMENT_WORK_DEPT_NAME": "",
                          "MANAGEMENT_WORK_DEPT_LEVEL": "",
                          "MANAGEMENT_OFFICE_CODE": "",
                          "MANAGEMENT_OFFICE_NAME": "",
                          "MANAGEMENT_OFFICE_SHORT_NAME": "",
                          "REPRESENTATION_POS_CODE": "",
                          "REPRESENTATION_POS_NAME": "",
                          "REPRESENTATION_POS_LEVEL": "",
                          "REPRESENTATION_POS_LEVEL_NAME": "",
                          "REPRESENTATION_DEPT_CODE": "",
                          "REPRESENTATION_DEPT_NAME": "",
                          "REPRESENTATION_DEPT_LEVEL": "",
                          "REPRESENTATION_UNDER_DEPT_CODE": "",
                          "REPRESENTATION_UNDER_DEPT_NAME": "",
                          "REPRESENTATION_UNDER_DEPT_LEVEL": "",
                          "REPRESENT_WORK_DEPT_CODE": "",
                          "REPRESENT_WORK_DEPT_NAME": "",
                          "REPRESENT_WORK_DEPT_LEVEL": "",
                          "REPRESENT_OFFICE_CODE": "",
                          "REPRESENT_OFFICE_NAME": "",
                          "REPRESENT_OFFICE_SHORT_NAME": "",
                          "STATUS": 1,
                          "REMARK": "",
                          "CONTRIBUTOR_ID": item.CONTRIBUTOR_ID,
                          "IS_ACTIVE": 1
                        });
                      }
                    });
                    if(!map.isEmpty){
                      onUpdate(map);
                    }
                  }
                  onSave(map);
                }
              },
              child: Text("บันทึก",
                style: styleTextAppbar,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              //height: 34.0,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                    top: BorderSide(color: Colors.grey[300], width: 1.0),
                    //bottom: BorderSide(color: Colors.grey[300], width: 1.0),
                  )
              ),
              /*child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: new Text('ILG60_B_01_00_10_00',
                      style: textStylePageName,),
                  )
                ],
              ),*/
            ),
            Expanded(
              child: new ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: SingleChildScrollView(
                  child: _buildContent(context),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
