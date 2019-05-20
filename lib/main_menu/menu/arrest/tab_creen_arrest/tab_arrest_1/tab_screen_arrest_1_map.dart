import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:prototype_app_pang/font_family/font_style.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/future/arrest_future_master.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_1_locale.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_location.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_distinct.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_master_response.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_province.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_subdistinct.dart';

class TabScreenArrest1Map extends StatefulWidget {
  ItemsListArrestLocation itemsLocale;
  TabScreenArrest1Map({
    Key key,
    @required this.itemsLocale,
  }) : super(key: key);
  @override
  _TabScreenArrest1MapState createState() => new _TabScreenArrest1MapState();
}
class _TabScreenArrest1MapState extends State<TabScreenArrest1Map> {
  TabController tabController;
  bool _value1 = false;
  bool _value2 = false;

  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  GoogleMapController mapController;
  bool isLoading = false;
  String errorMessage;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  LocationData _startLocation;
  LocationData _currentLocation;
  StreamSubscription<LocationData> _locationSubscription;
  Location _locationService = new Location();
  bool _permission = false;
  String error;
  bool currentWidget = true;

  String _placeName = "",
      _addressno = "",
      _province = "",
      _distict = "",
      _sub_distinct = "",
      _alley = "",
      _gps = "",
      _pos = "",
      _country = "",
      _road="";
  String placeAddress = "";


  //textfield
  final FocusNode myFocusNodeArrestRoad = FocusNode();
  final FocusNode myFocusNodeArrestAlley = FocusNode();
  final FocusNode myFocusNodeArrestHouseNumber = FocusNode();

  TextEditingController editArrestRoad = new TextEditingController();
  TextEditingController editArrestAlley = new TextEditingController();
  TextEditingController editArrestHouseNumber = new TextEditingController();


  ItemsMasterProvinceResponse ItemProvince;
  ItemsMasterDistictResponse ItemDistrict;
  ItemsMasterSubDistictResponse ItemSubDistrict;

  ItemsListSubDistict sSubDistrict;
  ItemsListDistict sDistrict;
  ItemsListProvince sProvince;

  ItemsMasterProvinceResponse ItemProvinceMap;
  ItemsMasterDistictResponse ItemDistrictMap;
  ItemsMasterSubDistictResponse ItemSubDistrictMap;

  ItemsListSubDistict sSubDistrictMap;
  ItemsListDistict sDistrictMap;
  ItemsListProvince sProvinceMap;

  ItemsListArrestLocation itemsLocale;

  //Place Style
  TextStyle textStylePlaceName = TextStyle(
      fontSize: 16.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: FontStyles().FontFamily);
  TextStyle textStylePlaceAddress = TextStyle(
      fontSize: 16.0, color: Colors.black, fontFamily: FontStyles().FontFamily);
  TextStyle textInputStyle = TextStyle(
      fontSize: 16.0, color: Colors.black, fontFamily: FontStyles().FontFamily);
  TextStyle textLabelStyle = TextStyle(fontSize: 16.0,
      color: Color(0xff087de1),
      fontFamily: FontStyles().FontFamily);

  //App Bar Style
  TextStyle textStyleAppbar = TextStyle(
      fontSize: 18.0, color: Colors.white, fontFamily: FontStyles().FontFamily);

  //Block Choice Style
  Color backColorChoiceOne = Colors.white;
  Color backColorChoiceTwo = Colors.grey[200];
  TextStyle textStyleSelect = TextStyle(
      fontSize: 16.0, color: Colors.black, fontFamily: FontStyles().FontFamily);
  TextStyle textStyleUnselect = TextStyle(
      fontSize: 16.0,
      color: Colors.black54,
      fontFamily: FontStyles().FontFamily);

  EdgeInsets paddingInputBox = EdgeInsets.only(top: 4.0, bottom: 0.0);
  EdgeInsets paddingLabel = EdgeInsets.only(top: 12.0);

