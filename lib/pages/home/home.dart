import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cathay_hackathon_22/pages/chat/chatbot.dart';
import 'package:cathay_hackathon_22/pages/home/main_home_page.dart';
import 'package:cathay_hackathon_22/pages/profile/profile_page.dart';
import 'package:cathay_hackathon_22/pages/recommended/recommended_choice.dart';
import 'package:cathay_hackathon_22/utils/hex_color.dart';
import 'package:cathay_hackathon_22/widgets/main_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:cathay_hackathon_22/utils/colors.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  var _selectedPageIndex;
  late List<Widget> _pages;
  late PageController _pageController;

  final autoSizeGroup = AutoSizeGroup();

  late Animation<double> borderRadiusAnimation;
  late AnimationController _hideBottomBarAnimationController;
  late Animation<double> _animation;
  late AnimationController _animationController;

  final iconList = [
    Icons.home_outlined,
    Icons.message_outlined,
    Icons.notifications_none_rounded,
    Icons.person_outline_rounded,
  ];

  @override
  void initState() {
    super.initState();

    _selectedPageIndex = 0;
    _pages = [
      const MainHomePage(),
      const ChatBot(),
      const RecommendedChoice(),
      ProfilePage()
      //The individual tabs.
    ];

    _pageController = PageController(initialPage: _selectedPageIndex);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

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
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 80.0,
              width: 250.0,
              margin: EdgeInsets.only(left: 30),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/Cathay_Pacific-Logo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Icon(Icons.language_sharp))
          ],
        ),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        elevation: 3,
        foregroundColor: AppColors.greyTextColor,
        // Get.toNamed(RouteHelper.getInitial());
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      floatingActionButton: Visibility(
          visible: !keyboardIsOpen, child: const MainFloatingButton()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color =
              isActive ? HexColor('#FFA400') : AppColors.greyTextColor;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 30,
                color: color,
              ),
              const SizedBox(height: 4),
            ],
          );
        },
        backgroundColor: HexColor('#F5F5F5'),
        activeIndex: _selectedPageIndex,
        splashColor: HexColor('#FFA400'),
        splashSpeedInMilliseconds: 300,
        gapLocation: GapLocation.center,
        gapWidth: 100,
        onTap: (index) => {
          setState(() =>
              {_selectedPageIndex = index, _pageController.jumpToPage(index)}),
        },
        elevation: 0,
        hideAnimationController: _hideBottomBarAnimationController,
      ),
    );
  }
}
