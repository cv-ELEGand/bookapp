import 'package:book_db/controller/get_controller.dart';
import 'package:book_db/widgets/dialog.dart';
import 'package:book_db/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLibrary extends StatefulWidget {
  const MyLibrary({super.key});

  @override
  State<MyLibrary> createState() => _MyLibraryState();
}

class _MyLibraryState extends State<MyLibrary> {
  @override
  void initState() {
    GetCon().createLibrary();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            floatDialog(context);
          }),
      appBar: AppBar(
        title: const Text("My Library"),
      ),
      drawer: mainDrawer(),
      body: Obx(
        () => ListView(
          children: myLibraryTiles,
        ),
      ),
    );
  }
}
