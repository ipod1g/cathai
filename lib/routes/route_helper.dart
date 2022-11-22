import 'package:cathay_hackathon_22/pages/home/main_home_page.dart';
import 'package:cathay_hackathon_22/pages/profile/profile_page.dart';
import 'package:cathay_hackathon_22/pages/recommended/recommended_choice.dart';
import 'package:cathay_hackathon_22/pages/request/request_detail.dart';
import 'package:cathay_hackathon_22/pages/request/request_menu.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String requestMenu = "/request-menu";
  static const String requestDetails = "/request-details";
  static const String recommendedChoice = "/recommended-choices";
  static const String profilePage = "/profile-page";

  static List<String> routesStringList = [
    "/",
    "/request-menu",
    "/profile-page"
        "/request-details",
  ];

  static String getInitial() => '$initial';
  // static String getRequestDetails() => '$requestDetails';
  static String getRequestDetails(int pageId) =>
      '$requestDetails?pageId=$pageId';
  static String getRequestMenu() => '$requestMenu';
  static String getRecommendedChoice() => '$recommendedChoice';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => MainHomePage(),
    ),
    GetPage(
        name: requestDetails,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RequestDetails(pageId: int.parse(pageId!));
        },
        transition: Transition.rightToLeft),
    // GetPage(
    //     name: requestDetails,
    //     page: () {
    //       return RequestDetails();
    //     },
    //     transition: Transition.rightToLeft),
    GetPage(
        name: requestMenu,
        page: () => RequestMenu(),
        transition: Transition.rightToLeft),
    GetPage(
        name: recommendedChoice,
        page: () {
          return RecommendedChoice();
        },
        transition: Transition.rightToLeft),
    GetPage(
        name: profilePage,
        page: () {
          return ProfilePage();
        },
        transition: Transition.rightToLeft),
  ];
}
