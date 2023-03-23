import 'dart:ui';
import 'package:book_db/controller/get_controller.dart';
import 'package:book_db/model/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


//all books dialog
mainDialog(Book newBook, String text) {
  bool addOperation = text.contains("add") ? true : false;
  return Get.dialog(
    BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        title: Center(
          child: Text(newBook.title!),
        ),
        content: SizedBox(
          height: 80,
          child: Column(
            children: [
              Center(child: Text(text)),
              Visibility(
                visible: addOperation,
                child: RatingBar.builder(
                  initialRating: 0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    newBook.rating = rating;
                  },
                ),
              )
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          Container(
            width: 50.w,
            color: Colors.green.shade300,
            child: IconButton(
                color: Colors.black,
                onPressed: () {
                  if (addOperation) {
                    GetCon().addToLibrary(newBook);
                  } else {
                    GetCon().deleteFromLibrary(newBook);
                  }
                  Get.back();
                },
                icon: const FaIcon(FontAwesomeIcons.check)),
          ),
          Container(
            width: 50.w,
            color: Colors.red.shade300,
            child: IconButton(
                color: Colors.black,
                onPressed: () {
                  Get.back();
                },
                icon: const FaIcon(FontAwesomeIcons.xmark)),
          )
        ],
      ),
    ),
  );
}


//float action button dialog
floatDialog(BuildContext context) {
  List<DropdownMenuItem<String>> categoryList = [
    "Other",
    "Fiction",
    "Drama",
    "Political",
    " Biography",
    "Military",
    "Story",
    "History",
    "Science",
    "Language",
    "Mythology",
    "Detective",
  ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  double ratingVal = 0.0;
  String category = "Other";
  return showDialog(
    context: context,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Center(
            child: Text("Add new book to library"),
          ),
          content: SizedBox(
            height: 250,
            child: Column(
              children: [
                Expanded(
                  child: Center(
                      child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(hintText: "Title"),
                  )),
                ),
                Expanded(
                  child: Center(
                      child: TextField(
                    controller: authorController,
                    decoration: const InputDecoration(hintText: "Author"),
                  )),
                ),
                Expanded(
                  child: Center(
                      child: DropdownButton(
                          hint: const Text("Select a category"),
                          items: categoryList,
                          value: category,
                          onChanged: (value) {
                            setState(() => category = value!);
                          })),
                ),
                Expanded(
                  child: Center(
                      child: TextField(
                    controller: imageController,
                    decoration: const InputDecoration(hintText: "Image (Optional)"),
                  )),
                ),
                Expanded(
                  child: RatingBar.builder(
                    initialRating: 0,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      ratingVal = rating;
                    },
                  ),
                )
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            Container(
              width: 50.w,
              color: Colors.green.shade300,
              child: IconButton(
                  color: Colors.black,
                  onPressed: () {
                    if (imageController.text.length < 5) {
                      imageController.text = "Empty";
                    }
                    Book newBook = Book(
                      titleController.text,
                      authorController.text,
                      categoryController.text,
                      imageController.text,
                      ratingVal
                    );
                    GetCon().addToLibrary(newBook);
                    Get.back();
                  },
                  icon: const FaIcon(FontAwesomeIcons.check)),
            ),
            Container(
              width: 50.w,
              color: Colors.red.shade300,
              child: IconButton(
                  color: Colors.black,
                  onPressed: () {
                    Get.back();
                  },
                  icon: const FaIcon(FontAwesomeIcons.xmark)),
            )
          ],
        ),
      ),
    ),
  );
}
