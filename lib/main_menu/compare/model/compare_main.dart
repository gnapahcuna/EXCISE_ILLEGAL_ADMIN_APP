import 'package:prototype_app_pang/main_menu/compare/model/compare_staff.dart';
import 'package:prototype_app_pang/main_menu/compare/model/compare_detail.dart';
import 'package:prototype_app_pang/main_menu/compare/model/compare_detail_fine.dart';
import 'package:prototype_app_pang/main_menu/compare/model/compare_detail_payment.dart';
import 'package:prototype_app_pang/main_menu/compare/model/compare_mapping.dart';

class ItemsCompareMain {
  final int COMPARE_ID;
  final int LAWSUIT_ID;
  final int OFFICE_ID;
  final double TREASURY_RATE;
  final double BRIBE_RATE;
  final double REWARD_RATE;
  final String OFFICE_CODE;
  final String OFFICE_NAME;
  final String COMPARE_NO;
  final String COMPARE_NO_YEAR;
  final String COMPARE_DATE;
  final int IS_OUTSIDE;
  final int IS_ACTIVE;
  final List<ItemsCompareMapping> CompareMapping;
  final List<ItemsCompareDetail> CompareDetail;
  final List<ItemsCompareDetailPayment> CompareDetailPayment;
  final List<ItemsCompareDetailFine> CompareDetailFine;
  final List<ItemsListCompareStaff> CompareStaff;

  ItemsCompareMain({
    this.COMPARE_ID,
    this.LAWSUIT_ID,
    this.OFFICE_ID,
    this.TREASURY_RATE,
    this.BRIBE_RATE,
    this.REWARD_RATE,
    this.OFFICE_CODE,
    this.OFFICE_NAME,
    this.COMPARE_NO,
    this.COMPARE_NO_YEAR,
    this.COMPARE_DATE,
    this.IS_OUTSIDE,
    this.IS_ACTIVE,
    this.CompareMapping,
    this.CompareDetail,
    this.CompareDetailPayment,
    this.CompareDetailFine,
    this.CompareStaff,});

  factory ItemsCompareMain.fromJson(Map<String, dynamic> json) {
    return ItemsCompareMain(
      COMPARE_ID: json['COMPARE_ID'],
      LAWSUIT_ID: json['LAWSUIT_ID'],
      OFFICE_ID: json['OFFICE_ID'],
      TREASURY_RATE: json['TREASURY_RATE'],
      BRIBE_RATE: json['BRIBE_RATE'],
      REWARD_RATE: json['REWARD_RATE'],
      OFFICE_CODE: json['OFFICE_CODE'],
      OFFICE_NAME: json['OFFICE_NAME'],
      COMPARE_NO: json['COMPARE_NO'],
      COMPARE_NO_YEAR: json['COMPARE_NO_YEAR'],
      COMPARE_DATE: json['COMPARE_DATE'],
      IS_OUTSIDE: json['IS_OUTSIDE'],
      IS_ACTIVE: json['IS_ACTIVE'],
      CompareMapping: List.from(json['CompareMapping'].map((m) => ItemsCompareMapping.fromJson(m))),
      CompareDetail: List.from(json['CompareDetail'].map((m) => ItemsCompareDetail.fromJson(m))),
      CompareDetailPayment: List.from(json['CompareDetailPayment'].map((m) => ItemsCompareDetailPayment.fromJson(m))),
      CompareDetailFine: List.from(json['CompareDetailFine'].map((m) => ItemsCompareDetailFine.fromJson(m))),
      CompareStaff: List.from(json['CompareStaff'].map((m) => ItemsListCompareStaff.fromJson(m))),
    );
  }
}