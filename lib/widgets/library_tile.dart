import 'package:book_db/controller/get_controller.dart';
import 'package:book_db/model/book.dart';
import 'package:book_db/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_network/image_network.dart';

Color tileColor = Colors.deepPurple.shade100;

//create list tile for library
createLibraryTile(Book book) {
  return ListTile(
      tileColor: tileColor,
      key: Key(book.title!),
      trailing: IconButton(
          alignment: Alignment.center,
          onPressed: () => mainDialog(book, "Do you want to delete this book?"),
          icon: const Icon(Icons.delete_forever, size: 35)),
      title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            book.image == "Empty"
                ? Expanded(
                    child: Container(
                    height: 125,
                    width: 90,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/empty_cover.jpg"))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Expanded(
                            child: Text(
                          book.title!,
                          style: const TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                        )),
                        const Expanded(
                            child: Text(
                          "by",
                          style: TextStyle(color: Colors.white),
                        )),
                        Expanded(
                            child: Text(
                          book.author!,
                          style: const TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                        ))
                      ],
                    ),
                  ))
                : Expanded(
                    child: ImageNetwork(
                        fitWeb: BoxFitWeb.fill,
                        onError:
                            const FaIcon(FontAwesomeIcons.circleExclamation),
                        onLoading: const CircularProgressIndicator(),
                        image: book.image!,
                        height: 125,
                        width: 90),
                  ),
            Expanded(
                child: Text(
              book.title!,
              style: const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 18),
            )),
            Expanded(
              child: RatingBar.builder(
                initialRating: book.rating,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) async {
                  book.rating = rating;
                  GetCon().updateLibrary(book);
                },
              ),
            )
          ]));
}
