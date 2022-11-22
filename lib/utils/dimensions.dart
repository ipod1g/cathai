import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

//dynamic height padding and margin
  static double pageView = screenHeight / 5.1;
  static double pageViewContainer =
      screenHeight / 6.5; //3.84 is a scaling factor
  static double pageViewTextContainer = screenHeight / 9.00;

  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height40 = screenHeight / 24.13;

  static double font20 = screenHeight / 40.2;
  static double font24 = screenHeight / 33.2;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

//dynamic width padding and margin
  static double pageViewWidth = screenWidth / 1.3;
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;

// icon Size
  static double iconSize30 = screenHeight / 28.13;
  static double iconSize20 = screenHeight / 35.13;

// list view size
  static double listViewImgSize = screenHeight / 3.25;
  static double listViewImgContentSize = screenHeight / 3.9;

// details
  static double detailsBgSize = screenHeight / 2.41;
}
