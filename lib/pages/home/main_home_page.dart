import 'package:cathay_hackathon_22/pages/home/home_page_top.dart';
import 'package:flutter/material.dart';
import 'package:cathay_hackathon_22/pages/home/home_page_body.dart';
import 'package:cathay_hackathon_22/utils/colors.dart';
import 'package:draggable_widget/draggable_widget.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(children: [
        CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(children: const [
                HomePageTop(),
                HomePageBody(),
              ]),
            ),
          ],
        ),
        DraggableWidget(
          bottomMargin: 100,
          topMargin: 80,
          intialVisibility: true,
          horizontalSpace: 20,
          shadowBorderRadius: 50,
          initialPosition: AnchoringPosition.bottomRight,
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
        ),
      ]),
    );
  }
}
