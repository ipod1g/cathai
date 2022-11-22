import 'package:cathay_hackathon_22/data/api/api_client.dart';
import 'package:cathay_hackathon_22/utils/app_constants.dart';
import 'package:get/get.dart';

class RequestProductRepo extends GetxService {
  final ApiClient apiClient;
  RequestProductRepo({required this.apiClient});

  Future<Response> getRequestProductList() async {
    return await apiClient.getData(AppConstants.REQUEST_PRODUCT_URI);
  }
}
