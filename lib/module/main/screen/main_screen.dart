import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatstommorow/core/assets/app_assets.dart';
import 'package:whatstommorow/core/style/app_color.dart';
import 'package:whatstommorow/core/style/app_typography.dart';
import 'package:whatstommorow/module/main/controller/main_controller.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:whatstommorow/module/note/screen/note_screen.dart';
import 'package:whatstommorow/module/todo/screen/todo_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (MainController controller) {
        return Scaffold(
          body: Obx(() => IndexedStack(
                index: controller.bottomNavIndex.value,
                children: [
                  NoteScreen(),
                  TodoScreen(),
                ],
              )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          // bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar(
          //       backgroundColor: Colors.black,
          //       activeColor: AppColors.white,
          //       inactiveColor: Colors.white60,
          //       icons: [
          //         SvgPicture.asset(
          //           'assets/icons/home.svg',
          //           color: controller.bottomNavIndex.value == 0
          //               ? AppColors.white
          //               : Colors.white60,
          //         ),
          //         Icons.timeline_rounded,
          //       ],
          //       activeIndex: controller.bottomNavIndex.value,
          //       // gapLocation: GapLocation.center,
          //       notchSmoothness: NotchSmoothness.defaultEdge,
          //       onTap: (index) => controller.changeBottomNavIndex(index),
          //       //other params
          //     )),
          bottomNavigationBar: Obx(() => Container(
              color: Colors.white,
              height: 70, // Set your desired height here
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.white,
                selectedItemColor: AppColors.eerieblack,
                unselectedItemColor: AppColors.eerieblack,
                currentIndex: controller.bottomNavIndex.value,
                onTap: (index) => controller.changeBottomNavIndex(index),
                selectedLabelStyle: AppTypography.caption(),
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          AppAssets.homeDarkButton,
                        )),
                    activeIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          AppAssets.homeDarkButton,
                        )),
                    label: 'Journal',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          AppAssets.todoDarkButton,
                        )),
                    activeIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          AppAssets.todoDarkButton,
                        )),
                    label: 'To Do',
                  ),
                ],
              ))),
        );
      },
    );
  }
}
