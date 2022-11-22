import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cathay_hackathon_22/routes/route_helper.dart';
import 'package:cathay_hackathon_22/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0;

  late PageController _pageController;
  late Animation<double> borderRadiusAnimation;
  late AnimationController _hideBottomBarAnimationController;
  late Animation<double> _animation;
  late AnimationController _animationController;

  final iconList = [
    Icons.home_outlined,
    Icons.search_rounded,
    Icons.notifications_none_rounded,
    Icons.person_outline_rounded,
  ];

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: HexColor('#F5F5F5'),
      systemNavigationBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: iconList.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? HexColor('#FFA400') : AppColors.greyTextColor;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconList[index],
              size: 30,
              color: color,
            ),
            // MainFloatingButton(),
            const SizedBox(height: 4),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8),
            //   child: AutoSizeText(
            //     "Item $index",
            //     maxLines: 1,
            //     style: TextStyle(color: color),
            //     group: autoSizeGroup,
            //   ),
            // )
          ],
        );
      },
      notchMargin: 30,
      backgroundColor: HexColor('#F5F5F5'),
      activeIndex: _bottomNavIndex,
      splashColor: HexColor('#FFA400'),
      splashSpeedInMilliseconds: 300,
      gapLocation: GapLocation.center,
      gapWidth: 100,
      onTap: (index) => {
        setState(() => _bottomNavIndex = index),
        Get.toNamed('${RouteHelper.routesStringList[index]}')
        // Get.toNamed(RouteHelper.getInitial())
      },
      elevation: 0,
      hideAnimationController: _hideBottomBarAnimationController,
    );
  }
}
