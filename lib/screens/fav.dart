import 'package:flutter/material.dart';
import 'package:insta_ui/data/dummyData.dart';

class Fav extends StatelessWidget {
  const Fav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var favlist = [];
    favlist = List.generate(5, (index){
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('${profileimage[index]}'),
        ),
        title: Text('${user[index]} started following you.',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        trailing: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            'Follow',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    });
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Notifications',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.separated(
            padding: EdgeInsets.all(10),
            itemBuilder: (context, int index) {
              return Text(
                '${favdate[index]}',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              );
            },
            separatorBuilder: (context, int index) {
              if(index ==2){

              }
              return Column(
                children: [
                  favlist[index],
                  favlist[index+1],
                  favlist[index+2],
                ],
              );
            },
            itemCount: favdate.length));
  }
}
