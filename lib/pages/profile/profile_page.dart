import 'package:cathay_hackathon_22/utils/colors.dart';
import 'package:cathay_hackathon_22/utils/dimensions.dart';
import 'package:cathay_hackathon_22/widgets/big_text.dart';
import 'package:cathay_hackathon_22/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var item = [
    Icons.language,
    Icons.do_disturb_rounded,
    Icons.child_care,
    Icons.medical_information_outlined
  ];

  var colors = [
    AppColors.lightGreenColor,
    AppColors.iconColor1,
    AppColors.lightGreenColor,
    AppColors.lightGreenColor
  ];

  var buttonText = [
    "Preferred Language",
    "Do Not Disturb",
    "with 1 child",
    "No Medical Condition"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.height20,
          ),
          Row(
            children: [
              SizedBox(
                width: Dimensions.width20,
              ),
              BigText(
                text: "Ms. Lisa, YI",
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
            height: Dimensions.height30,
          ),
          Row(
            children: [
              SizedBox(
                width: Dimensions.height20,
              ),
              BigText(text: "Status"),
            ],
          ),
          Divider(
            height: 20,
            thickness: 1,
            indent: Dimensions.width30,
            endIndent: Dimensions.width30,
            color: AppColors.greyTextColor,
          ),
          SizedBox(
            height: Dimensions.height30,
          ),
          Container(
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: item.length,
                  itemBuilder: ((context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            item[1] = Icons.check_circle_outline;
                            colors[1] = AppColors.brightGreenColor;
                            buttonText[1] = "Reachable";
                          });
                        },
                        child: Container(
                          color: colors[index],
                          margin: const EdgeInsets.only(
                              left: 10, bottom: 10, right: 10),
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 100, bottom: 20, top: 20),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    item[index],
                                    // item.,
                                    size: 35,
                                    color: AppColors.greenColor,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  MediumText(
                                    text: buttonText[index],
                                    color: AppColors.mainBlackColor,
                                  )
                                ],
                              )),
                        ),
                      )))),
        ],
      ),
    );
  }
}
