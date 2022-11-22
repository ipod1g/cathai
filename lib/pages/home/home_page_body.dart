import 'package:cathay_hackathon_22/controllers/recommended_choices_controller.dart';
import 'package:cathay_hackathon_22/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:cathay_hackathon_22/utils/colors.dart';
import 'package:cathay_hackathon_22/utils/dimensions.dart';
import 'package:cathay_hackathon_22/widgets/big_text.dart';
import 'package:cathay_hackathon_22/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../widgets/medium_text.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const servicesCount = 4;

    return Column(
      children: [
        SizedBox(
          height: Dimensions.height30,
        ),
        //label Our Services
        Container(
          margin: const EdgeInsets.only(left: 20, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(text: "Our Services"),
              MediumText(
                text: "View All",
                color: AppColors.mediumGreenColor,
              )
            ],
          ),
        ),
        Divider(
          height: 20,
          thickness: 1,
          indent: Dimensions.width30,
          endIndent: Dimensions.width30,
          color: AppColors.greyTextColor,
        ),
        //slider
        //
        // Container(
        //   height: Dimensions.pageView,
        //   child: ListView.builder(
        //       controller: pageController,
        //       itemCount: servicesCount,
        //       itemBuilder: (context, position) {
        //         return _buildPageItem(position);
        //       }),
        // ),
        Container(
          height: 120,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: servicesCount,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        SizedBox(height: Dimensions.height10),
        SizedBox(
          height: Dimensions.height15,
        ),
        //label CathAI
        Container(
          margin: const EdgeInsets.only(left: 20, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(text: "CathAI's Choices"),
              MediumText(
                text: "View All",
                color: AppColors.mediumGreenColor,
              )
            ],
          ),
        ),
        Divider(
          height: 20,
          thickness: 1,
          indent: Dimensions.width30,
          endIndent: Dimensions.width30,
          color: AppColors.greyTextColor,
        ),
        //List of CathAI
        GetBuilder<RecommendedChoicesController>(builder: (recommendedChoice) {
          return recommendedChoice.isLoaded
              ? Container(
                  height: 130 * 5,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: ((context, index) => GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.getRecommendedChoice());
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.width20,
                                  right: Dimensions.width20,
                                  bottom: Dimensions.height10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: const [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 204, 203, 203),
                                        blurRadius: 20.0,
                                        spreadRadius: -10,
                                        offset: Offset(10, 10)),
                                  ]),
                              child: Row(children: [
                                //Image section
                                Container(
                                    width: 120,
                                    height: 110,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.whiteColor,
                                            style: BorderStyle.solid,
                                            width: 5),
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            bottomLeft: Radius.circular(4)),
                                        // color: AppColors.whiteColor,
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/image/korea.jpg")))),
                                //Description section
                                Expanded(
                                  child: Container(
                                      height: 110,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(4),
                                            bottomRight: Radius.circular(4)),
                                        color: AppColors.whiteColor,
                                      ),
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: Dimensions.width10,
                                              right: Dimensions.width20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              MediumText(
                                                text:
                                                    "Top tourist spots in 2022 Korea",
                                                color: AppColors.mainBlackColor,
                                              ),
                                              const SizedBox(
                                                height: 25,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SmallText(
                                                        text: "Available"),
                                                    const Icon(
                                                      Icons
                                                          .keyboard_arrow_right,
                                                      size: 35,
                                                    ),
                                                  ])
                                            ],
                                          ))),
                                )
                              ]),
                            ),
                          ))),
                )
              : const SizedBox(
                  height: 10,
                );
        })
      ],
    );
  }

  Widget _buildPageItem(int index) {
    const servicesTitle = ["Request", "Dining", "Shopping", "Safety"];

    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.getRequestMenu());
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
        ),
        width: 160,
        height: Dimensions.pageView,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.black12,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 211, 211, 211),
                blurRadius: 5.0,
                offset: Offset(0, 10))
          ],
          image: DecorationImage(
            image: AssetImage('assets/image/services$index.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 1),
              height: 30,
              width: 200,
              decoration:
                  const BoxDecoration(color: AppColors.whiteColor, boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 211, 211, 211),
                    blurRadius: 5.0,
                    offset: Offset(0, 10)),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MediumText(
                    text: servicesTitle[index],
                    color: AppColors.mainBlackColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
