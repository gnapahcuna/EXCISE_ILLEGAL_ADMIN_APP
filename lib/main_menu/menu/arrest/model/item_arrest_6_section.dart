import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_5.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_6_suspect.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_lawbreaker.dart';

class ItemsListArrest6Section {
  /*int GUILTBASE_ID;
  String GUILTBASE_NAME;
  String FINE;
  int IS_PROVE;
  int IS_COMPARE;
  String SUBSECTION_NAME;
  String SUBSECTION_DESC;
  String SECTION_NAME;
  String PENALTY_DESC;
  List ItemLawsuitBreaker;
  List ItemProduct;

  ItemsListArrest6Section({
    this.GUILTBASE_ID,
    this.GUILTBASE_NAME,
    this.FINE,
    this.IS_PROVE,
    this.IS_COMPARE,
    this.SUBSECTION_NAME,
    this.SUBSECTION_DESC,
    this.SECTION_NAME,
    this.PENALTY_DESC,
    this.ItemLawsuitBreaker,
    this.ItemProduct
  });
*/
  int INDICTMENT_ID;
  int GUILTBASE_ID;
  String GUILTBASE_NAME;
  String FINE;
  int IS_PROVE;
  int IS_COMPARE;
  String SUBSECTION_NAME;
  String SUBSECTION_DESC;
  String SECTION_NAME;
  String PENALTY_DESC;
  List ArrestIndictmentProduct;
  List ArrestIndictmentDetail;

  ItemsListArrest6Section({
    this.INDICTMENT_ID,
    this.GUILTBASE_ID,
    this.GUILTBASE_NAME,
    this.FINE,
    this.IS_PROVE,
    this.IS_COMPARE,
    this.SUBSECTION_NAME,
    this.SUBSECTION_DESC,
    this.SECTION_NAME,
    this.PENALTY_DESC,
    this.ArrestIndictmentDetail,
    this.ArrestIndictmentProduct,
  });

  factory ItemsListArrest6Section.fromJson(Map<String, dynamic> json) {
    return ItemsListArrest6Section(
        INDICTMENT_ID: json['INDICTMENT_ID'],
        GUILTBASE_ID: json['GUILTBASE_ID'],
        GUILTBASE_NAME: json['GUILTBASE_NAME'],
        FINE: json['FINE'],
        IS_PROVE: json['IS_PROVE'],
        IS_COMPARE: json['IS_COMPARE'],
        SUBSECTION_NAME: json['SUBSECTION_NAME'],
        SUBSECTION_DESC: json['SUBSECTION_DESC'],
        SECTION_NAME: json['SECTION_NAME'],
        PENALTY_DESC: json['PENALTY_DESC'],
        ArrestIndictmentDetail: null,
        ArrestIndictmentProduct: null
    );
  }
}