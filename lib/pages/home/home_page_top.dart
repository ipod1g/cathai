import 'package:flutter/material.dart';
import 'package:cathay_hackathon_22/utils/colors.dart';
import 'package:cathay_hackathon_22/utils/dimensions.dart';
import 'package:cathay_hackathon_22/widgets/big_text.dart';
import 'package:cathay_hackathon_22/widgets/icon_and_text_widget.dart';
import 'package:cathay_hackathon_22/widgets/small_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../widgets/medium_text.dart';

class HomePageTop extends StatefulWidget {
  const HomePageTop({Key? key}) : super(key: key);

  @override
  State<HomePageTop> createState() => _HomePageTopState();
}

class _HomePageTopState extends State<HomePageTop> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      // updated value notified to UI
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
            top: 100,
            left: 100,
            width: 100,
            child: Icon(Icons.airplanemode_active)),
        Column(children: [
          // Hero panel
          Container(
            height: 280,
            width: Dimensions.screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/clear.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width15,
                    right: Dimensions.width15,
                    top: 30,
                    bottom: 30),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255)
                        .withOpacity(0.2), //here i want to add opacity
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        MediumText(
                          text: "Welcome Lisa",
                          color: AppColors.mainBlackColor,
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        SvgPicture.asset(
                          "assets/image/gold-card-face.svg",
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width10, right: Dimensions.width10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [BigText(text: "HKG"), BigText(text: "ICN")],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: Dimensions.height10),
                        child: LinearPercentIndicator(
                          animation: true,
                          animationDuration: 1500,
                          percent: 53 / 100,
                          lineHeight: 5,
                          backgroundColor: AppColors.lightGreenColor,
                          progressColor: AppColors.greenColor,
                        )),
                    Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width10, right: Dimensions.width10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MediumText(
                            text: "09:15",
                            color: AppColors.mainBlackColor,
                          ),
                          MediumText(
                            text: "12:30",
                            color: AppColors.mainBlackColor,
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MediumText(
                          text: "Timezone (KST)",
                          color: AppColors.mainBlackColor,
                          size: 15,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            MediumText(
                              text: "Class",
                              color: AppColors.mainBlackColor,
                            ),
                            BigText(text: "Economy")
                          ],
                        ),
                        SizedBox(
                          width: Dimensions.width15,
                        ),
                        Column(
                          children: [
                            MediumText(
                              text: "Seat",
                              color: AppColors.mainBlackColor,
                            ),
                            BigText(text: "47G")
                          ],
                        ),
                        const SizedBox(width: 50),
                        Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/image/sunny.png'),
                              fit: BoxFit.fill,
                            ))),
                        Column(
                          children: [
                            MediumText(
                              text: "Weather",
                              color: AppColors.mainBlackColor,
                            ),
                            BigText(text: "21°C")
                          ],
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ]),
      ],
    );
  }
}
