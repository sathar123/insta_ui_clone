import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../data/dummyData.dart';



class Reels extends StatelessWidget {
  const Reels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: PageView.builder(
          scrollDirection: Axis.vertical,
            itemCount: ReelData.length,
            itemBuilder: (BuildContext context , int index){
          return Reelvideo(size: size,index: index,);
        })
      ),
    );
  }
}

class Reelvideo extends StatelessWidget {
  var index;

   Reelvideo({
    Key? key,
    required this.size,required this.index
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var data = ReelData[index];
    return Stack(
        children: [
    Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  '${data['video']}'),
              fit: BoxFit.fill)),
    ),
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reels',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 120,),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('${data['userimg']}'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${data['username']}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'Follow',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                Container(
                  height: 50,
                  width: size.width/2,
                  child:   ExpandableText(
                    data['keyword'],
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    expandText: '',
                    collapseText: 'show less',
                    expandOnTextTap: true,
                    collapseOnTextTap: true,
                    maxLines: 2,
                    linkColor: Colors.grey,
                  ),
                ),
                  Row(
                    children: [
                      Icon(Icons.graphic_eq_outlined,color: Colors.white,size: 16,),
                      Text(
                        '${data['username']}${data['music']}. Original audio',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.favorite_border_rounded,color: Colors.white,),
                  SizedBox(height: 10,),
                  Text('${data['like']}k',style: TextStyle(color: Colors.white),),
                  SizedBox(height: 10,),
                  Icon(Icons.messenger_outline,color: Colors.white,),
                  SizedBox(height: 10,),
                  Text('${data['comment']}',style: TextStyle(color: Colors.white),),
                  SizedBox(height: 10,),
                  Icon(Icons.send_outlined,color: Colors.white,),
                  SizedBox(height: 10,),
                  Icon(Icons.more_vert,color: Colors.white,),
                  SizedBox(height: 10,),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage('${data['userimg']}'),fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white,width: 3)
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    ),
        ],
      );
  }
}
