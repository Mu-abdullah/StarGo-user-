import '../helper/shared_preferences.dart';

class Constant {
  static String homeScreenItemBlobId = '14-7-758669';

  static String pizzaCategory = 'pizza';
  static String cripeCategory = 'cripe';
  static String pastaCategory = 'pasta';
  static String sweetPanCakeCategory = 'sweetPanCake';
  static String saltyPanCakeCategory = 'saltyPanCake';
  static String zalapiaCategory = 'zalapia';

  static String orderBox = 'OrderBox';

  static String onBoardTitle1 = 'عروض متواصلة';
  static String onBoardTitle2 = 'تواصل معنا';
  static String onBoardTitle3 = 'خدمة التوصيل';
  static String onBoardSubTitle1 = 'عروض علي جميع منتجاتنا';
  static String onBoardSubTitle2 = 'خدمة عملاء تتواصل معك لافضل خدمة';
  static String onBoardSubTitle3 = 'توصيل الطلبات إليك في اسرع وقت';

  static String extentionsKey = 'extentions';

  static String productKey = 'products';
  static String orderKey = 'orders';
}

String cashHelperOnBoardingKey = "onBoarding";
bool? cashHelperOnBoardingValue =
    CacheHelper.getData(key: cashHelperOnBoardingKey);
