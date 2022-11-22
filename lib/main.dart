import 'package:cathay_hackathon_22/controllers/recommended_choices_controller.dart';
import 'package:cathay_hackathon_22/controllers/request_product_controller.dart';
import 'package:cathay_hackathon_22/firebase_options.dart';
import 'package:cathay_hackathon_22/pages/home/home.dart';
import 'package:cathay_hackathon_22/routes/route_helper.dart';
import 'package:cathay_hackathon_22/utils/app_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cathay_hackathon_22/pages/home/main_home_page.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: optionsFireBase.apiKey,
          appId: optionsFireBase.appId,
          messagingSenderId: optionsFireBase.messagingSenderId,
          projectId: optionsFireBase.projectId));
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<RequestProductController>().getRequestProductList();
    Get.find<RecommendedChoicesController>().getRecommendedChoicesList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
      ),
      home: const Home(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
