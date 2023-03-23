import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

TabController? tabCont;

//return category tabs
mainTabbar() {
  return TabBar(
      onTap: (value) {},
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
          gradient: LinearGradient(
                        colors: [Colors.orange, Colors.yellow.shade600]),
          borderRadius: const BorderRadius.all(Radius.circular(50))),
      controller: tabCont,
      tabs: const [
        Tab(
          icon: FaIcon(FontAwesomeIcons.masksTheater),
          child: Text("Drama", style: TextStyle(color: Colors.white),),
        ),
        Tab(
          icon: FaIcon(FontAwesomeIcons.robot),
          child: Text("Fiction", style: TextStyle(color: Colors.white),),
        ),
        Tab(
          icon: FaIcon(FontAwesomeIcons.jetFighter),
          child: Text("Military", style: TextStyle(color: Colors.white),),
        ),
        Tab(
          icon: FaIcon(FontAwesomeIcons.book),
          child: Text("S. Stories", style: TextStyle(color: Colors.white),),
        ),
        Tab(
          icon: FaIcon(FontAwesomeIcons.landmark),
          child: Text("History", style: TextStyle(color: Colors.white),),
        ),
        Tab(
          icon: FaIcon(FontAwesomeIcons.handshake),
          child: Text("Political", style: TextStyle(color: Colors.white),),
        ),
        Tab(
          icon: FaIcon(FontAwesomeIcons.userPen),
          child: Text("Biography", style: TextStyle(color: Colors.white),),
        ),
        Tab(
          icon: FaIcon(FontAwesomeIcons.atom),
          child: Text("Science", style: TextStyle(color: Colors.white),),
        ),
        Tab(
          icon: FaIcon(FontAwesomeIcons.spellCheck),
          child: Text("Language", style: TextStyle(color: Colors.white),),
        ),
        Tab(
          icon: FaIcon(FontAwesomeIcons.dragon),
          child: Text("Mythology", style: TextStyle(color: Colors.white),),
        ),
        Tab(
          icon: FaIcon(FontAwesomeIcons.userSecret),
          child: Text("Detective", style: TextStyle(color: Colors.white),),
        ),
        Tab(
          icon: FaIcon(FontAwesomeIcons.bookAtlas),
          child: Text("Other", style: TextStyle(color: Colors.white),),
        ),
      ]);
}
