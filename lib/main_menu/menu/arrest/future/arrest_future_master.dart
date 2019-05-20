import 'dart:convert';

import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_lawbreaker.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_main.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_master_response.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/response/item_arrest_response_get_person.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/response/item_arrest_response_get_staff.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/response/item_arrest_response_message.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/response/item_arrest_response_save.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/response/item_arrest_response_ins_staff.dart';
import 'package:prototype_app_pang/server/server.dart' as serv;
import 'package:http/http.dart' as http;

class ArrestFutureMaster{
  ArrestFutureMaster() : super();

  Future<ItemsMasterTitleResponse> apiRequestMasTitlegetByCon(Map jsonMap) async {
    //encode Map to JSON
    var body = json.encode(jsonMap);
    final response = await http.post(
      serv
          .Server()
          .IPAddressMaster + "/MasTitlegetByCon",
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      return ItemsMasterTitleResponse.fromJson(json.decode(response.body));
    } else {
      print('Something went wrong. \nResponse Code : ${response.statusCode}');
    }
  }
  Future<ItemsMasterCountryResponse> apiRequestMasCountrygetByCon(Map jsonMap) async {
    //encode Map to JSON
    var body = json.encode(jsonMap);
    final response = await http.post(
      serv
          .Server()
          .IPAddressMaster + "/MasCountrygetByCon",
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      return ItemsMasterCountryResponse.fromJson(json.decode(response.body));
    } else {
      print('Something went wrong. \nResponse Code : ${response.statusCode}');
    }
  }
  Future<ItemsMasterProvinceResponse> apiRequestMasProvincegetByCon(Map jsonMap) async {
    //encode Map to JSON
    var body = json.encode(jsonMap);
    final response = await http.post(
      serv
          .Server()
          .IPAddressMaster + "/MasProvincegetByCon",
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      return ItemsMasterProvinceResponse.fromJson(json.decode(response.body));
    } else {
      print('Something went wrong. \nResponse Code : ${response.statusCode}');
    }
  }
  Future<ItemsMasterDistictResponse> apiRequestMasDistrictgetByCon(Map jsonMap) async {
    //encode Map to JSON
    var body = json.encode(jsonMap);
    final response = await http.post(
      serv
          .Server()
          .IPAddressMaster + "/MasDistrictgetByCon",
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      return ItemsMasterDistictResponse.fromJson(json.decode(response.body));
    } else {
      print('Something went wrong. \nResponse Code : ${response.statusCode}');
    }
  }
  Future<ItemsMasterSubDistictResponse> apiRequestMasSubDistrictgetByCon(Map jsonMap) async {
    //encode Map to JSON
    var body = json.encode(jsonMap);
    final response = await http.post(
      serv
          .Server()
          .IPAddressMaster + "/MasSubDistrictgetByCon",
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      return ItemsMasterSubDistictResponse.fromJson(json.decode(response.body));
    } else {
      print('Something went wrong. \nResponse Code : ${response.statusCode}');
    }
  }

  Future<ItemsMasterPersonResponse> apiRequestMasPersoninsAll(Map jsonMap) async {
    //encode Map to JSON
    var body = json.encode(jsonMap);
    final response = await http.post(
      serv
          .Server()
          .IPAddressMaster + "/MasPersoninsAll",
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      return ItemsMasterPersonResponse.fromJson(json.decode(response.body));
    } else {
      print('Something went wrong. \nResponse Code : ${response.statusCode}');
    }
  }

  Future<ItemsMasterGetPersonResponse> apiRequestMasPersongetByCon(Map jsonMap) async {
    //encode Map to JSON
    var body = json.encode(jsonMap);
    final response = await http.post(
      serv
          .Server()
          .IPAddressMaster + "/MasPersongetByCon",
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      return ItemsMasterGetPersonResponse.fromJson(json.decode(response.body));
    } else {
      print('Something went wrong. \nResponse Code : ${response.statusCode}');
    }
  }


  //product
  Future<ItemsMasterProductGroupResponse> apiRequestMasProductGroupgetByCon(Map jsonMap) async {
    //encode Map to JSON
    var body = json.encode(jsonMap);
    final response = await http.post(
      serv
          .Server()
          .IPAddressMaster + "/MasProductGroupgetByCon",
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      return ItemsMasterProductGroupResponse.fromJson(json.decode(response.body));
    } else {
      print('Something went wrong. \nResponse Code : ${response.statusCode}');
    }
  }
  Future<ItemsMasterProductCategoryResponse> apiRequestMasProductCategorygetByCon(Map jsonMap) async {
    //encode Map to JSON
    var body = json.encode(jsonMap);
    final response = await http.post(
      serv
          .Server()
          .IPAddressMaster + "/MasProductCategorygetByCon",
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      return ItemsMasterProductCategoryResponse.fromJson(json.decode(response.body));
    } else {
      print('Something went wrong. \nResponse Code : ${response.statusCode}');
    }
  }
  Future<ItemsMasterProductTypeResponse> apiRequestMasProductTypegetByCon(Map jsonMap) async {
    //encode Map to JSON
    var body = json.encode(jsonMap);
    final response = await http.post(
      serv
          .Server()
          .IPAddressMaster + "/MasProductTypegetByCon",
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      return ItemsMasterProductTypeResponse.fromJson(json.decode(response.body));
    } else {
      print('Something went wrong. \nResponse Code : ${response.statusCode}');
    }
  }
  Future<ItemsMasterProductSubTypeResponse> apiRequestMasProductSubTypegetByCon(Map jsonMap) async {
    //encode Map to JSON
    var body = json.encode(jsonMap);
    final response = await http.post(
      serv
          .Server()
          .IPAddressMaster + "/MasProductSubTypegetByCon",
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      return ItemsMasterProductSubTypeResponse.fromJson(json.decode(response.body));
    } else {
      print('Something went wrong. \nResponse Code : ${response.statusCode}');
    }
  }
  Future<ItemsMasterProductSubSetTypeResponse> apiRequestMasProductSubSetTypegetByCon(Map jsonMap) async {
    //encode Map to JSON
    var body = json.encode(jsonMap);
    final response = await http.post(
      serv
          .Server()
          .IPAddressMaster + "/MasProductSubSetTypegetByCon",
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      return ItemsMasterProductSubSetTypeResponse.fromJson(json.decode(response.body));
    } else {
      print('Something went wrong. \nResponse Code : ${response.statusCode}');
    }
  }
  Future<ItemsMasterProductMappingResponse> apiRequestMasProductMappinggetByConAdv(Map jsonMap) async {
    //encode Map to JSON
    var body = json.encode(jsonMap);
    final response = await http.post(
      serv
          .Server()
          .IPAddressMaster + "/MasProductMappinggetByConAdv",
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      return ItemsMasterProductMappingResponse.fromJson(json.decode(response.body));
    } else {
      print('Something went wrong. \nResponse Code : ${response.statusCode}');
    }
  }
}