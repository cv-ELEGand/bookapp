import 'package:book_db/controller/api_connection.dart';
import 'package:book_db/model/book.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';



var libraryBox = Hive.box<Book>("library");
List<Book> bookDrama = [];
List<Book> bookFiction = [];
List<Book> bookMilitary = [];
List<Book> bookStory = [];
List<Book> bookHistory = [];
List<Book> bookPolitical = [];
List<Book> bookBiography = [];
List<Book> bookScience = [];
List<Book> bookLanguage = [];
List<Book> bookMythology = [];
List<Book> bookDetective = [];
List<Book> bookOther = [];
List<String> bookInfo = [];

//categorize fetched books
categorizeBooks() {
  for (var book in totalBooks) {
    switch (book.category) {
      case "Drama":
        bookDrama.add(book);
        break;
      case "Fiction":
        bookFiction.add(book);
        break;
      case "Military":
        bookMilitary.add(book);
        break;
      case "Short stories":
        bookStory.add(book);
        break;
      case "History":
        bookHistory.add(book);
        break;
      case "Political":
        bookPolitical.add(book);
        break;
      case "Biography":
        bookBiography.add(book);
        break;
      case "Science":
        bookScience.add(book);
        break;
      case "Language":
        bookLanguage.add(book);
        break;
      case "Words":
        bookLanguage.add(book);
        break;
      case "Mythology":
        bookMythology.add(book);
        break;
      case "Detective":
        bookDetective.add(book);
        break;
      default:
        bookOther.add(book);
    }
  }
}

