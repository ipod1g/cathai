import 'package:cathay_hackathon_22/data/api/api_client.dart';
import 'package:cathay_hackathon_22/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedChoicesRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedChoicesRepo({required this.apiClient});

  Future<Response> getRecommendedChoicesList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
