import 'package:book_db/model/book.dart';
import 'package:book_db/view/error_page.dart';
import 'package:get/get.dart';

List<Book> totalBooks = [];

final _connect = GetConnect();
const String url = "http://muhammedyildirim.me/api/data/books"; 
String category = "";
String title = "";
String author = "";
String image = "";


//fetch books from database
Future fetchBookData() async {
  try {
    var response = await _connect.get("$url?pageSize=40");
  List allBooks = response.body;
  for (var book in allBooks) {
    Book newBook = Book(book["title"], book["author"], book["category"],
        book["image"],0.0);
    totalBooks.add(newBook);
  }
  } catch (e) {
    Get.to(() => const ErrorPage());
  }
  
}


