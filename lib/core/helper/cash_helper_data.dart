import 'package:user/core/helper/shared_preferences.dart';

class CashHelperData {
  static const String cashHelperNameKey = "name";
  String? cashHelperNameValue = CacheHelper.getData(key: cashHelperNameKey);

 static const String cashHelperPhoneKey = "phone";
  String? cashHelperPhoneValue = CacheHelper.getData(key: cashHelperPhoneKey);

 static const String cashHelperAdressKey = "adress";
  String? cashHelperAdressValue = CacheHelper.getData(key: cashHelperAdressKey);
}
