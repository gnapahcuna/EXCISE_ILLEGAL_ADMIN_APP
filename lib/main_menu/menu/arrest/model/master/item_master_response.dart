import 'dart:convert';

import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_lawbreaker.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_product.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_country.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_distinct.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_product_category.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_product_group.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_product_subsettype.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_product_subtype.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_product_type.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_province.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_subdistinct.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/master/item_title.dart';

class ItemsMasterTitleResponse {
  final List<ItemsListTitle> RESPONSE_DATA;
  final bool SUCCESS;

  ItemsMasterTitleResponse({
    this.RESPONSE_DATA,
    this.SUCCESS,
  });

  factory ItemsMasterTitleResponse.fromJson(Map<String, dynamic> js) {
    return ItemsMasterTitleResponse(
      RESPONSE_DATA: List<ItemsListTitle>.from(
          js['RESPONSE_DATA'].map((m) => ItemsListTitle.fromJson(m))),
      SUCCESS: js['SUCCESS'],
    );
  }
}
class ItemsMasterCountryResponse {
  final List<ItemsListCountry> RESPONSE_DATA;
  final bool SUCCESS;

  ItemsMasterCountryResponse({
    this.RESPONSE_DATA,
    this.SUCCESS,
  });

  factory ItemsMasterCountryResponse.fromJson(Map<String, dynamic> js) {
    return ItemsMasterCountryResponse(
      RESPONSE_DATA: List<ItemsListCountry>.from(
          js['RESPONSE_DATA'].map((m) => ItemsListCountry.fromJson(m))),
      SUCCESS: js['SUCCESS'],
    );
  }
}
class ItemsMasterProvinceResponse {
  final List<ItemsListProvince> RESPONSE_DATA;
  final bool SUCCESS;

  ItemsMasterProvinceResponse({
    this.RESPONSE_DATA,
    this.SUCCESS,
  });

  factory ItemsMasterProvinceResponse.fromJson(Map<String, dynamic> json) {
    return ItemsMasterProvinceResponse(
      RESPONSE_DATA: List<ItemsListProvince>.from(
          json['RESPONSE_DATA'].map((m) => ItemsListProvince.fromJson(m))),
      SUCCESS: json['SUCCESS'],
    );
  }
}
class ItemsMasterDistictResponse {
  final List<ItemsListDistict> RESPONSE_DATA;
  final bool SUCCESS;

  ItemsMasterDistictResponse({
    this.RESPONSE_DATA,
    this.SUCCESS,
  });

  factory ItemsMasterDistictResponse.fromJson(Map<String, dynamic> json) {
    return ItemsMasterDistictResponse(
      RESPONSE_DATA: List<ItemsListDistict>.from(
          json['RESPONSE_DATA'].map((m) => ItemsListDistict.fromJson(m))),
      SUCCESS: json['SUCCESS'],
    );
  }
}
class ItemsMasterSubDistictResponse {
  final List<ItemsListSubDistict> RESPONSE_DATA;
  final bool SUCCESS;

  ItemsMasterSubDistictResponse({
    this.RESPONSE_DATA,
    this.SUCCESS,
  });

  factory ItemsMasterSubDistictResponse.fromJson(Map<String, dynamic> json) {
    return ItemsMasterSubDistictResponse(
      RESPONSE_DATA: List<ItemsListSubDistict>.from(
          json['RESPONSE_DATA'].map((m) => ItemsListSubDistict.fromJson(m))),
      SUCCESS: json['SUCCESS'],
    );
  }
}
class ItemsMasterPersonResponse {
  final int RESPONSE_DATA;
  final bool SUCCESS;

  ItemsMasterPersonResponse({
    this.RESPONSE_DATA,
    this.SUCCESS,
  });

  factory ItemsMasterPersonResponse.fromJson(Map<String, dynamic> json) {
    return ItemsMasterPersonResponse(
      RESPONSE_DATA: json['RESPONSE_DATA'],
      SUCCESS: json['SUCCESS'],
    );
  }
}

class ItemsMasterGetPersonResponse {
  final List<ItemsListArrestLawbreaker>  RESPONSE_DATA;
  final bool SUCCESS;

  ItemsMasterGetPersonResponse({
    this.RESPONSE_DATA,
    this.SUCCESS,
  });

