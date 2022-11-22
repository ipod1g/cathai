import 'package:cathay_hackathon_22/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:freestyle_speed_dial/freestyle_speed_dial.dart';
import 'package:tuple/tuple.dart';

import 'package:cathay_hackathon_22/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';

class Tere extends StatelessWidget {
  final Color backgroundColor;
  final double size;

  const Tere({
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
            buttonBuilder: (context, isActive, toggle) => GestureDetector(
              onTap: () {
                print(toggle);
              },
              child: FloatingActionButton(
                backgroundColor: AppColors.greenColor,
                onPressed: toggle,
                // onPressed: null,
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutCubicEmphasized,
                  turns: isActive ? 0.125 : 0,
                  child: const Icon(Icons.add),
                ),
              ),
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
                      },
                      child: Card(
                        color: AppColors.lightGreenColor,
                        margin: const EdgeInsets.only(
                            left: 10, bottom: 10, right: 10),
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 100, bottom: 20, top: 20),
                            child: Row(
                              children: [
                                Icon(item.item1),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(item.item2)
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
              );
            },
            items: [
              // You can also define and use your own container class
              // if you don't want to use the tuple package.
              Tuple3<IconData, String, LayerLink>(
                  Icons.hub, 'Hub', LayerLink()),
              Tuple3<IconData, String, LayerLink>(
                  Icons.track_changes, 'Track', LayerLink()),
              Tuple3<IconData, String, LayerLink>(
                  Icons.ice_skating_outlined, 'Ice', LayerLink())
            ],
          ),
        ],
      );
    }
  }
}
