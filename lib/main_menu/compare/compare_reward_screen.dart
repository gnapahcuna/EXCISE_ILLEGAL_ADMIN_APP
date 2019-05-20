import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype_app_pang/font_family/font_style.dart';
import 'package:prototype_app_pang/model/test/compare_case_information.dart';

class CompareRewardScreenFragment extends StatefulWidget {
  ItemsCompareCaseInformation itemsInformations;
  CompareRewardScreenFragment({
    Key key,
    @required this.itemsInformations,
  }) : super(key: key);
  @override
  _FragmentState createState() => new _FragmentState();
}
class _FragmentState extends State<CompareRewardScreenFragment>  with TickerProviderStateMixin {

  ItemsCompareCaseInformation itemMain;


  TextStyle textStyleLabel = TextStyle(
      fontSize: 16, color: Color(0xff087de1));
  TextStyle textStyleData = TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.w500,fontFamily: FontStyles().FontFamily);

  TextStyle textStyleBill = TextStyle(color: Colors.black,fontFamily: FontStyles().FontFamily);
  TextStyle textStyleButtonAccept = TextStyle(fontSize: 16,color: Colors.white,fontFamily: FontStyles().FontFamily);
  EdgeInsets paddingData = EdgeInsets.only(top: 4.0, bottom: 4.0);
  EdgeInsets paddingLabel = EdgeInsets.only(top: 4.0, bottom: 4.0);

  TextStyle textStyleDataSub = TextStyle(fontSize: 16,color: Colors.black,fontFamily: FontStyles().FontFamily);
  TextStyle textStyleDetailLabel = TextStyle(fontSize: 14,color: Color(0xff087de1),fontFamily: FontStyles().FontFamily);
  TextStyle textStyleDetailData = TextStyle(fontSize: 14,color: Colors.black,fontFamily: FontStyles().FontFamily);
  TextStyle textStylePageName = TextStyle(color: Colors.grey[400],fontFamily: FontStyles().FontFamily,fontSize: 12.0);
  TextStyle styleTextAppbar = TextStyle(fontSize: 18.0,fontFamily: FontStyles().FontFamily);

  @override
  void initState() {
    super.initState();
    itemMain=widget.itemsInformations;
  }

  @override
  void dispose() {
    super.dispose();
  }


  Widget _buildContent(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 4.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 4.0),
                width: size.width,
                child: Container(
                    padding: EdgeInsets.all(22.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.grey[300], width: 1.0),
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: paddingLabel,
                          child: Text(
                            "เงินสินบน-รางวัล",
                            style: textStyleLabel,),
                        ),
                        Container(
                          padding: paddingLabel,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    padding: paddingLabel,
                                    child: Text(
                                      "เงินสินบน-รางวัล",
                                      style: textStyleDetailLabel,),
                                  ),
                                  Container(
                                    padding: paddingData,
                                    child: Text(
                                      "60,000",
                                      style: textStyleDetailData,),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    padding: paddingLabel,
                                    child: Text(
                                      "สินบน",
                                      style: textStyleDetailLabel,),
                                  ),
                                  Container(
                                    padding: paddingData,
                                    child: Text(
                                      "60,000",
                                      style: textStyleDetailData,),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    padding: paddingLabel,
                                    child: Text(
                                      "รางวัล",
                                      style: textStyleDetailLabel,),
                                  ),
                                  Container(
                                    padding: paddingData,
                                    child: Text(
                                      "120,000",
                                      style: textStyleDetailData,),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                ),
              ),
              Container(
                width: size.width,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: itemMain.Suspects.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildExpandableContent(index);
                  },
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget _buildExpandableContent(int index) {
    Widget _buildExpanded(index) {
      return Container(
        //padding: EdgeInsets.only(top: 1.0, bottom: 1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border(
                        //top: BorderSide(color: Colors.grey[300], width: 1.0),
                        bottom: BorderSide(
                            color: Colors.grey[300], width: 1.0),
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: paddingData,
                        child: Text(
                          itemMain.Suspects[index].SuspectName,
                          style: textStyleData,),
                      ),
                      Container(
                        padding: paddingLabel,
                        child: Text(
                          'ค่าปรับ : '+itemMain.Suspects[index].FineValue.toString(),
                          style: textStyleDataSub,),
                      ),
                      Container(
                        padding: paddingLabel,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: paddingLabel,
                              child: Text('สุรา',
                                style: textStyleDetailLabel,),
                            ),
                            Container(
                              padding: paddingLabel,
                              child: Text(
                                "สินบน",
                                style: textStyleDetailLabel,),
                            ),
                            Container(
                              padding: paddingData,
                              child: Text(
                                "รางวัล",
                                style: textStyleDetailLabel,),
                            ),
                            Container(
                              padding: paddingData,
                              child: Text(
                                "ส่งคลีง",
                                style: textStyleDetailLabel,),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: paddingLabel,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: itemMain.Evidenses.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  padding: paddingData,
                                  child: Text(
                                    itemMain.Evidenses[index].MainBrand,
                                    style: textStyleDetailData,),
                                ),
                                Container(
                                  padding: paddingData,
                                  child: Text(
                                    "60,000",
                                    style: textStyleDetailData,),
                                ),
                                Container(
                                  padding: paddingData,
                                  child: Text(
                                    "60,000",
                                    style: textStyleDetailData,),
                                ),
                                Container(
                                  padding: paddingData,
                                  child: Text(
                                    "120,000",
                                    style: textStyleDetailData,),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: paddingLabel,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: paddingLabel,
                              child: Text('รวม',
                                style: textStyleDetailLabel,),
                            ),
                            Container(
                              padding: paddingData,
                              child: Text(
                                "60,000",
                                style: textStyleDetailData,),
                            ),
                            Container(
                              padding: paddingData,
                              child: Text(
                                "60,000",
                                style: textStyleDetailData,),
                            ),
                            Container(
                              padding: paddingData,
                              child: Text(
                                "120,000",
                                style: textStyleDetailData,),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ],
          )
      );
    }
    Widget _buildCollapsed(int index) {
      return Container(
        //padding: EdgeInsets.only(top: 1.0, bottom: 1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border(
                        //top: BorderSide(color: Colors.grey[300], width: 1.0),
                        bottom: BorderSide(
                            color: Colors.grey[300], width: 1.0),
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: paddingData,
                        child: Text(
                          itemMain.Suspects[index].SuspectName,
                          style: textStyleData,),
                      ),
                      Container(
                        padding: paddingLabel,
                        child: Text(
                          'ค่าปรับ : '+itemMain.Suspects[index].FineValue.toString(),
                          style: textStyleDataSub,),
                      ),
                      Container(
                        padding: paddingLabel,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  padding: paddingLabel,
                                  child: Text(
                                    "สินบน",
                                    style: textStyleDetailLabel,),
                                ),
                                Container(
                                  padding: paddingData,
                                  child: Text(
                                    "60,000",
                                    style: textStyleDetailData,),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  padding: paddingLabel,
                                  child: Text(
                                    "รางวัล",
                                    style: textStyleDetailLabel,),
                                ),
                                Container(
                                  padding: paddingData,
                                  child: Text(
                                    "60,000",
                                    style: textStyleDetailData,),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  padding: paddingLabel,
                                  child: Text(
                                    "ส่งคลัง",
                                    style: textStyleDetailLabel,),
                                ),
                                Container(
                                  padding: paddingData,
                                  child: Text(
                                    "120,000",
                                    style: textStyleDetailData,),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ],
          )
      );
    }

    return ExpandableNotifier(
      //controller: itemMain.Evidenses[index].EvidenceTaxValues.expController,
      child: Stack(
        children: <Widget>[
          Expandable(
              collapsed: _buildCollapsed(index),
              expanded: _buildExpanded(index)
          ),
          Align(
            alignment: Alignment.topRight,
            child: Builder(

                builder: (context) {
                  var exp = ExpandableController.of(context);
                  return IconButton(
                    icon: Icon(
                      exp.expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 32.0,
                      color: Colors.grey,),
                    onPressed: () {
                      exp.toggle();
                    },
                  );
                }
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () {
        //
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // here the desired height
          child: AppBar(
            title: Text("คำนวณเงินสินบน-รางวัล",
              style: styleTextAppbar,
            ),
            centerTitle: true,
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context,"Back");
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
                      child: new Text(
                        'ILG60_B_04_00_07_00', style: textStylePageName,),
                    )
                  ],
                ),*/
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: _buildContent(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
