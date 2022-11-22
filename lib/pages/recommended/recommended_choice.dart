import 'package:cathay_hackathon_22/utils/colors.dart';
import 'package:cathay_hackathon_22/utils/hex_color.dart';
import 'package:cathay_hackathon_22/widgets/app_icon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../routes/route_helper.dart';
import '../../utils/dimensions.dart';

class RecommendedChoice extends StatefulWidget {
  const RecommendedChoice({super.key});

  @override
  State<RecommendedChoice> createState() => _RecommendedChoiceState();
}

class _RecommendedChoiceState extends State<RecommendedChoice>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: HexColor('#F5F5F5'),
      systemNavigationBarIconBrightness: Brightness.dark,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final itemQuery = FirebaseFirestore.instance.collection("items");

    return Stack(children: [
      Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Stack(
          children: [
            //background img
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: Dimensions.detailsBgSize,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/image/placeholder.jpg"))),
                )),
            //top icons
            Positioned(
                top: Dimensions.height40,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getInitial());
                        },
                        child: const AppIcon(icon: Icons.arrow_back_rounded)),
                    const AppIcon(icon: Icons.shopping_cart_outlined)
                  ],
                )),
            //description
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.detailsBgSize - 55,
                child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height10),
                  decoration: const BoxDecoration(color: AppColors.whiteColor),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height15, left: 15, right: 15),
                    child:
                        // const ItemDetails(
                        //   item: "Korea, Seoul",
                        //   itemDescription:
                        //       "Hello description Hello description Hello description Hello description Hello deso description Hello deso description Hello deso description Hello description Hello description Hello description Hello description Hello description Hello description Hello description Hello description Hello description Hello description Hello description Hello description Hello description  ",
                        //   prepTime: 5,
                        //   stockStatus: 0,
                        //   rating: 3,
                        //   price: 0,
                        // )
                        StreamBuilder(
                            stream: itemQuery.snapshots(),
                            builder: (ctx,
                                AsyncSnapshot<
                                        QuerySnapshot<Map<String, dynamic>>>
                                    snap) {
                              if (snap.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final docs = snap.data!.docs;
                              return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: docs.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child:
                                          Text(docs[index]["stock"].toString()),
                                    );
                                  });
                            }),
                  ),
                )),
          ],
        ),
      ),
    ]);
  }
}
