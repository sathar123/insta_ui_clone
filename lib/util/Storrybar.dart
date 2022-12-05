
import 'package:flutter/material.dart';

import '../data/dummyData.dart';

class Storry extends StatelessWidget {
  var index;
   Storry({required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8),
    child: Column(
        children: [

          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
image: DecorationImage(image: NetworkImage('${profileimage[index]}')),
              shape: BoxShape.circle,
              color: Colors.grey,
            ),

          ),
          SizedBox(height: 10,),
          Text('${user[index]}',style: TextStyle(color: Colors.white),),
        ],
    ),
      );
  }
}
