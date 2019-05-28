import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prototype_app_pang/font_family/font_style.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/future/arrest_future_master.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_5.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_master_response.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_product_category.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_product_group.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_product_subsettype.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_product_subtype.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_product_type.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/tab_creen_arrest/tab_arrest_5/tab_screen_arrest_5_created.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/tab_creen_arrest/tab_arrest_5/tab_screen_arrest_5_search.dart';

class TabScreenArrest5Creating extends StatefulWidget {
  bool IsUpdate;
  ItemsMasterProductGroupResponse ItemsProductGroup;
  TabScreenArrest5Creating({
    Key key,
    @required this.IsUpdate,
    @required this.ItemsProductGroup,
  }) : super(key: key);
  @override
  _TabScreenArrest5AddState createState() => new _TabScreenArrest5AddState();
}
class _TabScreenArrest5AddState extends State<TabScreenArrest5Creating> {
  List _itemsData = [];

  final FocusNode myFocusNodeMainBrand = FocusNode();
  final FocusNode myFocusNodeSecondaryBrand = FocusNode();
  final FocusNode myFocusNodeProductModel = FocusNode();
  final FocusNode myFocusNodeSize = FocusNode();
  final FocusNode myFocusNodeCapacity = FocusNode();
  final FocusNode myFocusNodeVolumn = FocusNode();
  final FocusNode myFocusNodeVolumnUnit = FocusNode();
  final FocusNode myFocusNodeNumbeMotor = FocusNode();
  final FocusNode myFocusNodeNumberTank = FocusNode();
  final FocusNode myFocusNodeOther = FocusNode();

  TextEditingController editMainBrand = new TextEditingController();
  TextEditingController editSecondaryBrand = new TextEditingController();
  TextEditingController editProductModel = new TextEditingController();
  TextEditingController editSize = new TextEditingController();
  TextEditingController editCapacity = new TextEditingController();
  TextEditingController editVolumn = new TextEditingController();
  TextEditingController editVolumnUnit= new TextEditingController();
  TextEditingController editNumbeMotor = new TextEditingController();
  TextEditingController editNumberTank = new TextEditingController();
  TextEditingController editOther= new TextEditingController();

  List<String> dropdownItemsSizeUnit = ["ลิตร",'มิลลิลิตร'];
  List<String> dropdownItemsCapacityUnit = ["ขวด", 'ลัง'];

  final formatter = new NumberFormat("#,###.###");

  ItemsMasterProductCategoryResponse ItemsProductCategory;

  ItemsListProductGroup sProductGroup;
  ItemsListProductCategory sProductCategory;

  double xSize=0;
  int yCount=0;
  double zTotal=0;


  String dropdownValueSizeUnit = null;
  String dropdownValueCapacityUnit = null;

  Color labelColor = Color(0xff087de1);
  TextStyle textInputStyle = TextStyle(fontSize: 16.0, color: Colors.black,fontFamily: FontStyles().FontFamily);
  TextStyle styleTextAppbar = TextStyle(fontSize: 18.0, color: Colors.white,fontFamily: FontStyles().FontFamily);
  TextStyle textLabelStyle = TextStyle(fontSize: 16.0, color:  Color(0xff087de1),fontFamily: FontStyles().FontFamily);
  TextStyle textStylePageName = TextStyle(
      fontSize: 12.0, color: Colors.grey[400],fontFamily: FontStyles().FontFamily);
  TextStyle textStyleStar = TextStyle(
      color: Colors.red, fontFamily: FontStyles().FontFamily);

  EdgeInsets paddingInputBox = EdgeInsets.only(top: 4.0, bottom: 4.0);
  EdgeInsets paddingLabel = EdgeInsets.only(top: 12.0);

  @override
  void initState() {
    super.initState();
    //sProductGroup = widget.ItemsProductGroup.RESPONSE_DATA[0];
    this.onLoadActionProuductCategoryMaster(widget.ItemsProductGroup.RESPONSE_DATA[0].PRODUCT_GROUP_ID);
  }


  @override
  void dispose() {
    super.dispose();
    editMainBrand.dispose();
    editSecondaryBrand.dispose();
    editProductModel.dispose();
    editSize.dispose();
    editCapacity.dispose();
    editVolumn.dispose();
    editVolumnUnit.dispose();
    editNumbeMotor.dispose();
    editNumberTank.dispose();
    editOther.dispose();
  }

