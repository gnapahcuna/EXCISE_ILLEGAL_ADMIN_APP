import 'package:prototype_app_pang/main_menu/lawsuit/proof_case/accept_case/model/item_lawsuit_staff.dart';
import 'package:prototype_app_pang/main_menu/arrest/model/item_arrest_person.dart';

class ItemsArrestResponseMessage {
  final String IsSuccess;
  final String Msg;

  ItemsArrestResponseMessage({
    this.IsSuccess,
    this.Msg,
  });

  factory ItemsArrestResponseMessage.fromJson(Map<String, dynamic> json) {
    return ItemsArrestResponseMessage(
      IsSuccess: json['IsSuccess'],
      Msg: json['Msg'],
    );
  }
}
