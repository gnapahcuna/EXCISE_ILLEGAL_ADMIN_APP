import 'package:flutter/material.dart';
import 'package:prototype_app_pang/font_family/font_style.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_5.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_6_section.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/tab_creen_arrest/tab_arrest_6/tab_screen_arrest_6_product.dart';

class TabScreenArrest6Evidence extends StatefulWidget {
  String Title,Detail;
  ItemsListArrest6Section ItemsData;
  List ItemsProduct;
  TabScreenArrest6Evidence({
    Key key,
    @required this.Title,
    @required this.Detail,
    @required this.ItemsData,
    @required this.ItemsProduct,
  }) : super(key: key);
  @override
  _TabScreenArrest6EvidenceState createState() => new _TabScreenArrest6EvidenceState();
}
class _TabScreenArrest6EvidenceState extends State<TabScreenArrest6Evidence>  {
  List  _itemsInit = [
  ];
  List _itemsDataSelect = [];
  int _countItem = 0;
  bool isCheckAll=false;

  TextStyle textInputStyle = TextStyle(fontSize: 16.0, color: Colors.black,fontFamily: FontStyles().FontFamily);
  TextStyle textLabelStyle = TextStyle(fontSize: 16.0, color: Color(0xff087de1),fontFamily: FontStyles().FontFamily);
  EdgeInsets paddingInputBox = EdgeInsets.only(top: 4.0, bottom: 0.0);
  EdgeInsets paddingLabel = EdgeInsets.only(top: 12.0);

  @override
  void initState() {
    super.initState();
    widget.ItemsProduct.forEach((item){
      item.IsCheckOffence=false;
    });
    _itemsInit=widget.ItemsProduct;
  }

  Widget _buildSearchResults() {
    TextStyle textLabelEditNonCheckStyle = TextStyle(fontSize: 16.0,
        color: Colors.red[100],
        fontFamily: FontStyles().FontFamily);
    TextStyle textInputStyleTitle = TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        fontFamily: FontStyles().FontFamily);
    EdgeInsets paddingLabel = EdgeInsets.only(top: 0.0);
    var size = MediaQuery
        .of(context)
        .size;
    final double Width = (size.width * 40) / 100;