  Widget _buildContent(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    final double Width = (size.width * 85) / 100;
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            border: Border(
              top: BorderSide(color: Colors.grey[300], width: 1.0),
              bottom: BorderSide(color: Colors.grey[300], width: 1.0),
            )
        ),
        width: size.width,
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 4.0, bottom: 12.0),
            width: Width,
            child: _buildInput(),
          ),
        )
    );
  }
  void _onSaved(mContext)async{
    if (sProductGroup==null) {
      _showSearchEmptyAlertDialog(mContext,'กรุณาเลือกหมวดหมู่สินค้า');
    } else if (sProductCategory == null) {
      _showSearchEmptyAlertDialog(mContext,'กรุณาเลือกกลุ่มสินค้า');
    } else if (editSize.text.isEmpty||dropdownValueSizeUnit==null) {
      _showSearchEmptyAlertDialog(mContext,'กรุณากรอกข้อมูลและเลือกหน่วยขนาดบรรจุ');
    } else if (editCapacity.text.isEmpty||dropdownValueCapacityUnit==null) {
      _showSearchEmptyAlertDialog(mContext,'กรุณากรอกข้อมูลและเลือกหน่วยจำนวน');
    } else{
      Map map = {
        "PRODUCT_MAPPING_ID": "",
        "PRODUCT_CODE": "",
        "PRODUCT_REF_CODE": "",
        "PRODUCT_GROUP_ID": sProductGroup.PRODUCT_GROUP_ID,
        "PRODUCT_CATEGORY_ID": sProductCategory.PRODUCT_CATEGORY_ID,
        "PRODUCT_TYPE_ID": "",
        "PRODUCT_SUBTYPE_ID": "",
        "PRODUCT_SUBSETTYPE_ID": "",
        "PRODUCT_BRAND_ID": 3,
        "PRODUCT_SUBBRAND_ID": 3,
        "PRODUCT_MODEL_ID": 3,
        "PRODUCT_TAXDETAIL_ID": 3,
        "UNIT_ID": 3,
        "SIZES": editVolumn.text,
        "SIZES_UNIT": editVolumnUnit.text,
        "DEGREE": "",
        "SUGAR": "",
        "CO2": "",
        "PRICE": "",
        "IS_DOMESTIC": 0,
        "IS_ACTIVE": 1,
        "CREATE_USER_ACCOUNT_ID": 1,
        "CREATE_DATE": DateTime.now(),
        "UPDATE_USER_ACCOUNT_ID": "",
        "UPDATE_DATE": ""
      };

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: CupertinoActivityIndicator(
              ),
            );
          });
       await onLoadActionInsProductAllMaster(map);
      //Navigator.pop(context,_getPersonResponse.RESPONSE_DATA);
    }
  }
  Future<bool> onLoadActionInsProductAllMaster(Map map) async {
    int PERSON_ID;
    await new ArrestFutureMaster().apiRequestMasProductMappinginsAll(map).then((onValue) {
      //PERSON_ID = onValue.RESPONSE_DATA;
      print(onValue.SUCCESS);
    });
    setState(() {});
    return true;
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


  Widget _buildInput() {
    var size = MediaQuery
        .of(context)
        .size;
    final double Width = (size.width * 100) / 100;

    Widget _buildLine = Container(
      padding: EdgeInsets.only(top: 0.0, bottom: 4.0),
      width: Width,
      height: 1.0,
      color: Colors.grey[300],
    );
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: paddingLabel,
          child: Row(
            children: <Widget>[
              Text("หมวดหมู่สินค้า",
                style: textLabelStyle,),
              Text(" *", style: textStyleStar,),
            ],
          ),
        ),
        Container(
          width: Width,
          //padding: paddingInputBox,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<ItemsListProductGroup>(
              isExpanded: true, //
              value: sProductGroup,
              onChanged: (ItemsListProductGroup newValue) {
                setState(() {
                  sProductGroup = newValue;
                  _onSelectProductGroup(sProductGroup.PRODUCT_GROUP_ID);
                });
              },
              items: widget.ItemsProductGroup.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListProductGroup>>((
                  ItemsListProductGroup value) {
                return DropdownMenuItem<ItemsListProductGroup>(
                  value: value,
                  child: Text(value.PRODUCT_GROUP_NAME, style: textInputStyle,),
                );
              })
                  .toList(),
            ),
          ),
        ),
        _buildLine,
        Container(
          padding: paddingLabel,
          child: Row(
            children: <Widget>[
              Text("กลุ่มสินค้า",
                style: textLabelStyle,),
              Text(" *", style: textStyleStar,),
            ],
          ),
        ),
        Container(
          width: Width,
          //padding: paddingInputBox,
          child: DropdownButtonHideUnderline(
            child: ItemsProductCategory != null ? DropdownButton<ItemsListProductCategory>(
              isExpanded: true, //
              value: sProductCategory,
              onChanged: (ItemsListProductCategory newValue) {
                setState(() {
                  sProductCategory = newValue;
                });
              },
              items: ItemsProductCategory.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListProductCategory>>((
                  ItemsListProductCategory value) {
                return DropdownMenuItem<ItemsListProductCategory>(
                  value: value,
                  child: Text(value.PRODUCT_CATEGORY_NAME, style: textInputStyle,),
                );
              })
                  .toList(),
            ) : Container(
              padding: paddingLabel,
              child: Container(),),
          ),
        ),
        _buildLine,
        /*Container(
          padding: paddingLabel,
          child: Text(
            "ประเภทย่อยสินค้า", style: textLabelStyle,),
        ),
        Container(
          width: Width,
          //padding: paddingInputBox,
          child: DropdownButtonHideUnderline(
            child: ItemsProductSubType != null ? DropdownButton<ItemsListProductSubType>(
              isExpanded: true, //
              value: sProductSubType,
              onChanged: (ItemsListProductSubType newValue) {
                setState(() {
                  sProductSubType = newValue;
                  _onSelectProductSubType(sProductSubType.PRODUCT_SUBTYPE_ID);
                });
              },
              items: ItemsProductSubType.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListProductSubType>>((
                  ItemsListProductSubType value) {
                return DropdownMenuItem<ItemsListProductSubType>(
                  value: value,
                  child: Text(value.PRODUCT_SUBTYPE_NAME, style: textInputStyle,),
                );
              })
                  .toList(),
            ) : Container(
              padding: paddingLabel,
              child: Container(),),
          ),
        ),
        _buildLine,
        Container(
          padding: paddingLabel,
          child: Text(
            "เซตประเภทย่อยสินค้า", style: textLabelStyle,),
        ),
        Container(
          width: Width,
          child: DropdownButtonHideUnderline(
            child: ItemsProductSubSetType != null ? DropdownButton<ItemsListProductSubSetType>(
              isExpanded: true, //
              value: sProductSubSetType,
              onChanged: (ItemsListProductSubSetType newValue) {
                setState(() {
                  sProductSubSetType = newValue;
                });
              },
              items: ItemsProductSubSetType.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListProductSubSetType>>((
                  ItemsListProductSubSetType value) {
                return DropdownMenuItem<ItemsListProductSubSetType>(
                  value: value,
                  child: Text(value.PRODUCT_SUBSETTYPE_NAME, style: textInputStyle,),
                );
              })
                  .toList(),
            ) : Container(
              padding: paddingLabel,
              child: Container(),),
          ),
        ),
        _buildLine,*/
        Container(
          padding: paddingLabel,
          child: Text(
            "ยี่ห้อหลักสินค้า", style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            focusNode: myFocusNodeMainBrand,
            controller: editMainBrand,
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
          child: Text("ยี่ห้อรองสินค้า", style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            focusNode: myFocusNodeSecondaryBrand,
            controller: editSecondaryBrand,
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
          child: Text("รุ่นสินค้า", style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            focusNode: myFocusNodeProductModel,
            controller: editProductModel,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            style: textInputStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        _buildLine,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: ((size.width * 75) / 100) / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: paddingLabel,
                    child: Row(
                      children: <Widget>[
                        Text("ขนาดบรรจุ",
                          style: textLabelStyle,),
                        Text(" *", style: textStyleStar,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: paddingInputBox,
                    child: TextField(
                      focusNode: myFocusNodeSize,
                      controller: editSize,
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.words,
                      style: textInputStyle,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (text){
                        xSize = double.parse(text);
                        zTotal = xSize*yCount;
                        editVolumn.text = formatter.format(zTotal).toString();
                      },
                    ),
                  ),
                  _buildLine,
                ],
              ),
            ),
            Container(
              width: ((size.width * 75) / 100) / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: paddingLabel,
                    child: Row(
                      children: <Widget>[
                        Text("หน่วย",
                          style: textLabelStyle,),
                        Text(" *", style: textStyleStar,),
                      ],
                    ),
                  ),
                  Container(
                    width: Width,
                    //padding: paddingInputBox,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValueSizeUnit,
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValueSizeUnit = newValue;
                            editVolumnUnit.text=dropdownValueSizeUnit;
                          });
                        },
                        items: dropdownItemsSizeUnit
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style: textInputStyle),
                          );
                        })
                            .toList(),
                      ),
                    ),
                  ),
                  _buildLine,
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: ((size.width * 75) / 100) / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: paddingLabel,
                    child: Row(
                      children: <Widget>[
                        Text("จำนวน",
                          style: textLabelStyle,),
                        Text(" *", style: textStyleStar,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: paddingInputBox,
                    child: TextField(
                      focusNode: myFocusNodeCapacity,
                      controller: editCapacity,
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.words,
                      style: textInputStyle,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (text){
                        yCount = int.parse(text);
                        zTotal = xSize*yCount;
                        editVolumn.text = formatter.format(zTotal).toString();
                      },
                    ),
                  ),
                  _buildLine,
                ],
              ),
            ),
            Container(
              width: ((size.width * 75) / 100) / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: paddingLabel,
                    child: Row(
                      children: <Widget>[
                        Text("หน่วย",
                          style: textLabelStyle,),
                        Text(" *", style: textStyleStar,),
                      ],
                    ),
                  ),
                  Container(
                    width: Width,
                    //padding: paddingInputBox,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValueCapacityUnit,
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValueCapacityUnit = newValue;
                          });
                        },
                        items: dropdownItemsCapacityUnit
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style: textInputStyle),
                          );
                        })
                            .toList(),
                      ),
                    ),
                  ),
                  _buildLine,
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: ((size.width * 75) / 100) / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: paddingLabel,
                    child:  Text("ปริมาณสุทธิ",
                      style: textLabelStyle,),
                  ),
                  Padding(
                    padding: paddingInputBox,
                    child: TextField(
                      focusNode: myFocusNodeVolumn,
                      controller: editVolumn,
                      keyboardType: TextInputType.number,
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
            Container(
              width: ((size.width * 75) / 100) / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: paddingLabel,
                    child: Text("หน่วย",
                      style: textLabelStyle,),
                  ),
                  Container(
                    width: Width,
                    //padding: paddingInputBox,
                    child: TextField(
                      enabled: false,
                      focusNode: myFocusNodeVolumnUnit,
                      controller: editVolumnUnit,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      style: textInputStyle,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: paddingLabel,
          child: Text("หมายเลขเครื่องยนต์", style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            focusNode: myFocusNodeNumbeMotor,
            controller: editNumbeMotor,
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
          child: Text("หมายเลขตัวถัง", style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            focusNode: myFocusNodeNumberTank,
            controller: editNumberTank,
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
          child: Text("ระบุเพิ่มเติม", style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            focusNode: myFocusNodeOther,
            controller: editOther,
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
    );
  }

  _navigateSaved(BuildContext context) async {
    /*showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: CupertinoActivityIndicator(
            ),
          );
        });
    await onLoadActionProuductProductMappingMaster();
    Navigator.pop(context);

    if(_itemsData.length>0) {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TabScreenArrest5Search(IsUpdate: widget.IsUpdate,)),
      );
      if(result.toString()!="back"){
        _itemsData = result;
        Navigator.pop(context,result);
      }
    }else{
      _showSearchEmptyAlertDialog(context,"ไม่พบข้อมูลของกลาง");
    }*/
  }

  /*_navigateCreate(BuildContext mContext)async {
    final result = await Navigator.push(
      mContext,
      MaterialPageRoute(builder: (context) =>
          TabScreenArrest5Creating(
            ItemsData: null,
          )),
    );
    if (result.toString() != "back") {
      Navigator.pop(context, result);
    }
  }*/

  @override
  Widget build(BuildContext context) {

    return new WillPopScope(
      onWillPop: () {
        //
      }, child: Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // here the desired height
        child: AppBar(
          title: new Padding(
            padding: EdgeInsets.only(right: 22.0),
            child: new Text("ของกลาง",
              style: styleTextAppbar,
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context, _itemsData);
              }),
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                //_navigateSaved(context);
                _onSaved(context);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              //height: 34.0,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border(
                      top: BorderSide(color: Colors.grey[300], width: 1.0),
                    )
                ),
                /*child: Column(
                  children: <Widget>[Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: new Text('ILG60_B_01_00_20_00',
                          style: textStylePageName,),
                      ),
                    ],
                  ),
                  ],
                )*/
            ),
            Expanded(
              child: new ConstrainedBox(
                  constraints: const BoxConstraints.expand(),
                  child: SingleChildScrollView(
                    child: _buildContent(context),
                  )
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }

  void _onSelectProductGroup(int PRODUCT_GROUP_ID)async{
    await onLoadActionProuductCategoryMaster(PRODUCT_GROUP_ID);
  }
  Future<bool> onLoadActionProuductCategoryMaster(int PRODUCT_GROUP_ID) async {
    Map map = {
      "TEXT_SEARCH": "",
      "PRODUCT_GROUP_ID": PRODUCT_GROUP_ID,
      "PRODUCT_CATEGORY_ID": ""
    };

    await new ArrestFutureMaster().apiRequestMasProductCategorygetByCon(map).then((onValue) {
      ItemsProductCategory = onValue;
    });
    setState(() {});
    return true;
  }
}