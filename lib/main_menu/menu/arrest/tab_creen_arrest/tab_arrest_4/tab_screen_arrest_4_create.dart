
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prototype_app_pang/font_family/font_style.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/future/arrest_future_master.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_lawbreaker.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_person.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_country.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_distinct.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_master_response.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_province.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_subdistinct.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_title.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class TabScreenArrest4Create extends StatefulWidget {
  bool IsUpdate;
  ItemsMasterTitleResponse ItemTitle;
  ItemsListArrestPerson ItemsPerson;
  ItemsMasterCountryResponse ItemCountry;
  TabScreenArrest4Create({
    Key key,
    @required this.IsUpdate,
    @required this.ItemTitle,
    @required this.ItemsPerson,
    @required this.ItemCountry,
  }) : super(key: key);
  @override
  _TabScreenArrest4CreateState createState() => new _TabScreenArrest4CreateState();
}
class _TabScreenArrest4CreateState extends State<TabScreenArrest4Create> {
  //node type1
  final FocusNode myFocusNodeIdentifyNumber = FocusNode();
  final FocusNode myFocusNodePassportNo = FocusNode();
  final FocusNode myFocusNodePassportCountry = FocusNode();
  final FocusNode myFocusNodeNameSus = FocusNode();
  final FocusNode myFocusNodeNameFather_1 = FocusNode();
  final FocusNode myFocusNodeNameMother_1 = FocusNode();
  final FocusNode myFocusNodePlace = FocusNode();

  //node type1
  TextEditingController editIdentifyNumber = new TextEditingController();
  TextEditingController editPassportNo = new TextEditingController();
  TextEditingController editPassportCountry = new TextEditingController();
  TextEditingController editNameSus = new TextEditingController();
  TextEditingController editFather = new TextEditingController();
  TextEditingController editMother = new TextEditingController();
  TextEditingController editPlace = new TextEditingController();

  ItemsMasterGetPersonResponse _getPersonResponse;

  //dropbox type1
  ItemsListTitle sTitle;
  ItemsListTitle sTitleMother;
  ItemsListTitle sTitleFather;
  ItemsListTitle sTitleHeadCompany;
  ItemsListTitle sTitleMotherHeadCompany;
  ItemsListTitle sTitleFatherHeadCompany;

  ItemsMasterProvinceResponse ItemProvince;
  ItemsMasterDistictResponse ItemDistrict;
  ItemsMasterSubDistictResponse ItemSubDistrict;

  ItemsListSubDistict sSubDistrict;
  ItemsListDistict sDistrict;
  ItemsListProvince sProvince;
  ItemsListCountry sCountry;

  ItemsListCountry sCountry2;
  ItemsListSubDistict sSubDistrict2;
  ItemsListDistict sDistrict2;
  ItemsListProvince sProvince2;

  //node type2
  final FocusNode myFocusNodeEntityNumber = FocusNode();
  final FocusNode myFocusNodeCompanyName = FocusNode();
  final FocusNode myFocusNodeExciseRegistrationNumber = FocusNode();
  final FocusNode myFocusNodeCompanyNameTitle = FocusNode();
  final FocusNode myFocusNodeCompanyHeadName = FocusNode();
  final FocusNode myFocusNodeNameFather_2 = FocusNode();
  final FocusNode myFocusNodeNameMother_2 = FocusNode();

  //node type2
  TextEditingController editEntityNumber = new TextEditingController();
  TextEditingController editCompanyName = new TextEditingController();
  TextEditingController editExciseRegistrationNumber = new TextEditingController();
  TextEditingController editCompanyNameTitle = new TextEditingController();
  TextEditingController editCompanyHeadName = new TextEditingController();
  TextEditingController editNameFather_2 = new TextEditingController();
  TextEditingController editNameMother_2 = new TextEditingController();

  //dropbox type2
  String dropdownValue_2 = 'นาย';
  List<String> dropdownItems_2 = ['นาย', 'นาง', 'นางสาว', "รต.ต.ต."];

  bool _suspectType1 = false;
  bool _suspectType2 = false;
  bool _nationalityType1 = false;
  bool _nationalityType2 = false;

  List<ItemsListArrestLawbreaker> _itemData = [];

  Future<File> _imageFile;
  List<File> _arrItemsImageFile = [];
  List<String> _arrItemsImageName = [];
  bool isImage = false;
  VoidCallback listener;

  Color labelColor = Color(0xff087de1);
  TextStyle textSearchByImgStyle = TextStyle(
      fontSize: 16.0, color: Colors.blue.shade400,fontFamily: FontStyles().FontFamily);
  TextStyle textInputStyle = TextStyle(fontSize: 16.0, color: Colors.black,fontFamily: FontStyles().FontFamily);
  TextStyle textLabelStyle = TextStyle(fontSize: 16.0, color: Color(0xff087de1),fontFamily: FontStyles().FontFamily);
  TextStyle textStyleSelect = TextStyle(fontSize: 16.0, color: Colors.black,fontFamily: FontStyles().FontFamily);
  TextStyle textStylePageName = TextStyle(
      fontSize: 12.0, color: Colors.grey[400],fontFamily: FontStyles().FontFamily);
  EdgeInsets paddingInputBox = EdgeInsets.only(top: 4.0, bottom: 4.0);
  EdgeInsets paddingLabel = EdgeInsets.only(top: 12.0);
  TextStyle textStyleStar = TextStyle(
      color: Colors.red, fontFamily: FontStyles().FontFamily);


  ItemsMasterCountryResponse _itemsMasterCountryResponse;
  ItemsMasterProvinceResponse _itemsMasterProviceResponse;
  ItemsMasterDistictResponse _itemsMasterDistictResponse;

