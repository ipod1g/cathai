import 'package:cathay_hackathon_22/data/repository/request_product_repo.dart';
import 'package:cathay_hackathon_22/models/request_model.dart';
import 'package:get/get.dart';

class RequestProductController extends GetxController {
  final RequestProductRepo requestProductRepo;
  RequestProductController({required this.requestProductRepo});
  List<dynamic> _requestProductList = [];
  List<dynamic> get requestProductList => _requestProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRequestProductList() async {
    Response response = await requestProductRepo.getRequestProductList();
    if (response.statusCode == 200) {
      print("responded products");
      _requestProductList = [];
      _requestProductList.addAll(Request.fromJson(response.body).products);
      _isLoaded = true;
      update(); //setState
    } else {
      print(response.statusCode);
    }
  }
}
