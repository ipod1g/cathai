import 'package:cathay_hackathon_22/routes/route_helper.dart';
import 'package:cathay_hackathon_22/utils/colors.dart';
import 'package:cathay_hackathon_22/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:freestyle_speed_dial/freestyle_speed_dial.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import 'package:cathay_hackathon_22/utils/dimensions.dart';

class MainFloatingButton extends StatelessWidget {
  final Color backgroundColor;
  final double size;

  const MainFloatingButton({
    super.key,
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    {
      return Wrap(
        spacing: 200,
        runSpacing: 200,
        children: [
          SpeedDialBuilder(
            buttonAnchor: Alignment.topCenter,
            itemAnchor: Alignment.bottomCenter,
            buttonBuilder: (context, isActive, toggle) => FloatingActionButton(
              backgroundColor: AppColors.greenColor,
              onPressed: () {
                toggle();
                showModalBottomSheet<dynamic>(
                  // isDismissible: false,
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return GestureDetector(
                        onTap: () {
                          toggle();
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 1500,
                          color: const Color.fromARGB(0, 2, 2, 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                width: Dimensions.screenWidth,
                                height: 60,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          AppColors.mediumGreenColor),
                                  child: MediumText(text: "Close"),
                                  onPressed: () =>
                                      {Navigator.pop(context), toggle()},
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                );
              },
              child: AnimatedRotation(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubicEmphasized,
                  turns: isActive ? 0.250 : 0,
                  child: Container(
                    margin: EdgeInsets.only(left: 2, top: 1),
                    height: 26.0,
                    width: 26.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/cx_mini_white.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
            ),
            itemBuilder: (context, Tuple3<IconData, String, LayerLink> item, i,
                animation) {
              return FractionalTranslation(
                translation: Offset(0, -i.toDouble()),
                child: CompositedTransformTarget(
                  link: item.item3,
                  child: ScaleTransition(
                    scale: animation,
                    child: GestureDetector(
                      onTap: () {
                        print(i);
                        Get.toNamed(RouteHelper.getRequestMenu());
                      },
                      child: Card(
                        color: AppColors.greenColor,
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
                                  item.item1,
                                  size: 35,
                                  color: AppColors.mediumGreenColor,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                MediumText(
                                  text: item.item2,
                                  color: AppColors.whiteColor,
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
              );
            },
            items: [
              Tuple3<IconData, String, LayerLink>(
                  Icons.health_and_safety_outlined, 'Safety', LayerLink()),
              Tuple3<IconData, String, LayerLink>(
                  Icons.shopping_bag_outlined, 'Shopping', LayerLink()),
              Tuple3<IconData, String, LayerLink>(
                  Icons.dining_outlined, 'Dining', LayerLink()),
              Tuple3<IconData, String, LayerLink>(
                  Icons.back_hand_outlined, 'Request', LayerLink())
            ],
          ),
        ],
      );
    }
  }
}
