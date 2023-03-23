import 'package:book_db/controller/book_helper.dart';
import 'package:book_db/controller/get_controller.dart';
import 'package:book_db/widgets/drawer.dart';
import 'package:book_db/widgets/dialog.dart';
import 'package:book_db/widgets/search_tile.dart';
import 'package:book_db/widgets/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_network/image_network.dart';
import 'package:get/get.dart';

class AllBooks extends StatefulWidget {
  const AllBooks({super.key});

  @override
  State<AllBooks> createState() => _AllBooksState();
}

class _AllBooksState extends State<AllBooks>
    with SingleTickerProviderStateMixin {
  bool _searchMode = false;

  @override
  void initState() {
    tabCont = TabController(length: 12, vsync: this);
    _searchMode = false;
    userInput = "".obs;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabCont?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: _searchMode == false ? true : false,
        title: const Text("All Books"),
        actions: _searchMode == false
            ? [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _searchMode = true;
                      });
                    },
                    icon: const Icon(Icons.search))
              ]
            : [
                searchBar(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _searchMode = false;
                        userInput.value = "";
                      });
                    },
                    icon: const Icon(Icons.cancel_outlined))
              ],
        bottom: mainTabbar(),
      ),
      drawer: mainDrawer(),
      body: userInput.value.length >= 2
          ? Obx(() => searchList(userInput.value))
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.deepPurple.shade300,
                Colors.deepPurple.shade50
              ])),
              child: TabBarView(controller: tabCont, children: [
                GridView.builder(
                    itemCount: bookDrama.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width ~/ 250).toInt()),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => mainDialog(bookDrama[index],
                                  "Do you want to add this book into the library"),
                              child: IgnorePointer(
                                child: ImageNetwork(
                                    fitWeb: BoxFitWeb.fill,
                                    onError: const FaIcon(
                                        FontAwesomeIcons.circleExclamation),
                                    onLoading:
                                        const CircularProgressIndicator(),
                                    image: bookDrama[index].image!,
                                    height: 200,
                                    width: 150),
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            bookDrama[index].title!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            bookDrama[index].author!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      );
                    }),
                GridView.builder(
                    itemCount: bookFiction.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width ~/ 250).toInt()),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => mainDialog(bookFiction[index],
                                  "Do you want to add this book into the library"),
                              child: IgnorePointer(
                                child: ImageNetwork(
                                    fitWeb: BoxFitWeb.fill,
                                    onError: const FaIcon(
                                        FontAwesomeIcons.circleExclamation),
                                    onLoading:
                                        const CircularProgressIndicator(),
                                    image: bookFiction[index].image!,
                                    height: 200,
                                    width: 150),
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            bookFiction[index].title!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            bookFiction[index].author!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      );
                    }),
                GridView.builder(
                    itemCount: bookMilitary.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width ~/ 250).toInt()),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => mainDialog(bookMilitary[index],
                                  "Do you want to add this book into the library"),
                              child: IgnorePointer(
                                child: ImageNetwork(
                                    fitWeb: BoxFitWeb.fill,
                                    onError: const FaIcon(
                                        FontAwesomeIcons.circleExclamation),
                                    onLoading:
                                        const CircularProgressIndicator(),
                                    image: bookMilitary[index].image!,
                                    height: 200,
                                    width: 150),
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            bookMilitary[index].title!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            bookMilitary[index].author!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      );
                    }),
                GridView.builder(
                    itemCount: bookStory.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width ~/ 250).toInt()),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => mainDialog(bookStory[index],
                                  "Do you want to add this book into the library"),
                              child: IgnorePointer(
                                child: ImageNetwork(
                                    fitWeb: BoxFitWeb.fill,
                                    onError: const FaIcon(
                                        FontAwesomeIcons.circleExclamation),
                                    onLoading:
                                        const CircularProgressIndicator(),
                                    image: bookStory[index].image!,
                                    height: 200,
                                    width: 150),
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            bookStory[index].title!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            bookStory[index].author!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      );
                    }),
                GridView.builder(
                    itemCount: bookHistory.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width ~/ 250).toInt()),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => mainDialog(bookHistory[index],
                                  "Do you want to add this book into the library"),
                              child: IgnorePointer(
                                child: ImageNetwork(
                                    fitWeb: BoxFitWeb.fill,
                                    onError: const FaIcon(
                                        FontAwesomeIcons.circleExclamation),
                                    onLoading:
                                        const CircularProgressIndicator(),
                                    image: bookHistory[index].image!,
                                    height: 200,
                                    width: 150),
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            bookHistory[index].title!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            bookHistory[index].author!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      );
                    }),
                GridView.builder(
                    itemCount: bookPolitical.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width ~/ 250).toInt()),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => mainDialog(bookPolitical[index],
                                  "Do you want to add this book into the library"),
                              child: IgnorePointer(
                                child: ImageNetwork(
                                    fitWeb: BoxFitWeb.fill,
                                    onError: const FaIcon(
                                        FontAwesomeIcons.circleExclamation),
                                    onLoading:
                                        const CircularProgressIndicator(),
                                    image: bookPolitical[index].image!,
                                    height: 200,
                                    width: 150),
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            bookPolitical[index].title!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            bookPolitical[index].author!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      );
                    }),
                GridView.builder(
                    itemCount: bookBiography.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width ~/ 250).toInt()),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => mainDialog(bookBiography[index],
                                  "Do you want to add this book into the library"),
                              child: IgnorePointer(
                                child: ImageNetwork(
                                    fitWeb: BoxFitWeb.fill,
                                    onError: const FaIcon(
                                        FontAwesomeIcons.circleExclamation),
                                    onLoading:
                                        const CircularProgressIndicator(),
                                    image: bookBiography[index].image!,
                                    height: 200,
                                    width: 150),
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            bookBiography[index].title!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            bookBiography[index].author!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      );
                    }),
                GridView.builder(
                    itemCount: bookScience.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width ~/ 250).toInt()),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => mainDialog(bookScience[index],
                                  "Do you want to add this book into the library"),
                              child: IgnorePointer(
                                child: ImageNetwork(
                                    fitWeb: BoxFitWeb.fill,
                                    onError: const FaIcon(
                                        FontAwesomeIcons.circleExclamation),
                                    onLoading:
                                        const CircularProgressIndicator(),
                                    image: bookScience[index].image!,
                                    height: 200,
                                    width: 150),
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            bookScience[index].title!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            bookScience[index].author!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      );
                    }),
                GridView.builder(
                    itemCount: bookLanguage.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width ~/ 250).toInt()),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => mainDialog(bookLanguage[index],
                                  "Do you want to add this book into the library"),
                              child: IgnorePointer(
                                child: ImageNetwork(
                                    fitWeb: BoxFitWeb.fill,
                                    onError: const FaIcon(
                                        FontAwesomeIcons.circleExclamation),
                                    onLoading:
                                        const CircularProgressIndicator(),
                                    image: bookLanguage[index].image!,
                                    height: 200,
                                    width: 150),
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            bookLanguage[index].title!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            bookLanguage[index].author!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      );
                    }),
                GridView.builder(
                    itemCount: bookMythology.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width ~/ 250).toInt()),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => mainDialog(bookMythology[index],
                                  "Do you want to add this book into the library"),
                              child: IgnorePointer(
                                child: ImageNetwork(
                                    fitWeb: BoxFitWeb.fill,
                                    onError: const FaIcon(
                                        FontAwesomeIcons.circleExclamation),
                                    onLoading:
                                        const CircularProgressIndicator(),
                                    image: bookMythology[index].image!,
                                    height: 200,
                                    width: 150),
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            bookMythology[index].title!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            bookMythology[index].author!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      );
                    }),
                GridView.builder(
                    itemCount: bookDetective.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width ~/ 250).toInt()),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => mainDialog(bookDetective[index],
                                  "Do you want to add this book into the library"),
                              child: IgnorePointer(
                                child: ImageNetwork(
                                    fitWeb: BoxFitWeb.fill,
                                    onError: const FaIcon(
                                        FontAwesomeIcons.circleExclamation),
                                    onLoading:
                                        const CircularProgressIndicator(),
                                    image: bookDetective[index].image!,
                                    height: 200,
                                    width: 150),
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            bookDetective[index].title!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            bookDetective[index].author!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      );
                    }),
                GridView.builder(
                    itemCount: bookOther.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width ~/ 250).toInt()),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => mainDialog(bookOther[index],
                                  "Do you want to add this book into the library"),
                              child: IgnorePointer(
                                child: ImageNetwork(
                                    fitWeb: BoxFitWeb.fill,
                                    onError: const FaIcon(
                                        FontAwesomeIcons.circleExclamation),
                                    onLoading:
                                        const CircularProgressIndicator(),
                                    image: bookOther[index].image!,
                                    height: 200,
                                    width: 150),
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            bookOther[index].title!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            bookOther[index].author!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      );
                    }),
              ]),
            ),
    );
  }

  //returns search bar
  searchBar() {
    return Container(
      height: 80.h,
      width: 120.w,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            cursorColor: Colors.deepPurple.shade300,
            cursorWidth: 3.h,
            style: const TextStyle(),
            autofocus: true,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle:
                  TextStyle(color: Colors.deepPurple.shade300, fontSize: 18),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            onChanged: (value) {
              userInput.value = value;
              if (value.length == 2) {
                searchList(userInput.value);
                setState(() {});
              } else if (value.length < 2) {
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
