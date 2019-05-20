
import 'package:flutter/cupertino.dart';

class ItemsListArrest5Controller {
  TextEditingController editSizeUnit;
  TextEditingController editProductUnit;
  TextEditingController editVolumeUnit;
  FocusNode myFocusNodeSizeUnit;
  FocusNode myFocusNodeProductUnit;
  FocusNode myFocusNodeVolumeUnit;
  List<String> dropdownItemsSizeUnit;
  List<String> dropdownItemsProductUnit;
  List<String> dropdownItemsVolumeUnit;
  String dropdownValueSizeUnit;
  String dropdownValueProductUnit;
  String dropdownValueVolumeUnit;
  ItemsListArrest5Controller(
      this.editSizeUnit,
      this.editProductUnit,
      this.editVolumeUnit,
      this.myFocusNodeSizeUnit,
      this.myFocusNodeProductUnit,
      this.myFocusNodeVolumeUnit,
      this.dropdownItemsSizeUnit,
      this.dropdownItemsProductUnit,
      this.dropdownItemsVolumeUnit,
      this.dropdownValueSizeUnit,
      this.dropdownValueProductUnit,
      this.dropdownValueVolumeUnit,
      );
}