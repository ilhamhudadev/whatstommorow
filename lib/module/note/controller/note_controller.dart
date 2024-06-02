import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NoteController extends GetxController {
  // DateTime now = new DateTime.now();
  // String formattedDate = DateFormat('EEEE, d MMMM').format(now);
  String getGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 5 && hour < 12) {
      return 'good morning.';
    } else if (hour >= 12 && hour < 17) {
      return 'good afternoon.';
    } else {
      return 'good evening.';
    }
  }
}
