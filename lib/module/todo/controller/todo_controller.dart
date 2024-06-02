import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatstommorow/core/style/app_color.dart';
import 'package:whatstommorow/core/style/app_typography.dart';

class TodoController extends GetxController {
  TextEditingController categoryController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();

  void showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.black, width: 1),
          ),
          child: Container(
            width: 348,
            height: 353,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                Expanded(
                    flex: 1,
                    child: TextField(
                      style: AppTypography.body2(),
                      controller: categoryController,
                      onEditingComplete: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration.collapsed(
                        hintStyle: AppTypography.body2(
                            color: AppColors.placeholdertextfield),
                        border: InputBorder.none,
                        hintText: "Category",
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: TextField(
                      style: AppTypography.title3(),
                      controller: titleController,
                      onEditingComplete: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration.collapsed(
                        hintStyle: AppTypography.title3(
                            color: AppColors.placeholdertextfield),
                        border: InputBorder.none,
                        hintText: "Title",
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: TextField(
                      controller: descController,
                      style: AppTypography.caption(),
                      onEditingComplete: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration.collapsed(
                        hintStyle: AppTypography.caption(
                            color: AppColors.placeholdertextfield),
                        border: InputBorder.none,
                        hintText: "Description",
                      ),
                      maxLines: 4,
                    )),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: TextField(
                          style: AppTypography.caption(),
                          controller: deadlineController,
                          onEditingComplete: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration.collapsed(
                            hintStyle: AppTypography.caption(
                                color: AppColors.placeholdertextfield),
                            border: InputBorder.none,
                            hintText: "Deadline",
                          ),
                        )),
                    buttonSubmit()
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buttonSubmit() {
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
        icon: Icon(
          Icons.send,
          size: 10,
        ),
        label: Text(
          'Submit',
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
