class ItemsListLawsuitStaff {
  final int STAFF_ID;
  final String STAFF_CODE;
  final int STAFF_REF_ID;
  final String ID_CARD;
  final String TITLE_NAME_TH;
  final String TITLE_SHORT_NAME_TH;
  final String FIRST_NAME;
  final String LAST_NAME;
  final String OPREATION_POS_NAME;
  final String OPREATION_POS_LAVEL_NAME;
  final String OPERATION_OFFICE_NAME;
  int CONTRIBUTOR_ID;
  bool IsCheck;
  String ArrestType;
  List<String> ArrestTypeItems;

  ItemsListLawsuitStaff({
    this.STAFF_ID,
    this.STAFF_CODE,
    this.STAFF_REF_ID,
    this.ID_CARD,
    this.TITLE_NAME_TH,
    this.TITLE_SHORT_NAME_TH,
    this.FIRST_NAME,
    this.LAST_NAME,
    this.OPREATION_POS_NAME,
    this.OPREATION_POS_LAVEL_NAME,
    this.OPERATION_OFFICE_NAME,
    this.CONTRIBUTOR_ID,
    this.IsCheck,
    this.ArrestType,
    this.ArrestTypeItems,
  });

  factory ItemsListLawsuitStaff.fromJson(Map<String, dynamic> js) {
    return ItemsListLawsuitStaff(
        STAFF_ID: js['STAFF_ID'],
        STAFF_CODE: js['STAFF_CODE'],
        STAFF_REF_ID: js['STAFF_REF_ID'],
        ID_CARD: js['ID_CARD'],
        TITLE_NAME_TH: js['TITLE_NAME_TH'],
        TITLE_SHORT_NAME_TH: js['TITLE_SHORT_NAME_TH'],
        FIRST_NAME: js['FIRST_NAME'],
        LAST_NAME: js['LAST_NAME'],
        OPREATION_POS_NAME: js['OPREATION_POS_NAME'],
        OPREATION_POS_LAVEL_NAME: js['MANAGEMENT_POS_LEVEL_NAME'],
        OPERATION_OFFICE_NAME: js['OPERATION_OFFICE_NAME'],
        CONTRIBUTOR_ID: js['CONTRIBUTOR_ID'],
        IsCheck: false,
        ArrestType: js['CONTRIBUTOR_ID'] == 14 ? "ผู้จับกุม" : "ผู้ร่วมจับกุม",
        ArrestTypeItems: ["ผู้จับกุม", "ผู้ร่วมจับกุม"]
    );
  }
}