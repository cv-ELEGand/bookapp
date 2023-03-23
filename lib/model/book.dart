import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'book.g.dart';

@HiveType(typeId: 0)
class Book extends HiveObject{
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? author;

  @HiveField(2)
  String? category;

  @HiveField(3)
  String? image;

  @HiveField(4)
  double rating = 0.0;

  Book(this.title, this.author, this.category, this.image, this.rating);

  @override
  String toString() {
    return "$title, $author, $category, $image, $rating";
  }
}