  factory ItemsMasterGetPersonResponse.fromJson(Map<String, dynamic> json) {
    return ItemsMasterGetPersonResponse(
      RESPONSE_DATA: List<ItemsListArrestLawbreaker>.from(json['RESPONSE_DATA'].map((m) => ItemsListArrestLawbreaker.fromJson(m))),
      SUCCESS: json['SUCCESS'],
    );
  }
}


//product
class ItemsMasterProductGroupResponse {
  final List<ItemsListProductGroup> RESPONSE_DATA;
  final bool SUCCESS;

  ItemsMasterProductGroupResponse({
    this.RESPONSE_DATA,
    this.SUCCESS,
  });

  factory ItemsMasterProductGroupResponse.fromJson(Map<String, dynamic> json) {
    return ItemsMasterProductGroupResponse(
      RESPONSE_DATA: List<ItemsListProductGroup>.from(
          json['RESPONSE_DATA'].map((m) => ItemsListProductGroup.fromJson(m))),
      SUCCESS: json['SUCCESS'],
    );
  }
}
class ItemsMasterProductCategoryResponse {
  final List<ItemsListProductCategory> RESPONSE_DATA;
  final bool SUCCESS;

  ItemsMasterProductCategoryResponse({
    this.RESPONSE_DATA,
    this.SUCCESS,
  });

  factory ItemsMasterProductCategoryResponse.fromJson(Map<String, dynamic> json) {
    return ItemsMasterProductCategoryResponse(
      RESPONSE_DATA: List<ItemsListProductCategory>.from(
          json['RESPONSE_DATA'].map((m) => ItemsListProductCategory.fromJson(m))),
      SUCCESS: json['SUCCESS'],
    );
  }
}
class ItemsMasterProductTypeResponse {
  final List<ItemsListProductType> RESPONSE_DATA;
  final bool SUCCESS;

  ItemsMasterProductTypeResponse({
    this.RESPONSE_DATA,
    this.SUCCESS,
  });

  factory ItemsMasterProductTypeResponse.fromJson(Map<String, dynamic> json) {
    return ItemsMasterProductTypeResponse(
      RESPONSE_DATA: List<ItemsListProductType>.from(
          json['RESPONSE_DATA'].map((m) => ItemsListProductType.fromJson(m))),
      SUCCESS: json['SUCCESS'],
    );
  }
}
class ItemsMasterProductSubTypeResponse {
  final List<ItemsListProductSubType> RESPONSE_DATA;
  final bool SUCCESS;

  ItemsMasterProductSubTypeResponse({
    this.RESPONSE_DATA,
    this.SUCCESS,
  });

  factory ItemsMasterProductSubTypeResponse.fromJson(Map<String, dynamic> json) {
    return ItemsMasterProductSubTypeResponse(
      RESPONSE_DATA: List<ItemsListProductSubType>.from(
          json['RESPONSE_DATA'].map((m) => ItemsListProductSubType.fromJson(m))),
      SUCCESS: json['SUCCESS'],
    );
  }
}
class ItemsMasterProductSubSetTypeResponse {
  final List<ItemsListProductSubSetType> RESPONSE_DATA;
  final bool SUCCESS;

  ItemsMasterProductSubSetTypeResponse({
    this.RESPONSE_DATA,
    this.SUCCESS,
  });

  factory ItemsMasterProductSubSetTypeResponse.fromJson(Map<String, dynamic> json) {
    return ItemsMasterProductSubSetTypeResponse(
      RESPONSE_DATA: List<ItemsListProductSubSetType>.from(
          json['RESPONSE_DATA'].map((m) => ItemsListProductSubSetType.fromJson(m))),
      SUCCESS: json['SUCCESS'],
    );
  }
}

class ItemsMasterProductMappingResponse {
  final List RESPONSE_DATA;
  final bool SUCCESS;

  ItemsMasterProductMappingResponse({
    this.RESPONSE_DATA,
    this.SUCCESS,
  });

  factory ItemsMasterProductMappingResponse.fromJson(Map<String, dynamic> json) {
    return ItemsMasterProductMappingResponse(
      RESPONSE_DATA: List.from(
          json['RESPONSE_DATA'].map((m) => ItemsListArrestProduct.fromJson(m))),
      SUCCESS: json['SUCCESS'],
    );
  }
}

