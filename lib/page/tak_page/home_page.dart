//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'fade_page.dart';

class HomePageDark extends StatefulWidget {
  const HomePageDark({Key key}) : super(key: key);

  @override
  State<HomePageDark> createState() => _HomePageDarkState();
}

class _HomePageDarkState extends State<HomePageDark> {
  int currentPages = 0;
  final _pages = [
    FadePageDark(),
    FadePageDark(),
    FadePageDark(),
    FadePageDark(),
    FadePageDark(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Instagram",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Feather.camera,
            color: Colors.grey,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Feather.tv,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesome.send_o,
              color: Colors.grey,
            ),
          ),
        ],
      ),


      body: _pages[currentPages],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPages,
        onTap: (i){
          setState(() {
            currentPages = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Foundation.home),
            label: "Feed",
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.plus_square),
            label: "Upload",
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.heart),
            label: "Like"

          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.user),
              label: "Account",
          ),
        ],
      ),
    );
  }
}
