import 'package:book_db/controller/book_helper.dart';
import 'package:book_db/model/book.dart';
import 'package:book_db/widgets/library_tile.dart';
import 'package:book_db/widgets/search_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxString userInput = "".obs;
RxList<Book> myBooks = <Book>[].obs;
RxList<Widget> myLibraryTiles = <Widget>[].obs;


class GetCon extends GetxController {
  @override
  void onInit() {
    super.onInit();
    ever(
        userInput,
        (callback) => {
              if (userInput.value.length > 2) {searchList(userInput.value)}
            });
  }

  // add book to library
  addToLibrary(Book newBook) async {
    if (myBooks.isEmpty) {
      tileColor = Colors.deepPurple.shade100;
      await libraryBox.put(newBook.title!, newBook);
      myLibraryTiles.add(createLibraryTile(newBook));
      myBooks.add(newBook);
      return true;
    } else {
      for (Book book in myBooks) {
        if (book.title != newBook.title) {
          if (myBooks.indexOf(myBooks.last).isEven) {
            tileColor = Colors.deepPurple.shade100;
          } else {
            tileColor = Colors.deepPurple.shade50;
          }
          await libraryBox.put(newBook.title!, newBook);
          myLibraryTiles.add(createLibraryTile(newBook));
          myBooks.add(newBook);
          return true;
        }
      }
    }
  }

//deletes book from library
  deleteFromLibrary(Book newBook) async {
    for (int i = 0; i < myBooks.length; i++) {
      if (myBooks[i].title == newBook.title) {
        myLibraryTiles.removeAt(i);
        await libraryBox.delete(newBook.title);
        myBooks.removeAt(i);
        return true;
      }
    }
  }

//updates library
  updateLibrary(Book newBook) async {
    if (myBooks.indexOf(myBooks.last).isEven) {
            tileColor = Colors.deepPurple.shade100;
          } else {
            tileColor = Colors.deepPurple.shade50;
          }
    for (int i = 0; i < myBooks.length; i++) {
      if (myBooks[i].title == newBook.title) {
        myLibraryTiles.removeAt(i);
        myBooks.removeAt(i);
        await newBook.save();
        myLibraryTiles.add(createLibraryTile(newBook));
        myBooks.add(newBook);
        return true;
      }
    }
  }

  //deletes library and creates a new library
  createLibrary() {
    myLibraryTiles = <Widget>[].obs;
    for (Book book in myBooks) {
      if (myBooks.indexOf(book).isEven) {
        tileColor = Colors.deepPurple.shade50;
      } else {
        tileColor = Colors.deepPurple.shade100;
      }
      myLibraryTiles.add(createLibraryTile(book));
    }
  }
}

/*for (Book book in myBooks) {
      print(book.title);
      print(newBook.title);
      if (book.title != newBook.title) {
        if (myBooks.indexOf(myBooks.last).isEven) {
          tileColor = Colors.deepPurple.shade100;
        } else {
          tileColor = Colors.deepPurple.shade50;
        }
        await libraryBox.put(newBook.title!, newBook);
        myLibraryTiles.add(createLibraryTile(newBook));
        myBooks.add(newBook);
        Get.back();
        print(myLibraryTiles.length);
        return true;
      }
    }*/