    return ListView.builder(
      itemCount: _itemsInit.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
          child: Container(
            padding: EdgeInsets.all(22.0),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border(
                  //top: BorderSide(color: Colors.grey[300], width: 1.0),
                  bottom: BorderSide(color: Colors.grey[300], width: 1.0),
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: paddingLabel,
                        child: Text(
                          _itemsInit[index].PRODUCT_CATEGORY_NAME + ' > ' +
                              _itemsInit[index].PRODUCT_TYPE_NAME + ' > ' +
                              _itemsInit[index].PRODUCT_BRAND_NAME_TH,
                          style: textInputStyleTitle,),
                      ),
                    ),
                    Center(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _itemsInit[index].IsCheckOffence =
                              !_itemsInit[index].IsCheckOffence;

                              int count = 0;
                              _itemsInit.forEach((ev) {
                                if (ev.IsCheckOffence) {
                                  count++;
                                }
                              });
                              count == _itemsInit.length
                                  ? isCheckAll = true
                                  : isCheckAll = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: _itemsInit[index].IsCheckOffence
                                  ? Color(0xff3b69f3)
                                  : Colors.white,
                              border: _itemsInit[index].IsCheckOffence
                                  ? Border.all(
                                  color: Color(0xff3b69f3), width: 2)
                                  : Border.all(
                                  color: Colors.grey[400], width: 2),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: _itemsInit[index].IsCheckOffence
                                    ? Icon(
                                  Icons.check,
                                  size: 18.0,
                                  color: Colors.white,
                                )
                                    : Container(
                                  height: 18.0,
                                  width: 18.0,
                                  color: Colors.transparent,
                                )
                            ),
                          ),
                        )
                    ),
                  ],
                ),
                _itemsInit[index].IsCheckOffence ?
                Container(
                  padding: EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: Width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: paddingLabel,
                              child: Text(
                                "ค่าปรับประมาณการ", style: textLabelStyle,),
                            ),
                            Container(
                              padding: paddingInputBox,
                              child: TextField(
                                style: textInputStyle,
                                focusNode: _itemsInit[index].Arrest6Controller
                                    .myFocusNodeFine,
                                controller: _itemsInit[index].Arrest6Controller
                                    .editFine,
                                keyboardType: TextInputType.number,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffix: Text("บาท",style: textInputStyle,)
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 0.0, bottom: 4.0),
                              height: 1.0,
                              color: Colors.grey[300],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                _navigateEdit(context, _itemsInit[index]);
                              },
                              child: Container(
                                  child: Text(
                                    "แก้ไข", style: textLabelEditNonCheckStyle,)
                              ),
                            ),
                          ],
                        )
                      )
                    ],
                  ),
                )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
  _navigateEdit(BuildContext context,item) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TabScreenArrest6Product(ItemsProductEdit: item,IsComplete: false,)),
    );
    setState(() {
      _itemsDataSelect = result;
    });

  }

  Widget _buildBottom() {
    var size = MediaQuery
        .of(context)
        .size;
    TextStyle textStyleButton = TextStyle(color: Colors.white,
        fontSize: 18.0,
        fontFamily: FontStyles().FontFamily);
    bool isCheck = false;
    bool IsLawbreaker = false;
    if(widget.ItemsData.ArrestIndictmentDetail.length>0){
      IsLawbreaker=true;
      isCheck=true;
    }
    _countItem = 0;
    _itemsInit.forEach((item) {
      if (item.IsCheckOffence)
        setState(() {
          isCheck = item.IsCheckOffence;
          _countItem++;
        });
    });
    return isCheck ? Container(
      width: size.width,
      height: 65,
      color: Color(0xff2e76bc),
      child: MaterialButton(
        onPressed: () {
          double fine = 0;
          _itemsDataSelect = [];
          for(int i=0;i<_itemsInit.length;i++){
            if (_itemsInit[i].IsCheckOffence) {
              if (_itemsInit[i].Arrest6Controller.editFine.text.isEmpty) {
                fine = 0;
              } else {
                fine = double.parse(_itemsInit[i].Arrest6Controller.editFine.text);
              }
              _itemsInit[i].FINE_ESTIMATE = fine;
              _itemsInit[i].INDEX=i;
              _itemsDataSelect.add(_itemsInit[i]);
            }
          }
          widget.ItemsData.ArrestIndictmentProduct = _itemsDataSelect;
          Navigator.pop(context, widget.ItemsData);
        },
        child: Center(
          child: Text(IsLawbreaker?'ถัดไป':'ถัดไป (${_countItem})', style: textStyleButton,),
        ),
      ),
    ) : null;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle styleTextAppbar = TextStyle(fontSize: 18.0, color: Colors.white,fontFamily: FontStyles().FontFamily);
    Color labelColor= Color(0xff2e76bc);
    TextStyle textInputStyleCheckAll = TextStyle(
        fontSize: 16.0, color:labelColor,fontFamily: FontStyles().FontFamily);
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
            child: new Text(widget.Title,
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
                        child: new Text('ILG60_B_01_00_26_00',
                          style: TextStyle(color: Colors.grey[400],fontFamily: FontStyles().FontFamily,fontSize: 12.0),),
                      ),
                    ],
                  ),
                  ],
                )*/
            ),
            widget.ItemsProduct.length==0?Container()
                :Container(
              padding: EdgeInsets.only(left: 22.0,right: 22.0,bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Text("เลือกของกลางทั้งหมด",
                      style: textInputStyleCheckAll,),
                    padding: EdgeInsets.all(8.0),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isCheckAll =
                        !isCheckAll;
                        if(isCheckAll){
                          _itemsInit.forEach((item) {
                            item.IsCheckOffence=true;
                          });
                        }else{
                          _itemsInit.forEach((item) {
                            item.IsCheckOffence=false;
                          });
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: isCheckAll
                            ? Color(0xff3b69f3)
                            : Colors.grey[200],
                        border: isCheckAll
                            ?Border.all(color: Color(0xff3b69f3),width: 2)
                            :Border.all(color: Colors.grey[400],width: 2),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: isCheckAll
                              ? Icon(
                            Icons.check,
                            size: 18.0,
                            color: Colors.white,
                          )
                              : Container(
                            height: 18.0,
                            width: 18.0,
                            color: Colors.transparent,
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: new ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: _buildSearchResults(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottom(),
    ),
    );
  }
}