import 'dart:math';

import 'package:staggered_grid_view_flutter/staggered_grid_view_flutter.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../data/dummyData.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var iconlist = [
      Icon(null),
      Icon(
        Icons.collections,
        color: Colors.white,
      ),
      Icon(
        Icons.video_collection,
        color: Colors.white,
      )
    ];
    final _random = new Random();

    final List<Widget> listTilenew = <Widget>[];
    for (int i = 0; i < 40; i++) {
      var randomImg = imageurl[_random.nextInt(imageurl.length)];
      Icon ricon = iconlist[_random.nextInt(iconlist.length)];
      listTilenew.add(BgTile(
        iconData: ricon,
        imgurl: randomImg,
      ));
    }
    final List<StaggeredTile> cardTilenew = <StaggeredTile>[];
    var flag = 0;
    for (int i = 0; i <= 6; i++) {
      for (int j = 1; j <= 2; j++) {
        cardTilenew.add(StaggeredTile.count(1, 1));
        if (flag == 2) {
          flag = 0;
          for (int k = 0; k < 4; k++) {
            cardTilenew.add(StaggeredTile.count(1, 1));
          }
        }
      }
      cardTilenew.add(StaggeredTile.count(1, 2));
      flag++;
    }
    cardTilenew.add(StaggeredTile.count(1, 1));
    cardTilenew.add(StaggeredTile.count(1, 1));

    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 5),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade900,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 20,
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),

               StaggeredGridView.count(
                 physics: ScrollPhysics(),
                 shrinkWrap: true,
                 padding: EdgeInsets.zero,
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  staggeredTiles: cardTilenew,
                  children: listTilenew,
                ),
            ],
          ),
        ));
  }
}

class BgTile extends StatelessWidget {
  final String imgurl;
  final Icon iconData;

  BgTile({required this.iconData, required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
        child: Stack(
            fit: StackFit.expand, children: [
      Image.network(
        imgurl,
        fit: BoxFit.fill,
      ),
      Positioned(
        right: 10,
        top: 10,
        child: iconData,
      )
    ]));
  }
}
