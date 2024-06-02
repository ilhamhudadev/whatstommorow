import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:whatstommorow/core/assets/app_assets.dart';
import 'package:whatstommorow/core/style/app_color.dart';
import 'package:whatstommorow/core/style/app_size.dart';
import 'package:whatstommorow/core/style/app_typography.dart';
import 'package:whatstommorow/module/note/controller/note_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatstommorow/module/todo/controller/todo_controller.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
      init: TodoController(),
      builder: (TodoController controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("To Do List",
                    style: AppTypography.title1(color: Colors.black)),
                InkWell(
                    radius: 20.0,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 42,
                                width: 40,
                                child: SvgPicture.asset(
                                  AppAssets.moreButton,
                                  height: 42,
                                  width: 40,
                                )),
                          ]),
                    ))
              ],
            ),
          ),
          backgroundColor: AppColors.white,
          body: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: ListView.builder(
              // controller: scrollController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            index == 0 ? search() : Container(),
                            index == 0
                                ? buttonCreate(controller, context)
                                : Container(),
                            index == 0
                                ? SizedBox(
                                    height: 10,
                                  )
                                : Container(),
                          ],
                        ),
                        section()
                      ]),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget section() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SvgPicture.asset(image),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    checkColor: AppColors.white,
                    activeColor: AppColors.eerieblack,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("#Work",
                                  style: AppTypography.caption(
                                      color: Colors.black)),
                              Text("Tommorow I will ",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTypography.title2(
                                      color: Colors.black)),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.remove_red_eye_outlined))
            ],
          ),
        ],
      ),
    );
  }

  Widget search() {
    TextEditingController searchController = TextEditingController();
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
      decoration: BoxDecoration(
          color: AppColors.greywhite,
          border: Border(left: BorderSide(color: Colors.black87, width: 1))),
      child: Row(children: [
        // SvgPicture.asset(AppAssets.search),
        const SizedBox(
          width: 19,
        ),
        Expanded(
            flex: 1,
            child: TextField(
              controller: searchController,
              // onChanged: (value) => c.filterDataList(value),
              onEditingComplete: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },

              textInputAction: TextInputAction.done,
              decoration: InputDecoration.collapsed(
                hintStyle: AppTypography.title3(),
                border: InputBorder.none,
                hintText: "search your journey....",
              ),
            ))
      ]),
    );
  }

  Widget buttonCreate(controller, context) {
    return Container(
      width: 97,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton.icon(
        onPressed: () {
          controller.showPopup(context);
          // Aksi ketika tombol ditekan
        },
        icon: Text(
          '+',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        label: Text(
          'Create',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        style: TextButton.styleFrom(
          splashFactory: InkRipple.splashFactory,
          foregroundColor: Colors.grey,
          textStyle: AppTypography.hyperlink2(),
          padding: EdgeInsets.zero, // Menghapus padding default
        ),
      ),
    );
  }
}
