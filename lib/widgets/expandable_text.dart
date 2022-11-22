import 'package:cathay_hackathon_22/utils/colors.dart';
import 'package:cathay_hackathon_22/utils/dimensions.dart';
import 'package:cathay_hackathon_22/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf)
          : Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SmallText(
                  text: hiddenText ? "$firstHalf..." : firstHalf + secondHalf,
                  size: Dimensions.font20,
                  color: AppColors.greyTextColor,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(children: [
                    SmallText(
                      text: hiddenText ? "Show more" : "Show less",
                      color: AppColors.mediumGreenColor,
                    ),
                    Icon(
                      hiddenText
                          ? Icons.arrow_drop_down_rounded
                          : Icons.arrow_drop_up_rounded,
                      color: AppColors.mediumGreenColor,
                    )
                  ]),
                ),
                SizedBox(
                  height: Dimensions.height15,
                )
              ],
            ),
    );
  }
}
