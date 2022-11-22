import 'package:cathay_hackathon_22/data/repository/recommended_choices_repo.dart';
import 'package:cathay_hackathon_22/models/request_model.dart';
import 'package:get/get.dart';

class RecommendedChoicesController extends GetxController {
  final RecommendedChoicesRepo recommendedChoicesRepo;
  RecommendedChoicesController({required this.recommendedChoicesRepo});
  List<dynamic> _recommendedChoicesList = [];
  List<dynamic> get recommendedChoicesList => _recommendedChoicesList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedChoicesList() async {
    Response response =
        await recommendedChoicesRepo.getRecommendedChoicesList();
    if (response.statusCode == 200) {
      print("responsed recommendeds");
      _recommendedChoicesList = [];
      // IMPORTANT MODEL TO DIGEST DATA
      // _recommendedChoicesList.addAll(response.body);
      _recommendedChoicesList.addAll(Request.fromJson(response.body).products);
      _isLoaded = true;
      update(); //setState
    } else {}
  }
}
