import 'package:whatstommorow/core/route/route_constant.dart';
import 'package:get/get.dart';
import 'package:whatstommorow/module/main/screen/main_screen.dart';
import 'package:whatstommorow/module/note/screen/note_screen.dart';
import 'package:whatstommorow/module/todo/screen/todo_screen.dart';

class AppRoute {
  static final all = [
    GetPage(name: RouteConstant.todoScreen, page: () => const TodoScreen()),
    GetPage(name: RouteConstant.noteScreen, page: () => const NoteScreen()),
    GetPage(name: RouteConstant.mainScreen, page: () => MainScreen()),
  ];
}
