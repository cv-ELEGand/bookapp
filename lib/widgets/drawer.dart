import 'package:book_db/view/all_books.dart';
import 'package:book_db/view/map_page.dart';
import 'package:book_db/view/my_library.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

//main drawer of app
mainDrawer() {
  return Drawer(
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
                          colors: [Colors.deepPurple.shade900, Colors.deepPurple.shade300])
      ),
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FaIcon(FontAwesomeIcons.bookOpenReader,size: 50, color: Colors.amber.shade600,),
                Text("Fake BookApp", style: TextStyle(fontSize: 24, color: Colors.amber.shade200),),
              ],
            ))),
          ListTile(
            title: const Text("My Library", style: TextStyle(fontSize: 18, color: Colors.white),),
            onTap: () => Get.to(() => const MyLibrary()),
          ),
          const Divider(),
          ListTile(
            title: const Text("All Books", style: TextStyle(fontSize: 18, color: Colors.white),),
            onTap: () => Get.to(() => const AllBooks()),
          ),
          const Divider(),
          ListTile(
            title: const Text("Find BookStore", style: TextStyle(fontSize: 18, color: Colors.white),),
            onTap: () => Get.to(() => const MapPage()),
          ),
        ],
      ),
    ),
  );
}
