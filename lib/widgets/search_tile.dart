import 'package:book_db/controller/api_connection.dart';
import 'package:book_db/model/book.dart';
import 'package:book_db/widgets/dialog.dart';
import 'package:flutter/material.dart';

//creates suggestion list from all books for search function
searchList(String userInput) {
  List<Book> suggestionList = [];
  if (userInput.length >= 2) {
    for (Book element in totalBooks) {
      if (element.title!.toLowerCase().contains(userInput.toLowerCase())) {
        suggestionList.add(element);
      }
    }
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () => mainDialog(suggestionList[index], "Do you want to add this book into the library"),
            title: Text(suggestionList[index].title!),
          );
        });
  } else {
    return const SizedBox();
  }
}
