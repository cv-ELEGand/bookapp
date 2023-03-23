import 'package:book_db/controller/api_connection.dart';
import 'package:book_db/controller/book_helper.dart';
import 'package:book_db/controller/get_controller.dart';
import 'package:book_db/model/book.dart';
import 'package:book_db/view/all_books.dart';
import 'package:book_db/view/error_page.dart';
import 'package:book_db/view/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:book_db/model/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookAdapter());
  await Hive.openBox<Book>("library");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mainFuture(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ScreenUtilInit(
              builder: (context, _) => GetMaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: colorSheme,
                  dividerColor: Colors.black,
                  iconTheme: const IconThemeData(color: Colors.white),
                ),
                home: const AllBooks(),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return ScreenUtilInit(
              builder: (context, _) => const GetMaterialApp(
                debugShowCheckedModeBanner: false,
                home: IntroPage(),
              ),
            );
          } else {
            return ScreenUtilInit(
              builder: (context, _) => const GetMaterialApp(
                debugShowCheckedModeBanner: false,
                home: ErrorPage(),
              ),
            );
          }
        });
  }
}

//Fetch books and categorize them and create library
Future mainFuture() async {
  try {
    await fetchBookData().then((value) {
      myBooks.value = Hive.box<Book>("library").values.toList();
      categorizeBooks();
      GetCon().createLibrary();
    });
  } catch (e) {
    Get.to(() => const ErrorPage());
  }
}
