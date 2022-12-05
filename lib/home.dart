

import 'package:flutter/material.dart';
import 'package:insta_ui/screens/fav.dart';
import 'package:insta_ui/screens/homepage.dart';
import 'package:insta_ui/screens/profile.dart';
import 'package:insta_ui/screens/reels.dart';
import 'package:insta_ui/screens/search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedIndex = 0;
  var page = [
    Home_Page(),
    Search(),
    Reels(),
    Fav(),
    Profile(),
  ];
  void onchange(int index){
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: page.elementAt(selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onchange,

        type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search_rounded),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.video_collection),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border_rounded),label: ''),
        BottomNavigationBarItem(icon: CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/56146545?s=400&u=78016965316e5236f7459a344467982137d29cb8&v=4'),),label: ''),
      ]),
    );
  }
}