  @override
  void initState() {
    super.initState();
    _value1 = true;
    initPlatformState();

    itemsLocale = widget.itemsLocale;
    if(itemsLocale!=null){
      editArrestRoad.text = itemsLocale.ROAD;
      editArrestAlley.text = itemsLocale.ALLEY;
      editArrestHouseNumber.text = itemsLocale.ADDRESS_NO;
    }
   /* _locationSubscription =
        _locationService.onLocationChanged().listen((LocationData result) {
          setState(() {
            _currentLocation = result;
            getPlaceAddress(result.latitude, result.longitude);


          });
        });
    print('_currentLocation : ' + _startLocation.toString());*/
    _onSelectCountry(1);
  }


  @override
  void dispose() {
    super.dispose();
    myFocusNodeArrestRoad.dispose();
    myFocusNodeArrestAlley.dispose();
    myFocusNodeArrestHouseNumber.dispose();
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  void _setMarker(placeName) {
    final String markerIdVal = placeName;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      //icon: BitmapDescriptor.fromAsset('assets/icons/marker.png',),
      position: LatLng(
          _startLocation.latitude, _startLocation.longitude
      ),
      infoWindow: InfoWindow(title: markerIdVal, /*snippet: '*'*/),
    );

    setState(() {
      markers = <MarkerId, Marker>{};
      markers[markerId] = marker;
    });
  }

  void getPlaceAddress(latitude, longitude) async {
    final coordinates = new Coordinates(latitude, longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        coordinates);

    var place = addresses.first;
    _placeName = place.featureName + " " + place.thoroughfare;

    _addressno = place.subThoroughfare;
    _province = place.adminArea;
    _country = place.countryName;
    _pos = place.postalCode;
    _gps = place.coordinates.latitude.toString() + "," +
        coordinates.longitude.toString();

    placeAddress = place.addressLine;
    _setMarker(place.addressLine);

    if (place.subLocality.contains("เขต")) {
      List splits = place.subLocality.split(" ");
      _distict = splits[1];
    }

    /*print("featureName " + place.featureName);
    print("subLocality " + place.subLocality.toString());
    print("locality " + place.locality.toString());
    print("subAdminArea " + place.subAdminArea.toString());
    print("thoroughfare " + place.thoroughfare.toString());
    print("subThoroughfare " + place.subThoroughfare.toString());
    print("postalCode " + place.postalCode.toString());
    print("adminArea "+place.adminArea);
    print("coordinates "+place.coordinates.latitude.toString()+","+coordinates.longitude.toString());
    print("countryName "+place.countryName);
    print("countryCode "+place.countryCode);
    print("addressLine "+place.addressLine.split(" ").toString());*/
    List addressLine = place.addressLine.split(" ");
    for (int i = 0; i < addressLine.length; i++) {
      if (addressLine[i].toString().endsWith("ซอย")) {
        _alley = addressLine[i + 1];
      } else if (addressLine[i].toString().endsWith("ถนน")) {
        _road = addressLine[i + 1];
      } else if (addressLine[i].toString().endsWith("แขวง")) {
        _sub_distinct = addressLine[i + 1];
      }
    }

    setState(() {});
  }

  /*initPlatformState() async {
    Locations.LocationData location;
    try {
      _permission = await _location.hasPermission();
      location = await _location.getLocation();
      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
        'Permission denied - please ask the user to enable it from the app settings';
      }

      location = null;
    }

    setState(() {
      print("error :" + error);
      _startLocation = location;
      //getPlaceAddress(location.latitude,location.longitude);
    });
  }*/
  initPlatformState() async {
    await _locationService.changeSettings(
        accuracy: LocationAccuracy.HIGH, interval: 1000);

    LocationData location;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      bool serviceStatus = await _locationService.serviceEnabled();
      print("Service status: $serviceStatus");
      if (serviceStatus) {
        _permission = await _locationService.requestPermission();
        print("Permission: $_permission");
        if (_permission) {
          location = await _locationService.getLocation();
          print("Location: ${location.latitude}");
          _locationSubscription = _locationService.onLocationChanged().listen((
              LocationData result) {
            if (mounted) {
              setState(() {
                _currentLocation = result;
                getPlaceAddress(result.latitude, result.longitude);
              });
            }
          });
        }
      } else {
        bool serviceStatusResult = await _locationService.requestService();
        print("Service status activated after request: $serviceStatusResult");
        if (serviceStatusResult) {
          initPlatformState();
        }
      }
    } on PlatformException catch (e) {
      print(e);
      if (e.code == 'PERMISSION_DENIED') {
        error = e.message;
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        error = e.message;
      }
      location = null;
    }

