/*
class ItemsListArrestLawbreaker{
  final String NOTICE_CODE;
  final String TITLE_SHORT_NAME_TH;
  final String FIRST_NAME;
  final String MIDDLE_NAME;
  final String LAST_NAME;
  final String OTHER_NAME;
  final int MISTREAT_NO;

  ItemsListArrestLawbreaker({
    this.NOTICE_CODE,
    this.TITLE_SHORT_NAME_TH,
    this.FIRST_NAME,
    this.MIDDLE_NAME,
    this.LAST_NAME,
    this.OTHER_NAME,
    this.MISTREAT_NO,
  });

  factory ItemsListArrestLawbreaker.fromJson(Map<String, dynamic> js) {
    return ItemsListArrestLawbreaker(
      NOTICE_CODE: js['NOTICE_CODE'],
      TITLE_SHORT_NAME_TH: js['TITLE_SHORT_NAME_TH'],
      FIRST_NAME: js['FIRST_NAME'],
      MIDDLE_NAME: js['MIDDLE_NAME'],
      LAST_NAME: js['LAST_NAME'],
      OTHER_NAME: js['OTHER_NAME'],
      MISTREAT_NO: js['MISTREAT_NO'],
    );
  }
}*/

import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_person_relationship.dart';
import 'dart:convert';

class ItemsListArrestLawbreaker {
  int LAWBREAKER_ID;
  int ARREST_ID;
  int PERSON_ID;
  int PERSON_TYPE;
  int ENTITY_TYPE;
  String ID_CARD;
  String PASSPORT_NO;
  String COMPANY_REGISTRATION_NO;
  String TITLE_NAME_TH;
  String TITLE_NAME_EN;
  String TITLE_SHORT_NAME_TH;
  String TITLE_SHORT_NAME_EN;
  String FIRST_NAME;
  String MIDDLE_NAME;
  String LAST_NAME;
  String OTHER_NAME;
  int MISTREAT_NO;
  int AGE;
  List<ItemsListArrestPersonRelationShip> MAS_PERSON_RELATIONSHIP;
  bool IsCheck;
  bool IsCheckOffence;
  int INDEX;

  ItemsListArrestLawbreaker({
    this.LAWBREAKER_ID,
    this.ARREST_ID,
    this.PERSON_ID,
    this.PERSON_TYPE,
    this.ENTITY_TYPE,
    this.ID_CARD,
    this.PASSPORT_NO,
    this.COMPANY_REGISTRATION_NO,
    this.TITLE_NAME_TH,
    this.TITLE_NAME_EN,
    this.TITLE_SHORT_NAME_TH,
    this.TITLE_SHORT_NAME_EN,
    this.FIRST_NAME,
    this.MIDDLE_NAME,
    this.LAST_NAME,
    this.OTHER_NAME,
    this.MISTREAT_NO,
    this.AGE,
    this.MAS_PERSON_RELATIONSHIP,
    this.IsCheck,
    this.IsCheckOffence,
    this.INDEX,
  });

  factory ItemsListArrestLawbreaker.fromJson(Map<String, dynamic> js) {
    return ItemsListArrestLawbreaker(
        LAWBREAKER_ID: js['LAWBREAKER_ID'],
        ARREST_ID: js['ARREST_ID'],
        PERSON_ID: js['PERSON_ID'],
        PERSON_TYPE: js['PERSON_TYPE'],
        ENTITY_TYPE: js['ENTITY_TYPE'],
        ID_CARD: js['ID_CARD'],
        PASSPORT_NO: js['PASSPORT_NO'],
        COMPANY_REGISTRATION_NO: js['COMPANY_REGISTRATION_NO'],
        TITLE_NAME_TH: js['TITLE_NAME_TH'],
        TITLE_NAME_EN: js['TITLE_NAME_EN'],
        TITLE_SHORT_NAME_TH: js['TITLE_SHORT_NAME_TH'],
        TITLE_SHORT_NAME_EN: js['TITLE_SHORT_NAME_EN'],
        FIRST_NAME: js['FIRST_NAME'],
        MIDDLE_NAME: js['MIDDLE_NAME'],
        LAST_NAME: js['LAST_NAME'],
        OTHER_NAME: js['OTHER_NAME'],
        MISTREAT_NO: js['MISTREAT_NO'],
        AGE: js['AGE'],
        //MAS_PERSON_RELATIONSHIP:List<ItemsListArrestPersonRelationShip>.from(js['MAS_PERSON_RELATIONSHIP'].map((m) => ItemsListArrestPersonRelationShip.fromJson(m))),
        IsCheck: false,
        IsCheckOffence: false,
        INDEX: null,
    );
  }
}