import 'package:flutter/cupertino.dart';
import 'package:cathay_hackathon_22/utils/dimensions.dart';

class MediumText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  MediumText(
      {Key? key,
      this.color = const Color(0xFFFFFFFF),
      required this.text,
      this.size = 0,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1,
        overflow: overFlow,
        style: TextStyle(
            color: color,
            fontSize: size == 0 ? Dimensions.font20 : size,
            fontWeight: FontWeight.w500,
            fontFamily: 'Lato'));
  }
}
