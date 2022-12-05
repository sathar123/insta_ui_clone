
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data/dummyData.dart';

class UserPost extends StatelessWidget {
  const UserPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      physics: ScrollPhysics(),
shrinkWrap: true,
        itemCount: postimage.length,
        itemBuilder: (BuildContext ctx,int index){
          return Container(
            color: Colors.black,
            child: Column(
              children: [

                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(profileimage[index]),
                    radius: 19,
                  ),
                  title: Text('${user[index]}',style: TextStyle(color: Colors.white),),
                  trailing: Icon(Icons.more_vert,color: Colors.white,),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(postimage[index]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(

                    children: [
                      Icon(Icons.favorite_border_rounded,color: Colors.white,),
                      SizedBox(width: 15,),
                      Icon(FontAwesomeIcons.comment,color: Colors.white,),
                      SizedBox(width: 15,),
                      Icon(Icons.telegram_outlined,color: Colors.white,),
                      SizedBox(width: 270,),
                      Icon(Icons.bookmark_add_outlined,color: Colors.white,)
                    ],
                  ),
                ),
                SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text('17,625 likes',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  child:  ExpandableText(
                    'This data letpeople are searching for the keyword, how much people are bidding for the keyword (if you the keyword, and also whether the search volume is on an upword trend or downward trend.',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    expandText: 'more',
                    collapseText: 'show less',
                    expandOnTextTap: true,
                    collapseOnTextTap: true,
                    maxLines: 2,
                    linkColor: Colors.grey,
                  ),
                )

              ],
            ),
          );
        }
    );
  }
}
