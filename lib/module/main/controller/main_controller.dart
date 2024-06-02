import 'package:get/get.dart';
import 'package:whatstommorow/module/main/data/repo/main_repo.dart';

class MainController extends GetxController {
  RxInt bottomNavIndex = 0.obs;

  void changeBottomNavIndex(int index) {
    bottomNavIndex.value = index;
    // Add your logic here for handling the bottom navigation item change
  }
}