  void _onImageButtonPressed(ImageSource source, mContext) {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: source);
      _imageFile.then((f) {

        setState(() {
          List splits = f.path.split("/");
          isImage = true;
          _arrItemsImageFile.add(f.absolute);
          _arrItemsImageName.add(splits[splits.length - 1]);
        });
        //_navigateSearchFace(context, _imageFile);
      });
      //Navigator.pop(mContext);
    });
  }
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      List splits = image.path.split("/");
      isImage = true;
      _arrItemsImageName.add(splits[splits.length - 1]);
      _arrItemsImageFile.add(image);
    });
  }

  @override
  void initState() {
    super.initState();

   this.onLoadActionProvinceMaster(widget.ItemCountry.RESPONSE_DATA[0].COUNTRY_ID);

    if(widget.IsUpdate){
      widget.ItemsPerson.PERSON_TYPE==0?_suspectType1=true:_suspectType2=true;
      widget.ItemsPerson.ENTITY_TYPE==0?_nationalityType1=true:_nationalityType2=true;
      editIdentifyNumber.text=widget.ItemsPerson.ID_CARD;
      editNameSus.text = widget.ItemsPerson.FIRST_NAME+" "+widget.ItemsPerson.LAST_NAME;

      editPassportNo.text= widget.ItemsPerson.PASSPORT_NO!=null?widget.ItemsPerson.PASSPORT_NO:"";

      //country

      //realtionship
      String mother,father;
      widget.ItemsPerson.MAS_PERSON_RELATIONSHIP.forEach((item){
        if(item.RELATIONSHIP_ID==1){
          String title = item.TITLE_SHORT_NAME_TH;
          for(int i=0;i<widget.ItemTitle.RESPONSE_DATA.length;i++){
            String stitle = widget.ItemTitle.RESPONSE_DATA[i].TITLE_SHORT_NAME_TH==null?widget.ItemTitle.RESPONSE_DATA[i].TITLE_NAME_TH
                :widget.ItemTitle.RESPONSE_DATA[i].TITLE_SHORT_NAME_TH;
            if(stitle.endsWith(title)){
              sTitleFather = widget.ItemTitle.RESPONSE_DATA[i];
            }
          }
          father= item.FIRST_NAME+" "+item.LAST_NAME;
        }else if(item.RELATIONSHIP_ID==2){
          String title = item.TITLE_SHORT_NAME_TH;
          for(int i=0;i<widget.ItemTitle.RESPONSE_DATA.length;i++){
            String stitle = widget.ItemTitle.RESPONSE_DATA[i].TITLE_SHORT_NAME_TH==null?widget.ItemTitle.RESPONSE_DATA[i].TITLE_NAME_TH
                :widget.ItemTitle.RESPONSE_DATA[i].TITLE_SHORT_NAME_TH;
            if(stitle.endsWith(title)){
              sTitleMother = widget.ItemTitle.RESPONSE_DATA[i];
            }
          }
          mother= item.FIRST_NAME+" "+item.LAST_NAME;
        }
      });
      editMother.text=mother;
      editFather.text=father;

      String title = widget.ItemsPerson.TITLE_SHORT_NAME_TH;
      for(int i=0;i<widget.ItemTitle.RESPONSE_DATA.length;i++){
        String stitle = widget.ItemTitle.RESPONSE_DATA[i].TITLE_SHORT_NAME_TH==null?widget.ItemTitle.RESPONSE_DATA[i].TITLE_NAME_TH
            :widget.ItemTitle.RESPONSE_DATA[i].TITLE_SHORT_NAME_TH;
        if(stitle.endsWith(title)){
          sTitle = widget.ItemTitle.RESPONSE_DATA[i];
        }
      }

    }else{
      _suspectType1 = true;
      _nationalityType1 = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    //node type1
    myFocusNodeIdentifyNumber.dispose();
    myFocusNodePassportNo.dispose();
    myFocusNodePassportCountry.dispose();
    myFocusNodeNameSus.dispose();
    myFocusNodeNameFather_1.dispose();
    myFocusNodeNameMother_1.dispose();
    myFocusNodePlace.dispose();
    //node type2
    myFocusNodeEntityNumber.dispose();
    myFocusNodeCompanyName.dispose();
    myFocusNodeExciseRegistrationNumber.dispose();
    myFocusNodeCompanyNameTitle.dispose();
    myFocusNodeCompanyHeadName.dispose();
    myFocusNodeNameFather_2.dispose();
    myFocusNodeNameMother_2.dispose();
  }

  Widget _buildContent(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          Container(
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
                  padding: EdgeInsets.all(22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: paddingLabel,
                        child: Text("ประเภทบุคคล", style: textLabelStyle,),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: size.width / 2.5,
                            child: Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _suspectType1 = true;
                                      _suspectType2 = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _suspectType1
                                          ? Colors.blue
                                          : Colors
                                          .white,
                                      border: Border.all(color: Colors.black12),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: _suspectType1
                                            ? Icon(
                                          Icons.check,
                                          size: 30.0,
                                          color: Colors.white,
                                        )
                                            : Container(
                                          height: 30.0,
                                          width: 30.0,
                                          color: Colors.transparent,
                                        )
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text('บุคคลธรรมดา',
                                    style: textStyleSelect,),
                                )
                              ],
                            ),
                          ),
                          Container(
                              width: size.width / 2.5,
                              child: Row(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _suspectType2 = true;
                                        _suspectType1 = false;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _suspectType2
                                            ? Colors.blue
                                            : Colors
                                            .white,
                                        border: Border.all(
                                            color: Colors.black12),
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: _suspectType2
                                              ? Icon(
                                            Icons.check,
                                            size: 30.0,
                                            color: Colors.white,
                                          )
                                              : Container(
                                            height: 30.0,
                                            width: 30.0,
                                            color: Colors.transparent,
                                          )
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text('นิติบุคคล',
                                      style: textStyleSelect,),
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                      Container(
                        padding: paddingLabel,
                        child: Text("ประเภทผู้ต้องหา", style: textLabelStyle,),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: size.width / 2.5,
                            child: Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _nationalityType1 = true;
                                      _nationalityType2 = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _nationalityType1
                                          ? Colors.blue
                                          : Colors
                                          .white,
                                      border: Border.all(color: Colors.black12),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: _nationalityType1
                                            ? Icon(
                                          Icons.check,
                                          size: 30.0,
                                          color: Colors.white,
                                        )
                                            : Container(
                                          height: 30.0,
                                          width: 30.0,
                                          color: Colors.transparent,
                                        )
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text('คนไทย',
                                    style: textStyleSelect,),
                                )
                              ],
                            ),
                          ),
                          Container(
                              width: size.width / 2.5,
                              child: Row(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _nationalityType2 = true;
                                        _nationalityType1 = false;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _nationalityType2
                                            ? Colors.blue
                                            : Colors.white,
                                        border: Border.all(
                                            color: Colors.black12),
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: _nationalityType2
                                              ? Icon(
                                            Icons.check,
                                            size: 30.0,
                                            color: Colors.white,
                                          )
                                              : Container(
                                            height: 30.0,
                                            width: 30.0,
                                            color: Colors.transparent,
                                          )
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text('คนต่างชาติ',
                                      style: textStyleSelect,),
                                  )
                                ],
                              )
                          ),
                        ],
                      ),
                      _suspectType1 ? _buildInputType1() : _buildInputType2(),
                      Container(height: (size.height * 10) / 100,)
                    ],
                  ),
                ),
              )
          ),
          Container(
            width: size.width,
            child: _buildButtonImgPicker(),
          ),
          _buildDataImage(context),
        ],
      ),
    );
  }

  Widget _buildInputType1() {
    var size = MediaQuery
        .of(context)
        .size;
    Widget _buildLine = Container(
      padding: EdgeInsets.only(top: 0.0, bottom: 4.0),
      height: 1.0,
      color: Colors.grey[300],
    );
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _nationalityType1 ? Column(
          children: <Widget>[
            Container(
              padding: paddingLabel,
              child: Row(
                children: <Widget>[
                  Text("หมายเลขบัตรประชาชน",
                    style: textLabelStyle,),
                  Text(" *", style: textStyleStar,),
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
          ],
        ) : Container(),
        Container(
          padding: paddingLabel,
          child: Row(
            children: <Widget>[
              Text("เลขที่หนังสือเดินทาง",
                style: textLabelStyle,),
              _nationalityType2
                  ? Text(" *", style: textStyleStar,)
                  : Container(),
            ],
          ),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            //maxLength: 14,
            focusNode: myFocusNodePassportNo,
            controller: editPassportNo,
            keyboardType: TextInputType.number,
            textCapitalization: TextCapitalization.words,
            style: textInputStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),

          ),
        ),
        _buildLine,
        _nationalityType2 ? Column(
          children: <Widget>[
            Container(
              padding: paddingLabel,
              child: Row(
                children: <Widget>[
                  Text("ประเทศหนังสือเดินทาง",
                    style: textLabelStyle,),
                ],
              ),
            ),
            Padding(
              padding: paddingInputBox,
              child: TextField(
                //maxLength: 14,
                focusNode: myFocusNodePassportCountry,
                controller: editPassportCountry,
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
        ) : Container(),
        Container(
          padding: paddingLabel,
          child: Row(
            children: <Widget>[
              Text("คำนำหน้าชื่อ",
                style: textLabelStyle,),
              Text(" *", style: textStyleStar,),
            ],
          ),
        ),
        Container(
          width: size.width,
          //padding: paddingInputBox,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<ItemsListTitle>(
              isExpanded: true,
              value: sTitle,
              onChanged: (ItemsListTitle newValue) {
                setState(() {
                  sTitle = newValue;
                });
              },
              items: widget.ItemTitle.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListTitle>>((
                  ItemsListTitle value) {
                return DropdownMenuItem<ItemsListTitle>(
                  value: value,
                  child: Text(value.TITLE_SHORT_NAME_TH == null
                      ? value.TITLE_NAME_TH
                      : value.TITLE_SHORT_NAME_TH
                    , style: textInputStyle,),
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
              Text("ชื่อผู้ต้องหา",
                style: textLabelStyle,),
              Text(" *", style: textStyleStar,),
            ],
          ),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            focusNode: myFocusNodeNameSus,
            controller: editNameSus,
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
          child: Row(
            children: <Widget>[
              Text("ประเทศ",
                style: textLabelStyle,),
              Text(" *", style: textStyleStar,),
            ],
          ),
        ),
        Container(
          width: size.width,
          //padding: paddingInputBox,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<ItemsListCountry>(
              isExpanded: true, //
              value: sCountry,
              onChanged: (ItemsListCountry newValue) {
                setState(() {
                  sCountry = newValue;
                  widget.ItemCountry.RESPONSE_DATA.forEach((f) {
                    if (f.COUNTRY_NAME_TH.endsWith(sCountry.COUNTRY_NAME_TH)) {
                      _onSelectCountry(f.COUNTRY_ID);
                    }
                  });
                });
              },
              items: widget.ItemCountry.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListCountry>>((
                  ItemsListCountry value) {
                return DropdownMenuItem<ItemsListCountry>(
                  value: value,
                  child: Text(value.COUNTRY_NAME_TH, style: textInputStyle,),
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
              Text("จังหวัด",
                style: textLabelStyle,),
              _nationalityType1
                  ? Text(" *", style: textStyleStar,)
                  : Container(),
            ],
          ),
        ),
        Container(
          width: size.width,
          //padding: paddingInputBox,
          child: DropdownButtonHideUnderline(
            child: ItemProvince != null ? DropdownButton<ItemsListProvince>(
              isExpanded: true, //
              value: sProvince,
              onChanged: (ItemsListProvince newValue) {
                setState(() {
                  sProvince = newValue;
                  ItemProvince.RESPONSE_DATA.forEach((f) {
                    if (f.PROVINCE_NAME_TH.endsWith(
                        sProvince.PROVINCE_NAME_TH)) {
                      sDistrict=null;
                      sSubDistrict=null;
                      _onSelectProvince(f.PROVINCE_ID);
                    }
                  });
                });
              },
              items: ItemProvince.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListProvince>>((
                  ItemsListProvince value) {
                return DropdownMenuItem<ItemsListProvince>(
                  value: value,
                  child: Text(value.PROVINCE_NAME_TH, style: textInputStyle,),
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
          child: Row(
            children: <Widget>[
              Text("อำเภอ/เขต",
                style: textLabelStyle,),
              _nationalityType1
                  ? Text(" *", style: textStyleStar,)
                  : Container(),
            ],
          ),
        ),
        Container(
          width: size.width,
          //padding: paddingInputBox,
          child: DropdownButtonHideUnderline(
            child: ItemDistrict != null ? DropdownButton<ItemsListDistict>(
              isExpanded: true, //
              value: sDistrict,
              onChanged: (ItemsListDistict newValue) {
                setState(() {
                  sDistrict = newValue;
                  ItemDistrict.RESPONSE_DATA.forEach((f) {
                    if (f.DISTRICT_NAME_TH.endsWith(
                        sDistrict.DISTRICT_NAME_TH)) {
                      sSubDistrict=null;
                      _onSelectDistrict(f.DISTRICT_ID);
                    }
                  });
                });
              },
              items: ItemDistrict.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListDistict>>((
                  ItemsListDistict value) {
                return DropdownMenuItem<ItemsListDistict>(
                  value: value,
                  child: Text(value.DISTRICT_NAME_TH, style: textInputStyle,),
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
          child: Row(
            children: <Widget>[
              Text("ตำบล/แขวง",
                style: textLabelStyle,),
              _nationalityType1
                  ? Text(" *", style: textStyleStar,)
                  : Container(),
            ],
          ),
        ),
        Container(
          width: size.width,
          //padding: paddingInputBox,
          child: DropdownButtonHideUnderline(
            child: ItemSubDistrict != null ? DropdownButton<
                ItemsListSubDistict>(
              isExpanded: true, //
              value: sSubDistrict,
              onChanged: (ItemsListSubDistict newValue) {
                setState(() {
                  sSubDistrict = newValue;
                });
              },
              items: ItemSubDistrict.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListSubDistict>>((
                  ItemsListSubDistict value) {
                return DropdownMenuItem<ItemsListSubDistict>(
                  value: value,
                  child: Text(
                    value.SUB_DISTRICT_NAME_TH, style: textInputStyle,),
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
          child: Text("คำนำหน้าชื่อ",
            style: textLabelStyle,),
        ),
        Container(
          width: size.width,
          //padding: paddingInputBox,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<ItemsListTitle>(
              value: sTitleFather,
              onChanged: (ItemsListTitle newValue) {
                setState(() {
                  sTitleFather = newValue;
                });
              },
              items: widget.ItemTitle.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListTitle>>((
                  ItemsListTitle value) {
                return DropdownMenuItem<ItemsListTitle>(
                  value: value,
                  child: Text(value.TITLE_SHORT_NAME_TH == null
                      ? value.TITLE_NAME_TH
                      : value.TITLE_SHORT_NAME_TH
                    , style: textInputStyle,),
                );
              })
                  .toList(),
            ),
          ),
        ),
        _buildLine,
        Container(
          padding: paddingLabel,
          child: Text("ชื่อบิดา", style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            focusNode: myFocusNodeNameFather_1,
            controller: editFather,
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
          child: Text("คำนำหน้าชื่อ",
            style: textLabelStyle,),
        ),
        Container(
          width: size.width,
          //padding: paddingInputBox,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<ItemsListTitle>(
              value: sTitleMother,
              onChanged: (ItemsListTitle newValue) {
                setState(() {
                  sTitleMother = newValue;
                });
              },
              items: widget.ItemTitle.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListTitle>>((
                  ItemsListTitle value) {
                return DropdownMenuItem<ItemsListTitle>(
                  value: value,
                  child: Text(value.TITLE_SHORT_NAME_TH == null
                      ? value.TITLE_NAME_TH
                      : value.TITLE_SHORT_NAME_TH
                    , style: textInputStyle,),
                );
              })
                  .toList(),
            ),
          ),
        ),
        _buildLine,
        Container(
          padding: paddingLabel,
          child: Text("ชื่อมารดา", style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            focusNode: myFocusNodeNameMother_1,
            controller: editMother,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            style: textInputStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        _buildLine,
        /*Container(
          padding: paddingLabel,
          child: Text("ที่อยู่สถานที่ประกอบ (ตำบล/อำเภอ/จังหวัด)",
            style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            focusNode: myFocusNodePlace,
            controller: editPlace,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            style: textInputStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        _buildLine,*/
      ],
    );
  }

  Widget _buildInputType2() {
    var size = MediaQuery
        .of(context)
        .size;
    Widget _buildLine = Container(
      padding: EdgeInsets.only(top: 0.0, bottom: 4.0),
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
              Text("เลขนิติบุคคล",
                style: textLabelStyle,),
              Text(" *", style: textStyleStar,),
            ],
          ),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            //maxLength: 14,
            focusNode: myFocusNodeEntityNumber,
            controller: editEntityNumber,
            keyboardType: TextInputType.number,
            textCapitalization: TextCapitalization.words,
            style: textInputStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        _buildLine,
        _nationalityType2 ? Column(
          children: <Widget>[
            Container(
              padding: paddingLabel,
              child: Row(
                children: <Widget>[
                  Text("เลขที่หนังสือเดินทาง",
                    style: textLabelStyle,),
                  _nationalityType2
                      ? Text(" *", style: textStyleStar,)
                      : Container(),
                ],
              ),
            ),
            Padding(
              padding: paddingInputBox,
              child: TextField(
                //maxLength: 14,
                focusNode: myFocusNodePassportNo,
                controller: editPassportNo,
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
        ) : Container(),
        Container(
          padding: paddingLabel,
          child: Row(
            children: <Widget>[
              Text("ชื่อสถานประกอบการ",
                style: textLabelStyle,),
              Text(" *", style: textStyleStar,)
            ],
          ),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            focusNode: myFocusNodeCompanyName,
            controller: editCompanyName,
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
          child: Text("เลขทะเบียนสรรพสามิต", style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            focusNode: myFocusNodeExciseRegistrationNumber,
            controller: editExciseRegistrationNumber,
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
          child: Row(
            children: <Widget>[
              Text("คำนำหน้าชื่อตัวแทนสถานประกอบการ",
                style: textLabelStyle,),
              Text(" *", style: textStyleStar,),
            ],
          ),
        ),
        Container(
          width: size.width,
          //padding: paddingInputBox,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<ItemsListTitle>(
              value: sTitleHeadCompany,
              onChanged: (ItemsListTitle newValue) {
                setState(() {
                  sTitleHeadCompany = newValue;
                });
              },
              items: widget.ItemTitle.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListTitle>>((
                  ItemsListTitle value) {
                return DropdownMenuItem<ItemsListTitle>(
                  value: value,
                  child: Text(value.TITLE_SHORT_NAME_TH == null
                      ? value.TITLE_NAME_TH
                      : value.TITLE_SHORT_NAME_TH
                    , style: textInputStyle,),
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
              Text("ชื่อตัวแทนสถานประกอบการ",
                style: textLabelStyle,),
              Text(" *", style: textStyleStar,),
            ],
          ),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            focusNode: myFocusNodeCompanyHeadName,
            controller: editCompanyHeadName,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            style: textInputStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        _buildLine,
        _nationalityType2 ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: paddingLabel,
              child: Row(
                children: <Widget>[
                  Text("ประเทศ",
                    style: textLabelStyle,),
                  Text(" *", style: textStyleStar,),
                ],
              ),
            ),
            Container(
              width: size.width,
              //padding: paddingInputBox,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<ItemsListCountry>(
                  isExpanded: true, //
                  value: sCountry2,
                  onChanged: (ItemsListCountry newValue) {
                    setState(() {
                      sCountry2 = newValue;
                      widget.ItemCountry.RESPONSE_DATA.forEach((f) {
                        if (f.COUNTRY_NAME_TH.endsWith(
                            sCountry.COUNTRY_NAME_TH)) {
                          _onSelectCountry(f.COUNTRY_ID);
                        }
                      });
                    });
                  },
                  items: widget.ItemCountry.RESPONSE_DATA
                      .map<DropdownMenuItem<ItemsListCountry>>((
                      ItemsListCountry value) {
                    return DropdownMenuItem<ItemsListCountry>(
                      value: value,
                      child: Text(
                        value.COUNTRY_NAME_TH, style: textInputStyle,),
                    );
                  })
                      .toList(),
                ),
              ),
            ),
            _buildLine,
          ],
        ) : Container(),
        Container(
          padding: paddingLabel,
          child: Row(
            children: <Widget>[
              Text("จังหวัด",
                style: textLabelStyle,),
              _nationalityType1
                  ? Text(" *", style: textStyleStar,)
                  : Container(),
            ],
          ),
        ),
        Container(
          width: size.width,
          //padding: paddingInputBox,
          child: DropdownButtonHideUnderline(
            child: ItemProvince != null ? DropdownButton<ItemsListProvince>(
              isExpanded: true, //
              value: sProvince2,
              onChanged: (ItemsListProvince newValue) {
                setState(() {
                  sProvince2 = newValue;
                  ItemProvince.RESPONSE_DATA.forEach((f) {
                    if (f.PROVINCE_NAME_TH.endsWith(
                        sProvince2.PROVINCE_NAME_TH)) {
                      sDistrict2 = null;
                      sSubDistrict2 = null;
                      _onSelectProvince(f.PROVINCE_ID);
                    }
                  });
                });
              },
              items: ItemProvince.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListProvince>>((
                  ItemsListProvince value) {
                return DropdownMenuItem<ItemsListProvince>(
                  value: value,
                  child: Text(value.PROVINCE_NAME_TH, style: textInputStyle,),
                );
              })
                  .toList(),
            ) : Container(
              padding: paddingLabel, child: Container(),),
          ),
        ),
        _buildLine,
        Container(
          padding: paddingLabel,
          child: Row(
            children: <Widget>[
              Text("อำเภอ/เขต",
                style: textLabelStyle,),
              _nationalityType1
                  ? Text(" *", style: textStyleStar,)
                  : Container(),
            ],
          ),
        ),
        Container(
          width: size.width,
          //padding: paddingInputBox,
          child: DropdownButtonHideUnderline(
            child: ItemDistrict != null ? DropdownButton<ItemsListDistict>(
              isExpanded: true, //
              value: sDistrict2,
              onChanged: (ItemsListDistict newValue) {
                setState(() {
                  sDistrict2 = newValue;
                  ItemDistrict.RESPONSE_DATA.forEach((f) {
                    if (f.DISTRICT_NAME_TH.endsWith(
                        sDistrict2.DISTRICT_NAME_TH)) {
                      sSubDistrict2 = null;
                      _onSelectDistrict(f.DISTRICT_ID);
                    }
                  });
                });
              },
              items: ItemDistrict.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListDistict>>((
                  ItemsListDistict value) {
                return DropdownMenuItem<ItemsListDistict>(
                  value: value,
                  child: Text(value.DISTRICT_NAME_TH, style: textInputStyle,),
                );
              })
                  .toList(),
            ) : Container(
              padding: paddingLabel, child: Container(),),
          ),
        ),
        _buildLine,
        Container(
          padding: paddingLabel,
          child: Row(
            children: <Widget>[
              Text("ตำบล/แขวง",
                style: textLabelStyle,),
              _nationalityType1
                  ? Text(" *", style: textStyleStar,)
                  : Container(),
            ],
          ),
        ),
        Container(
          width: size.width,
          //padding: paddingInputBox,
          child: DropdownButtonHideUnderline(
            child: ItemSubDistrict != null ? DropdownButton<
                ItemsListSubDistict>(
              isExpanded: true, //
              value: sSubDistrict2,
              onChanged: (ItemsListSubDistict newValue) {
                setState(() {
                  sSubDistrict2 = newValue;
                });
              },
              items: ItemSubDistrict.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListSubDistict>>((
                  ItemsListSubDistict value) {
                return DropdownMenuItem<ItemsListSubDistict>(
                  value: value,
                  child: Text(
                    value.SUB_DISTRICT_NAME_TH, style: textInputStyle,),
                );
              })
                  .toList(),
            ) : Container(
              padding: paddingLabel, child: Container(),),
          ),
        ),
        _buildLine,
        Container(
          padding: paddingLabel,
          child: Text("คำนำหน้าชื่อ",
            style: textLabelStyle,),
        ),
        Container(
          width: size.width,
          //padding: paddingInputBox,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<ItemsListTitle>(
              value: sTitleFatherHeadCompany,
              onChanged: (ItemsListTitle newValue) {
                setState(() {
                  sTitleFatherHeadCompany = newValue;
                });
              },
              items: widget.ItemTitle.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListTitle>>((
                  ItemsListTitle value) {
                return DropdownMenuItem<ItemsListTitle>(
                  value: value,
                  child: Text(value.TITLE_SHORT_NAME_TH == null
                      ? value.TITLE_NAME_TH
                      : value.TITLE_SHORT_NAME_TH
                    , style: textInputStyle,),
                );
              })
                  .toList(),
            ),
          ),
        ),
        _buildLine,
        Container(
          padding: paddingLabel,
          child: Text("ชื่อบิดาตัวแทนสถานประกอบการ", style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            focusNode: myFocusNodeNameFather_2,
            controller: editNameFather_2,
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
          child: Text("คำนำหน้าชื่อ",
            style: textLabelStyle,),
        ),
        Container(
          width: size.width,
          //padding: paddingInputBox,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<ItemsListTitle>(
              value: sTitleMotherHeadCompany,
              onChanged: (ItemsListTitle newValue) {
                setState(() {
                  sTitleMotherHeadCompany = newValue;
                });
              },
              items: widget.ItemTitle.RESPONSE_DATA
                  .map<DropdownMenuItem<ItemsListTitle>>((
                  ItemsListTitle value) {
                return DropdownMenuItem<ItemsListTitle>(
                  value: value,
                  child: Text(value.TITLE_SHORT_NAME_TH == null
                      ? value.TITLE_NAME_TH
                      : value.TITLE_SHORT_NAME_TH
                    , style: textInputStyle,),
                );
              })
                  .toList(),
            ),
          ),
        ),
        _buildLine,
        Container(
          padding: paddingLabel,
          child: Text("ชื่อมารดาตัวแทนสถานประกอบการ", style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: TextField(
            focusNode: myFocusNodeNameMother_2,
            controller: editNameMother_2,
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

  Widget _buildButtonImgPicker() {
    var size = MediaQuery
        .of(context)
        .size;
    Color boxColor = Colors.grey[300];
    Color uploadColor = Color(0xff31517c);
    TextStyle textLabelStyle = TextStyle(fontSize: 16.0, color: uploadColor,fontFamily: FontStyles().FontFamily);
    return Container(
      padding: EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Card(
              shape: new RoundedRectangleBorder(
                  side: new BorderSide(
                      color: boxColor, width: 1.5),
                  borderRadius: BorderRadius.circular(42.0)
              ),
              elevation: 0.0,
              child: Container(
                width: size.width / 2,
                child: MaterialButton(
                  onPressed: () {
                    //_onImageButtonPressed(ImageSource.gallery, context);
                    getImage();
                  },
                  splashColor: Colors.grey,
                  child: Container(
                      padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            //padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.file_upload, size: 32, color: uploadColor,),
                          ),
                          Container(
                            //padding: EdgeInsets.all(4.0),
                            child: Text(
                              "แนบรูปผู้ต้องหา", style: textLabelStyle,),
                          ),

                        ],
                      )
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
  Widget _buildDataImage(BuildContext context) {
    TextStyle textInputStyleTitle = TextStyle(
        fontSize: 16.0, color: Colors.black,fontFamily: FontStyles().FontFamily);
    return Container(
      padding: EdgeInsets.only(bottom: 22.0),
      child: ListView.builder(
          itemCount: _arrItemsImageFile.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(top: 0.3, bottom: 0.3),
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border: Border(
                      top: BorderSide(color: Colors.grey[300], width: 1.0),
                      bottom: BorderSide(color: Colors.grey[300], width: 1.0),
                    )
                ),
                child: ListTile(
                    leading: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.white30),
                      ),
                      //margin: const EdgeInsets.only(top: 32.0, left: 16.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Image.file(_arrItemsImageFile[index],fit: BoxFit.cover,),
                    ),
                    title: Text(_arrItemsImageName[index],
                      style: textInputStyleTitle,),
                    trailing: new ButtonTheme(
                      minWidth: 44.0,
                      padding: new EdgeInsets.all(0.0),
                      child: new FlatButton(
                        child: Icon(Icons.delete_outline,size: 32.0,),
                        onPressed: (){
                          setState(() {
                            //print(index.toString());
                            _arrItemsImageFile.removeAt(index);
                            _arrItemsImageName.removeAt(index);
                            if(_arrItemsImageFile.length==0){
                              isImage=false;
                            }
                          });
                        },
                      ),
                    ),
                    onTap: () {
                      //
                    }
                ),
              ),
            );
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    TextStyle styleTextAppbar = TextStyle(fontSize: 18.0, color: Colors.white,fontFamily: FontStyles().FontFamily);
    return new WillPopScope(
      onWillPop: () {
        //
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // here the desired height
          child: AppBar(
            title: new Padding(
              padding: EdgeInsets.only(right: 22.0),
              child: new Text("สร้างผู้ต้องหา",
                style: styleTextAppbar,
              ),
            ),
            centerTitle: true,
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context, "back");
                }),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  String SuspectType;
                  String IdentifyNumber;
                  String NationalityType;
                  String NameTitle;
                  String NameSus;
                  String NameFather;
                  String NameMother;
                  String Place;
                  int OffenseCount = 0;
                  bool isCheck = false;

                  String EntityNumber;
                  String CompanyName;
                  String ExciseRegistrationNumber;

                  if (_nationalityType1) {
                    NationalityType = "คนไทย";
                  } else {
                    NationalityType = "คนต่างชาติ";
                  }
                  if (_suspectType1) {
                    SuspectType = "บุคคลธรรมดา";
                    IdentifyNumber = editIdentifyNumber.text;
                    NameTitle = /*dropdownValue_1*/"";
                    NameSus = editNameSus.text;
                    NameFather = editFather.text;
                    NameMother = editMother.text;
                    Place = editPlace.text;
                    EntityNumber = null;
                    CompanyName = null;
                    ExciseRegistrationNumber = null;
                  } else {
                    SuspectType = "นิติบุคคล";
                    IdentifyNumber = null;
                    NameTitle = dropdownValue_2;
                    NameSus = editCompanyHeadName.text;
                    NameFather = editNameFather_2.text;
                    NameMother = editNameMother_2.text;
                    Place = null;
                    EntityNumber = editEntityNumber.text;
                    CompanyName = editCompanyName.text;
                    ExciseRegistrationNumber =
                        editExciseRegistrationNumber.text;
                  }
                  //สร้างผู้ต้องหา
                  /*_itemData.add(new ItemsListArrest4(
                      SuspectType,
                      NationalityType,
                      IdentifyNumber,
                      NameTitle,
                      NameSus,
                      NameFather,
                      NameMother,
                      Place,
                      OffenseCount,
                      isCheck,
                      EntityNumber,
                      CompanyName,
                      ExciseRegistrationNumber,
                      "",
                      0));*/

                  _onSaved(context);

                 // Navigator.pop(context, _itemData);
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
                          child: new Text('ILG60_B_01_00_14_00',
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
                      child: Column(
                        children: <Widget>[
                          _buildContent(context),
                        ],
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Map _mapData(){
    String firstname,lastname;
    String fa_firstname="",fa_lastname="";
    String mo_firstname="",mo_lastname="";
    int entity_type,person_type;
    var ItemTitle;
    var ItemFatherTitle;
    var ItemMotherTitle;
    var ItemCountry;
    var ItemProvince;
    var ItemDistrict;
    var ItemSubDistrict;
    if(_suspectType1){
      ItemTitle = sTitle;
      ItemFatherTitle = sTitleFather;
      ItemMotherTitle = sTitleMother;
      ItemCountry = sCountry;
      ItemProvince = sProvince;
      ItemDistrict = sDistrict;
      ItemSubDistrict = sSubDistrict;

      entity_type = 0;
      List splitsName = editNameSus.text.split(" ");
      if(splitsName.length>1){
        firstname=splitsName[0];
        lastname=splitsName[1];
      }else{
        firstname=splitsName[0];
        lastname="";
      }

      List splitsFaName = editFather.text.split(" ");
      if(splitsFaName.length>1){
        fa_firstname=splitsFaName[0];
        fa_lastname=splitsFaName[1];
      }else{
        fa_firstname=splitsFaName[0];
        fa_lastname="";
      }
      List splitsMoName = editMother.text.split(" ");
      if(splitsMoName.length>1){
        mo_firstname=splitsMoName[0];
        mo_lastname=splitsMoName[1];
      }else{
        mo_firstname=splitsMoName[0];
        mo_lastname="";
      }

    }else{
      ItemTitle = sTitleHeadCompany;
      ItemFatherTitle = sTitleFatherHeadCompany;
      ItemMotherTitle = sTitleMotherHeadCompany;
      ItemCountry = sCountry2;
      ItemProvince = sProvince2;
      ItemDistrict = sDistrict2;
      ItemSubDistrict = sSubDistrict2;

      entity_type=1;
      List splitsName = editCompanyHeadName.text.split(" ");
      if(splitsName.length>1){
        firstname=splitsName[0];
        lastname=splitsName[1];
      }else{
        firstname=splitsName[0];
        lastname="";
      }

      List splitsFaName = editNameFather_2.text.split(" ");
      if(splitsFaName.length>1){
        fa_firstname=splitsFaName[0];
        fa_lastname=splitsFaName[1];
      }else{
        fa_firstname=splitsFaName[0];
        fa_lastname="";
      }
      List splitsMoName = editNameMother_2.text.split(" ");
      if(splitsMoName.length>1){
        mo_firstname=splitsMoName[0];
        mo_lastname=splitsMoName[1];
      }else{
        mo_firstname=splitsMoName[0];
        mo_lastname="";
      }
    }

    if(_nationalityType1){
      person_type=0;
    }else{
      person_type=1;
    }

    String id_card="";
    if(_suspectType1&&_nationalityType1){
      id_card = editIdentifyNumber.text;
    }
    String COMPANY_REGISTRATION_NO="";
    String EXCISE_REGISTRATION_NO="";
    if(_suspectType2&&_nationalityType1){
      COMPANY_REGISTRATION_NO = editEntityNumber.text;
      EXCISE_REGISTRATION_NO = editExciseRegistrationNumber.text;
    }
    /*List<Map> map_relationship = [
      {
        "PERSON_RELATIONSHIP_ID": "",
        "RELATIONSHIP_ID": 1,
        "PERSON_ID": "",
        "TITLE_ID": ItemFatherTitle.TITLE_ID,
        "TITLE_NAME_TH": ItemFatherTitle.TITLE_NAME_TH,
        "TITLE_NAME_EN": ItemFatherTitle.TITLE_NAME_EN,
        "TITLE_SHORT_NAME_TH": ItemFatherTitle.TITLE_SHORT_NAME_TH,
        "TITLE_SHORT_NAME_EN": ItemFatherTitle.TITLE_SHORT_NAME_EN,
        "FIRST_NAME": fa_firstname,
        "MIDDLE_NAME": "",
        "LAST_NAME": fa_lastname,
        "OTHER_NAME": "",
        "GENDER_TYPE": 1,
        "ID_CARD": "",
        "BIRTH_DATE": "",
        "BLOOD_TYPE": "",
        "CAREER": "",
        "PERSON_DESC": "",
        "EMAIL": "",
        "TEL_NO": "",
        "IS_ACTIVE": 1
      },
      {
        "PERSON_RELATIONSHIP_ID": "",
        "RELATIONSHIP_ID": 2,
        "PERSON_ID": "",
        "TITLE_ID": ItemMotherTitle.TITLE_ID,
        "TITLE_NAME_TH": ItemMotherTitle.TITLE_NAME_TH,
        "TITLE_NAME_EN": ItemMotherTitle.TITLE_NAME_EN,
        "TITLE_SHORT_NAME_TH": ItemMotherTitle.TITLE_SHORT_NAME_TH,
        "TITLE_SHORT_NAME_EN": ItemMotherTitle.TITLE_SHORT_NAME_EN,
        "FIRST_NAME": mo_firstname,
        "MIDDLE_NAME": "",
        "LAST_NAME": mo_lastname,
        "OTHER_NAME": "",
        "GENDER_TYPE": 0,
        "ID_CARD": "",
        "BIRTH_DATE": "",
        "BLOOD_TYPE": "",
        "CAREER": "",
        "PERSON_DESC": "",
        "EMAIL": "",
        "TEL_NO": "",
        "IS_ACTIVE": 1
      }
    ];*/


    List<Map> map_photo = [];
    _arrItemsImageFile.forEach((file){
      List<int> imageBytes = file.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      map_photo.add({
        "PHOTO_ID": "",
        "PERSON_ID": "",
        "PERSON_RELATIONSHIP_ID": "",
        "PHOTO": base64Image,
        "TYPE": "",
        "IS_ACTIVE": 1
      });
    });

    Map map = {
      "PERSON_ID": "",
      "COUNTRY_ID": ItemCountry.COUNTRY_ID,
      "NATIONALITY_ID": 1,
      "RACE_ID": 1,
      "RELIGION_ID": 1,
      "TITLE_ID": ItemTitle.TITLE_ID,
      "PERSON_TYPE": person_type,
      "ENTITY_TYPE": entity_type,
      "TITLE_NAME_TH": ItemTitle.TITLE_NAME_TH,
      "TITLE_NAME_EN": ItemTitle.TITLE_NAME_EN,
      "TITLE_SHORT_NAME_TH": ItemTitle.TITLE_SHORT_NAME_TH,
      "TITLE_SHORT_NAME_EN": ItemTitle.TITLE_SHORT_NAME_EN,
      "FIRST_NAME": firstname,
      "MIDDLE_NAME": "",
      "LAST_NAME": lastname,
      "OTHER_NAME": "",
      "COMPANY_REGISTRATION_NO": COMPANY_REGISTRATION_NO,
      "COMPANY_FOUND_DATE": "",
      "COMPANY_LICENSE_NO": "",
      "COMPANY_LICENSE_DATE_FROM": "",
      "COMPANY_LICENSE_DATE_TO": "",
      "EXCISE_REGISTRATION_NO": EXCISE_REGISTRATION_NO,
      "GENDER_TYPE": 0,
      "ID_CARD": id_card,
      "BIRTH_DATE": "",
      "BLOOD_TYPE": "",
      "PASSPORT_NO": editPassportNo.text,
      "VISA_TYPE": "",
      "PASSPORT_DATE_IN": "",
      "PASSPORT_DATE_OUT": "",
      "MARITAL_STATUS": 0,
      "CAREER": "",
      "PERSON_DESC": "",
      "EMAIL": "",
      "TEL_NO": "",
      "MISTREAT_NO": 0,
      "IS_ILLEGAL": 1,
      "IS_ACTIVE": 1,
      "MasPersonAddress":
      [
        {
          "PERSON_ADDRESS_ID": "",
          "PERSON_ID": "",
          "SUB_DISTRICT_ID": ItemSubDistrict.SUB_DISTRICT_ID,
          "GPS": "",
          "ADDRESS_NO": "",
          "VILLAGE_NO": "",
          "BUILDING_NAME": "",
          "ROOM_NO": "",
          "FLOOR": "22",
          "VILLAGE_NAME": "",
          "ALLEY": "",
          "LANE": "",
          "ROAD": "",
          "ADDRESS_TYPE": 0,
          "ADDRESS_DESC": "",
          "ADDRESS_STATUS": 0,
          "IS_ACTIVE": 1
        }
      ],
      /*"MasPersonRelationship": map_relationship,
      "MasPersonPhoto": map_photo,*/
    };
    return map;
  }
  void _onSaved(mContext)async{
    bool IsSuccess=false;
    if(_suspectType1) {
      if(_nationalityType1){
        if (editIdentifyNumber.text.isEmpty) {
          _showSearchEmptyAlertDialog(mContext,'กรุณากรอกหมายเลขบัตรประชาชน');
        } else if (sTitle == null) {
          _showSearchEmptyAlertDialog(mContext,'กรุณาเลือกคำนำหน้าชื่อผู้ต้องหา');
        } else if (editNameSus.text.isEmpty) {
          _showSearchEmptyAlertDialog(mContext,'กรุณากรอกชื่อผู้ต้องหา');
        } else if (sCountry == null||sProvince == null||sDistrict == null||sSubDistrict == null) {
          _showSearchEmptyAlertDialog(mContext,'กรุณากรอกเลือกประเทศ/จังหวัด/อำเถอ/ตำบล');
        } else{
          IsSuccess=true;
        }
      }else{
        if (editPassportNo.text.isEmpty) {
          _showSearchEmptyAlertDialog(mContext,'กรุณากรอกเลขที่หนังสือเดินทาง');
        } else if (sTitle == null) {
          _showSearchEmptyAlertDialog(mContext,'กรุณาเลือกคำนำหน้าชื่อผู้ต้องหา');
        }else if (editNameSus.text.isEmpty) {
          _showSearchEmptyAlertDialog(mContext,'กรุณากรอกชื่อผู้ต้องหา');
        }else if (sCountry == null) {
          _showSearchEmptyAlertDialog(mContext,'กรุณากรอกเลือกประเทศ');
        }else{
          IsSuccess=true;
        }
      }
    }else{
      if(_nationalityType1){
        if (editEntityNumber.text.isEmpty) {
          _showSearchEmptyAlertDialog(mContext,'กรุณากรอกเลขนิติบุคคล');
        } else if (editCompanyName.text.isEmpty) {
          _showSearchEmptyAlertDialog(mContext,'กรุณากรอกชื่อสถานประกอบการ');
        }else if (sTitleHeadCompany == null) {
          _showSearchEmptyAlertDialog(mContext,'กรุณาเลือกคำนำหน้าชื่อตัวแทนสถานประกอบการ');
        }else if (editCompanyHeadName.text.isEmpty) {
          _showSearchEmptyAlertDialog(mContext,'กรุณาเลือกคำนำหน้าชื่อตัวแทนสถานประกอบการ');
        }else if (sProvince2 == null||sDistrict2 == null||sSubDistrict2 == null) {
          _showSearchEmptyAlertDialog(mContext,'กรุณากรอกเลือก/จังหวัด/อำเถอ/ตำบล');
        }else{
          IsSuccess=true;
        }
      }else{
        if (editEntityNumber.text.isEmpty) {
          _showSearchEmptyAlertDialog(mContext,'กรุณากรอกเลขนิติบุคคล');
        }else if (editPassportNo.text.isEmpty) {
          _showSearchEmptyAlertDialog(mContext,'กรุณากรอกเลขที่หนังสือเดินทาง');
        } else if (editCompanyName.text.isEmpty) {
          _showSearchEmptyAlertDialog(mContext,'กรุณากรอกชื่อสถานประกอบการ');
        }else if (sTitleHeadCompany == null) {
          _showSearchEmptyAlertDialog(mContext,'กรุณาเลือกคำนำหน้าชื่อตัวแทนสถานประกอบการ');
        }else if (editCompanyHeadName.text.isEmpty) {
          _showSearchEmptyAlertDialog(mContext,'กรุณาเลือกคำนำหน้าชื่อตัวแทนสถานประกอบการ');
        }else if (sCountry2 == null) {
          _showSearchEmptyAlertDialog(mContext,'กรุณากรอกเลือกประเทศ');
        }else{
          IsSuccess=true;
        }
      }
    }

    if(IsSuccess){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: CupertinoActivityIndicator(
              ),
            );
          });
      await onLoadActionInsPersonAllMaster(_mapData());
      Navigator.pop(context,_getPersonResponse.RESPONSE_DATA);
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

  void _onSelectCountry(int COUNTRY_ID)async{
    await onLoadActionProvinceMaster(COUNTRY_ID);
  }
  void _onSelectProvince(int PROVINCE_ID)async{
    await onLoadActionDistinctMaster(PROVINCE_ID);
  }
  void _onSelectDistrict(int DISTRICT_ID)async{
    await onLoadActionSubDistinctMaster(DISTRICT_ID);
  }

  Future<bool> onLoadActionProvinceMaster(int COUNTRY_ID) async {
    Map map = {
      "TEXT_SEARCH" : "",
      "COUNTRY_ID" : COUNTRY_ID
    };
    await new ArrestFutureMaster().apiRequestMasProvincegetByCon(map).then((onValue) {
      ItemProvince = onValue;
      this.onLoadActionDistinctMaster(onValue.RESPONSE_DATA[0].PROVINCE_ID);
    });
    setState(() {});
    return true;
  }
  Future<bool> onLoadActionDistinctMaster(int PROVINCE_ID) async {
    Map map = {
      "TEXT_SEARCH" : "",
      "DISTRICT_ID" : "",
      "PROVINCE_ID" : PROVINCE_ID
    };
    await new ArrestFutureMaster().apiRequestMasDistrictgetByCon(map).then((onValue) {
      ItemDistrict = onValue;
      this.onLoadActionSubDistinctMaster(onValue.RESPONSE_DATA[0].DISTRICT_ID);
    });
    setState(() {
    });
    return true;
  }
  Future<bool> onLoadActionSubDistinctMaster(int DISTRICT_ID) async {
    Map map = {
      "TEXT_SEARCH" : "",
      "SUB_DISTRICT_ID" : "",
      "DISTRICT_ID" : DISTRICT_ID
    };
    await new ArrestFutureMaster().apiRequestMasSubDistrictgetByCon(map).then((onValue) {
      ItemSubDistrict = onValue;
    });
    setState(() {});
    return true;
  }

  Future<bool> onLoadActionInsPersonAllMaster(Map map) async {
    int PERSON_ID;
    await new ArrestFutureMaster().apiRequestMasPersoninsAll(map).then((onValue) {
      PERSON_ID = onValue.RESPONSE_DATA;
    });

    if(PERSON_ID!=null){
      Map map_person={
        "TEXT_SEARCH" : "",
        "PERSON_ID" : PERSON_ID
      };
      print(map_person.toString());
      await new ArrestFutureMaster().apiRequestMasPersongetByCon(map_person).then((onValue) {
        _getPersonResponse = onValue;
        Navigator.pop(context);
      });
    }

    setState(() {});
    return true;
  }
}