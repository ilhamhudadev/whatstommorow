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

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoteController>(
      init: NoteController(),
      builder: (NoteController controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: Text("What's Tommorow.",
                style: AppTypography.title1(color: Colors.black)),
          ),
          backgroundColor: AppColors.white,
          body: Container(
            padding: EdgeInsets.all(20),
            child: ListView.builder(
              // controller: scrollController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sectionHead(index, controller),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          index == 0 ? search() : Container(),
                          index == 0 ? buttonCreate() : Container(),
                        ],
                      ),
                      section()
                    ]);
              },
            ),
          ),
        );
      },
    );
  }

  Widget sectionHead(index, controller) {
    DateTime now = new DateTime.now();
    String formattedDate = DateFormat('EEEE, d MMMM').format(now);
    return Column(
      children: [
        index == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hei,",
                                style: AppTypography.body2(
                                    color: Color.fromARGB(255, 55, 42, 42))),
                            Text(controller.getGreeting().toString(),
                                style:
                                    AppTypography.title1(color: Colors.black)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(formattedDate.toString(),
                                style: AppTypography.body2(
                                    color: Color.fromARGB(255, 55, 42, 42)))
                          ],
                        ),
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
                                    SizedBox(height: 5),
                                    Text("Stats",
                                        style: AppTypography.caption(
                                            color: Colors.black)),
                                  ]),
                            ))
                      ])
                ],
              )
            : Container(),
      ],
    );
  }

  Widget section() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // SvgPicture.asset(image),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("17 ",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.title1(color: Colors.black)),
                          Text("Friday ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              style: AppTypography.body2(
                                  color: Color.fromARGB(255, 55, 42, 42))),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                top:
                                    BorderSide(color: Colors.black87, width: 1),
                                right:
                                    BorderSide(color: Colors.white, width: 1))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Text(article.content.toString(),
                            //     style: AppTypography.body2()),

                            Container(
                                child: Container(
                              padding: const EdgeInsets.only(top: 20),
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
                                  Text(
                                      "Operahouse Mobile App designed by Kamil Tatol. Connect with them on ",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                      style: AppTypography.body2(
                                          color:
                                              Color.fromARGB(255, 55, 42, 42))),
                                ],
                              ),
                            )),

                            TextButton(
                              onPressed: () {},
                              child: Text("See More",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTypography.title3(
                                      color: Colors.black)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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

  Widget buttonCreate() {
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
