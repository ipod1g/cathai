import 'dart:math';

import 'package:cathay_hackathon_22/widgets/expandable_text.dart';
import 'package:cathay_hackathon_22/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:cathay_hackathon_22/utils/dimensions.dart';

import '../utils/colors.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class ItemDetails extends StatelessWidget {
  final Color stockColor;
  final String item;
  final String itemDescription;
  final double rating;
  final double price;
  final int comments;
  final int stockStatus;
  final int prepTime;

  const ItemDetails(
      {super.key,
      required this.item,
      this.itemDescription = "",
      this.rating = 0.0,
      this.comments = 0,
      this.price = 0.0,
      this.stockColor = const Color.fromARGB(255, 209, 82, 82),
      this.stockStatus = 0,
      required this.prepTime});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(text: item),
      SizedBox(
        height: Dimensions.height10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconAndTextWidget(
              icon: Icons.attach_money_rounded,
              text: price == 0.0 ? "Free" : "$price",
              iconColor: AppColors.mainBlackColor),
          IconAndTextWidget(
              icon: Icons.access_time_rounded,
              text: "$prepTime min",
              iconColor: AppColors.greenColor),
          IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: stockStatus == 0 ? "Not in stock" : "In stock",
              iconColor: stockStatus == 0
                  ? stockColor
                  : Color.fromARGB(255, 89, 190, 123)),
        ],
      ),
      SizedBox(
        height: Dimensions.height15,
      ),
      Row(
        children: [
          Wrap(
              children: List.generate(
                  min(rating.round(), 5),
                  (index) => const Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 18,
                      ))),
          const SizedBox(
            width: 10,
          ),
          SmallText(
            text: "$rating",
            color: AppColors.mainBlackColor,
          ),
          const SizedBox(
            width: 10,
          ),
          // SmallText(text: "$comments"),
          // const SizedBox(
          //   width: 5,
          // ),
          // SmallText(text: "comments")
        ],
      ),
      SizedBox(
        height: Dimensions.height10,
      ),
      Expanded(
          child: SingleChildScrollView(
              child: ExpandableTextWidget(text: itemDescription)))
    ]);
  }
}
