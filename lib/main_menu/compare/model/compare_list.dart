class ItemsCompareList {
  int COMPARE_ID;
  int LAWSUIT_ID;
  int INDICTMENT_ID;
  String COMPARE_NO;
  String COMPARE_NO_YEAR;
  int LAWSUIT_NO;
  String LAWSUIT_NO_YEAR;

  ItemsCompareList({
    this.COMPARE_ID,
    this.LAWSUIT_ID,
    this.INDICTMENT_ID,
    this.COMPARE_NO,
    this.COMPARE_NO_YEAR,
    this.LAWSUIT_NO,
    this.LAWSUIT_NO_YEAR,
  });

  factory ItemsCompareList.fromJson(Map<String, dynamic> json) {
    return ItemsCompareList(
      COMPARE_ID: json['COMPARE_ID'],
      LAWSUIT_ID: json['LAWSUIT_ID'],
      INDICTMENT_ID: json['INDICTMENT_ID'],
      COMPARE_NO: json['COMPARE_NO'],
      COMPARE_NO_YEAR: json['COMPARE_NO_YEAR'],
      LAWSUIT_NO: json['LAWSUIT_NO'],
      LAWSUIT_NO_YEAR: json['LAWSUIT_NO_YEAR'],
    );
  }
}