    setState(() {
      _startLocation = location;
    });
  }

  Widget _buildContentGoogleMap(width, height) {
    if (_startLocation != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: width,
            height: height / 1.7,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition:
              CameraPosition(
                target: LatLng(
                    _startLocation.latitude, _startLocation.longitude),
                bearing: 0.0,
                tilt: 30.0,
                zoom: 17.0,
              ),
              markers: Set<Marker>.of(markers.values),
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey[300], width: 1.0),
                )
            ),
            child: Text(_placeName, style: textStylePlaceName,),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey[300], width: 1.0),
                  bottom: BorderSide(color: Colors.grey[300], width: 1.0),
                )
            ),
            child: Text(placeAddress, style: textStylePlaceAddress,),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    //Size Screen
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    //TextField Style

    final _buildChoice = new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  if (!_value1) {
                    _value1 = !_value1;
                    _value2 = !_value2;
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _value1 ? Colors.blue : Colors.white,
                  border: Border.all(color: Colors.black12),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: _value1
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
              child: Text('Google Map',
                style: _value1 ? textStyleSelect : textStyleUnselect,),
            )
          ],
        ),
        Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  if (!_value2) {
                    _value2 = !_value2;
                    _value1 = !_value1;
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _value2 ? Colors.blue : Colors.white,
                  border: Border.all(color: Colors.black12),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: _value2
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
              child: Text('ระบุเอง',
                style: _value2 ? textStyleSelect : textStyleUnselect,),
            )
          ],
        )
      ],
    );
    Widget _buildLine = Container(
      padding: EdgeInsets.only(top: 0.0, bottom: 4.0),
      width: width,
      height: 1.0,
      color: Colors.grey[300],
    );

    var size = MediaQuery
        .of(context)
        .size;
    final _buildContentCustom = new Center(
      child: Container(
        width: size.width,
        color: Colors.white,
        padding: EdgeInsets.only(top: 4.0, bottom: 12.0),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                Card(
                  elevation: 0.0,
                  color: Colors.transparent,
                  child: Container(
                    padding: EdgeInsets.all(22.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          /*Container(
                            padding: paddingLabel,
                            child: Text(
                              "จังหวัด", style: textLabelStyle,),
                          ),
                          Padding(
                            padding: paddingInputBox,
                            child: TextField(
                              focusNode: myFocusNodeArrestProvince,
                              controller: editArrestProvince,
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
                            child: Text(
                              "อำเภอ/เขต", style: textLabelStyle,),
                          ),
                          Padding(
                            padding: paddingInputBox,
                            child: TextField(
                              focusNode: myFocusNodeArrestDistinct,
                              controller: editArrestDistinct,
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
                            child: Text("ตำบล/แขวง", style: textLabelStyle,),
                          ),
                          Padding(
                            padding: paddingInputBox,
                            child: TextField(
                              focusNode: myFocusNodeArrestSubDistinct,
                              controller: editArrestSubDistinct,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
                              style: textInputStyle,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          _buildLine,*/
                          Container(
                            padding: paddingLabel,
                            child: Text("จังหวัด",
                              style: textLabelStyle,),
                          ),
                          Container(
                            width: size.width,
                            //padding: paddingInputBox,
                            child: DropdownButtonHideUnderline(
                              child: ItemProvince != null ? DropdownButton<
                                  ItemsListProvince>(
                                isExpanded: true, //
                                value: sProvince,
                                onChanged: (ItemsListProvince newValue) {
                                  setState(() {
                                    sProvince = newValue;
                                    ItemProvince.RESPONSE_DATA.forEach((f) {
                                      if (f.PROVINCE_NAME_TH.endsWith(
                                          sProvince.PROVINCE_NAME_TH)) {
                                        sDistrict = null;
                                        sSubDistrict = null;
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
                                    child: Text(value.PROVINCE_NAME_TH,
                                      style: textInputStyle,),
                                  );
                                })
                                    .toList(),
                              ) : Container(),
                            ),
                          ),
                          _buildLine,
                          Container(
                            padding: paddingLabel,
                            child: Text("อำเภอ/เขต",
                              style: textLabelStyle,),
                          ),
                          Container(
                            width: size.width,
                            //padding: paddingInputBox,
                            child: DropdownButtonHideUnderline(
                              child: ItemDistrict != null ? DropdownButton<
                                  ItemsListDistict>(
                                isExpanded: true, //
                                value: sDistrict,
                                onChanged: (ItemsListDistict newValue) {
                                  setState(() {
                                    sDistrict = newValue;
                                    ItemDistrict.RESPONSE_DATA.forEach((f) {
                                      if (f.DISTRICT_NAME_TH.endsWith(
                                          sDistrict.DISTRICT_NAME_TH)) {
                                        sSubDistrict = null;
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
                                    child: Text(value.DISTRICT_NAME_TH,
                                      style: textInputStyle,),
                                  );
                                })
                                    .toList(),
                              ) : Container(),
                            ),
                          ),
                          _buildLine,
                          Container(
                            padding: paddingLabel,
                            child: Text("ตำบล/แขวง",
                              style: textLabelStyle,),
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
                                    .map<
                                    DropdownMenuItem<ItemsListSubDistict>>((
                                    ItemsListSubDistict value) {
                                  return DropdownMenuItem<ItemsListSubDistict>(
                                    value: value,
                                    child: Text(value.SUB_DISTRICT_NAME_TH,
                                      style: textInputStyle,),
                                  );
                                })
                                    .toList(),
                              ) : Container(),
                            ),
                          ),
                          _buildLine,
                          Container(
                            padding: paddingLabel,
                            child: Text("ถนน", style: textLabelStyle,),
                          ),
                          Padding(
                            padding: paddingInputBox,
                            child: TextField(
                              focusNode: myFocusNodeArrestRoad,
                              controller: editArrestRoad,
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
                            child: Text("ซอย", style: textLabelStyle,),
                          ),
                          Padding(
                            padding: paddingInputBox,
                            child: TextField(
                              focusNode: myFocusNodeArrestAlley,
                              controller: editArrestAlley,
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
                            child: Text("บ้านเลขที่", style: textLabelStyle,),
                          ),
                          Padding(
                            padding: paddingInputBox,
                            child: TextField(
                              focusNode: myFocusNodeArrestHouseNumber,
                              controller: editArrestHouseNumber,
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.grey[200],
      key: homeScaffoldKey,
      appBar: AppBar(
        title: Text('สถานที่เกิดเหตุ', style: textStyleAppbar,),
        centerTitle: true,
        actions: <Widget>[
          new FlatButton(
              onPressed: () {
                String houseNumber = editArrestHouseNumber.text;
                String road = editArrestRoad.text;
                String alley = editArrestAlley.text;

                if (_value1) {
                  if (_addressno.isEmpty) {
                    ItemProvince.RESPONSE_DATA.forEach((province) {
                      if (_province.trim().endsWith(
                          province.PROVINCE_NAME_TH.trim())) {
                        sProvince = province;
                        _onSelectProvince(sProvince.PROVINCE_ID);
                      }
                    });
                    editArrestRoad.text = _road;
                    editArrestAlley.text = _alley;
                    editArrestHouseNumber.text = _addressno;

                    _showSearchEmptyAlertDialog(
                        context, "กรุณากรอกข้อมูลที่อยู่เพิ่มเติม");
                  }else{
                    ItemProvince.RESPONSE_DATA.forEach((province) {
                      if (_province.trim().endsWith(
                          province.PROVINCE_NAME_TH.trim())) {
                        sProvince = province;
                        _onSelectDataAddress(sProvince.PROVINCE_ID);
                      }
                    });
                    //print(sProvince.PROVINCE_NAME_TH+","+sDistrict.DISTRICT_NAME_TH+","+sSubDistrict.SUB_DISTRICT_NAME_TH);
                    Navigator.pop(context);
                  }
                } else {
                  if (editArrestHouseNumber.text.isEmpty ||
                      sProvince == null || sDistrict == null ||
                      sSubDistrict == null
                  ) {
                    _showSearchEmptyAlertDialog(
                        context, "กรุณากรอกข้อมูลที่อยู่ให้ครบถ้วน");
                  } else {
                    if (_value1) {
                      itemsLocale = new ItemsListArrestLocation(
                         /* _province,
                          _distict,
                          _sub_distinct,*/
                         sProvince,
                          sDistrict,
                          sSubDistrict,
                          _road,
                          _alley,
                          _addressno,
                          _gps,
                          placeAddress
                      );
                    } else {
                      itemsLocale = new ItemsListArrestLocation(
                         /* sProvince.PROVINCE_NAME_TH,
                          sDistrict.DISTRICT_NAME_TH,
                          sSubDistrict.SUB_DISTRICT_NAME_TH,*/
                          sProvince,
                          sDistrict,
                          sSubDistrict,
                          road,
                          alley,
                          houseNumber,
                          null,
                          houseNumber + (alley.isEmpty ? "" : " ซอย " + alley) +
                              (road.isEmpty ? "" : " ถนน " + road)
                              + " อำเภอ/เขต " + sDistrict.DISTRICT_NAME_TH
                              + " ตำบล/แขวง " +
                              sSubDistrict.SUB_DISTRICT_NAME_TH + " จังหวัด " +
                              sProvince.PROVINCE_NAME_TH
                      );
                    }

                    Navigator.pop(context, itemsLocale);
                  }
                }
              },
              child: Text('บันทึก', style: textStyleAppbar)),
        ],
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
         /* Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: new Text('ILG60_B_01_00_04_00',
                    style: TextStyle(color: Colors.grey[400],
                        fontFamily: FontStyles().FontFamily, fontSize: 12.0)),
              ),
            ],
          ),*/
          Container(
            padding: EdgeInsets.all(12.0),
            color: _value1 ? backColorChoiceOne : backColorChoiceTwo,
            child: _buildChoice,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: _value1
                  ? _buildContentGoogleMap(width, height)
                  : _buildContentCustom,

            ),
          )
        ],
      ),
    );
  }

  CupertinoAlertDialog _cupertinoSearchEmpty(mContext, text) {
    TextStyle TitleStyle = TextStyle(
        fontSize: 16.0, fontFamily: FontStyles().FontFamily);
    TextStyle ButtonAcceptStyle = TextStyle(
        color: Colors.blue,
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        fontFamily: FontStyles().FontFamily);
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
                setState(() {
                  _value1 = false;
                  _value2 = true;
                });
              },
              child: new Text('ตกลง', style: ButtonAcceptStyle)),
        ]
    );
  }

  void _showSearchEmptyAlertDialog(context, text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _cupertinoSearchEmpty(context, text);
      },
    );
  }

  void _onSelectCountry(int COUNTRY_ID) async {
    await onLoadActionProvinceMaster(COUNTRY_ID);
  }

  void _onSelectProvince(int PROVINCE_ID) async {
    await onLoadActionDistinctMaster(PROVINCE_ID);
  }

  void _onSelectDistrict(int DISTRICT_ID) async {
    await onLoadActionSubDistinctMaster(DISTRICT_ID);
  }

  void _onSelectDataAddress(int PROVINCE_ID) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: CupertinoActivityIndicator(
            ),
          );
        });
    await onLoadActionLoadDataAddressMaster(PROVINCE_ID);

    print("_addressno : "+_addressno);
    print("_road : "+_road);
    print("_alley : "+_alley.isEmpty.toString());
    itemsLocale = new ItemsListArrestLocation(
        sProvince,
        sDistrict,
        sSubDistrict,
        _road,
        _alley,
        _addressno,
        _gps,
        placeAddress
    );
    Navigator.pop(context,itemsLocale);
  }
  Future<bool> onLoadActionLoadDataAddressMaster(int PROVINCE_ID) async {
    Map map = {
      "TEXT_SEARCH": "",
      "DISTRICT_ID": "",
      "PROVINCE_ID": PROVINCE_ID
    };
    await new ArrestFutureMaster().apiRequestMasDistrictgetByCon(map).then((
        onValue) {
      ItemDistrict = onValue;
      ItemDistrict.RESPONSE_DATA.forEach((district) {
        if (_distict.trim().endsWith(
            district.DISTRICT_NAME_TH.trim())) {
          setState(() {
            sSubDistrict = null;
            sDistrict = district;
            this.onLoadActionSubDistinctMaster(sDistrict.DISTRICT_ID);
          });
        }
      });
      setState(() {});
    });
    Map map_dist = {
      "TEXT_SEARCH": "",
      "SUB_DISTRICT_ID": "",
      "DISTRICT_ID": sDistrict.DISTRICT_ID
    };
    await new ArrestFutureMaster().apiRequestMasSubDistrictgetByCon(map_dist).then((
        onValue) {
      ItemSubDistrict = onValue;
      if (ItemSubDistrict != null) {
        ItemSubDistrict.RESPONSE_DATA.forEach((subdistrict) {
          if (_sub_distinct.trim().endsWith(
              subdistrict.SUB_DISTRICT_NAME_TH.trim())) {
            setState(() {
              sSubDistrict = subdistrict;
            });
          }
        });
      }
    });

    return true;
  }

  Future<bool> onLoadActionProvinceMaster(int COUNTRY_ID) async {
    Map map = {
      "TEXT_SEARCH": "",
      "COUNTRY_ID": COUNTRY_ID
    };
    await new ArrestFutureMaster().apiRequestMasProvincegetByCon(map).then((
        onValue) {
      ItemProvince = onValue;
    });
    setState(() {});
    return true;
  }

  Future<bool> onLoadActionDistinctMaster(int PROVINCE_ID) async {
    Map map = {
      "TEXT_SEARCH": "",
      "DISTRICT_ID": "",
      "PROVINCE_ID": PROVINCE_ID
    };
    await new ArrestFutureMaster().apiRequestMasDistrictgetByCon(map).then((
        onValue) {
      ItemDistrict = onValue;
      ItemDistrict.RESPONSE_DATA.forEach((district) {
        if (_distict.trim().endsWith(
            district.DISTRICT_NAME_TH.trim())) {
          setState(() {
            sSubDistrict = null;
            sDistrict = district;
            this.onLoadActionSubDistinctMaster(sDistrict.DISTRICT_ID);
          });
        }
      });
      setState(() {});
    });
    setState(() {});
    return true;
  }

  Future<bool> onLoadActionSubDistinctMaster(int DISTRICT_ID) async {
    Map map = {
      "TEXT_SEARCH": "",
      "SUB_DISTRICT_ID": "",
      "DISTRICT_ID": DISTRICT_ID
    };
    await new ArrestFutureMaster().apiRequestMasSubDistrictgetByCon(map).then((
        onValue) {
      ItemSubDistrict = onValue;
      if (ItemSubDistrict != null) {
        ItemSubDistrict.RESPONSE_DATA.forEach((subdistrict) {
          if (_sub_distinct.trim().endsWith(
              subdistrict.SUB_DISTRICT_NAME_TH.trim())) {
            setState(() {
              sSubDistrict = subdistrict;
            });
          }
        });
      }
    });
    setState(() {});
    return true;
  }
}