import 'package:cathay_hackathon_22/controllers/request_product_controller.dart';
import 'package:cathay_hackathon_22/data/api/api_client.dart';
import 'package:cathay_hackathon_22/data/repository/request_product_repo.dart';
import 'package:cathay_hackathon_22/utils/app_constants.dart';
import 'package:get/get.dart';

import '../controllers/recommended_choices_controller.dart';
import '../data/repository/recommended_choices_repo.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => RequestProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedChoicesRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => RequestProductController(requestProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedChoicesController(recommendedChoicesRepo: Get.find()));
}
