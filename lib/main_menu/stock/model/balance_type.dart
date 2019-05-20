import 'package:prototype_app_pang/main_menu/destroy/model/destroy_evidence.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_6_suspect.dart';
import 'package:prototype_app_pang/main_menu/stock/model/balance_detail.dart';

class ItemsStockBalanceType{
  String Name;
  List<ItemsStockBalanceDetail> BalanceDetails;
  int Type;
  ItemsStockBalanceType(
      this.Name,
      this.BalanceDetails,
      this.Type,);
}