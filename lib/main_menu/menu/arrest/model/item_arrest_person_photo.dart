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

class ItemsListArrestPhotoPerson {
  int PHOTO_ID;
  int PERSON_ID;
  int PERSON_RELATIONSHIP_ID;
  String PHOTO;
  int TYPE;
  int IS_ACTIVE;

  ItemsListArrestPhotoPerson({
    this.PHOTO_ID,
    this.PERSON_ID,
    this.PERSON_RELATIONSHIP_ID,
    this.PHOTO,
    this.TYPE,
    this.IS_ACTIVE,});

  factory ItemsListArrestPhotoPerson.fromJson(Map<String, dynamic> js) {
    return ItemsListArrestPhotoPerson(
        PHOTO_ID: js['PHOTO_ID'],
        PERSON_ID: js['PERSON_ID'],
        PERSON_RELATIONSHIP_ID: js['PERSON_RELATIONSHIP_ID'],
        PHOTO: js['PHOTO'],
        TYPE: js['TYPE'],
        IS_ACTIVE: js['IS_ACTIVE'],
    );
  }
}