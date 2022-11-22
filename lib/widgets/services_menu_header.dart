import 'package:cathay_hackathon_22/utils/colors.dart';
import 'package:cathay_hackathon_22/utils/dimensions.dart';
import 'package:cathay_hackathon_22/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';

class ServicesMenuHeader extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const ServicesMenuHeader(
      {Key? key,
      required this.icon,
      required this.text,
      this.iconColor = AppColors.greyTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(
          width: Dimensions.width30,
        ),
        SizedBox(
          width: Dimensions.width30,
        ),
        BigText(
          text: text,
        ),
        SizedBox(
          width: Dimensions.width30,
        ),
        SizedBox(
          width: Dimensions.width30,
        ),
      ],
    );
  }
}
