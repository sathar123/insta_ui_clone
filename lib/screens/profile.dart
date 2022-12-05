
import 'package:flutter/material.dart';

import '../data/dummyData.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Wrap(
          children: [
            Text('user_name'),
            Icon(Icons.keyboard_arrow_down_rounded)
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline)),
          IconButton(onPressed: (){}, icon: Icon(Icons.dehaze_rounded)),

        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              //follow section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/56146545?s=400&u=78016965316e5236f7459a344467982137d29cb8&v=4'),
                  ),
                  Column(
                    children: [
                      Text('45',style: TextStyle(color: Colors.white)),
                      Text('Posts',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  Column(
                    children: [
                      Text('1M',style: TextStyle(color: Colors.white)),
                      Text('Followers',style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Column(
                    children: [
                      Text('101',style: TextStyle(color: Colors.white)),
                      Text('Following',style: TextStyle(color: Colors.white))
                    ],
                  ),

                ],
              ),
              //bio secion
              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 230,top: 10,bottom: 10),
                child: SizedBox(
                  width: 150,
                  child: Text(
                    "Sathar                "
                        "welcome     "
                        "    followme..... "
                        ,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18.0,color: Colors.white),
                    maxLines: 4,),
                )
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(onPressed: (){},child: Text('Edit profile',style: TextStyle(color: Colors.white),),color: Colors.grey.shade800,shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),),
                    ),
                    SizedBox(width: 10,),
                    MaterialButton(onPressed: (){},child: Icon(Icons.perm_contact_calendar,color: Colors.white,),color: Colors.grey.shade800,shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                    ),),

                  ],
                ),
              ),
             DefaultTabController(

               length: 3,
               child: TabBar(
            indicatorColor: Colors.white,
                   tabs: [
                 Icon(Icons.grid_4x4),
                 Icon(Icons.video_collection),
                     Icon(Icons.account_circle_outlined),
               ]
               ),


             ),
              GridView.builder(
                physics: ScrollPhysics(),
                itemCount: postimage.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 2,crossAxisSpacing: 2), itemBuilder: (context,int index){
                return Container(
                  height: 100,
                  width: 100,
                 decoration: BoxDecoration(
                   image: DecorationImage(image: NetworkImage('${postimage[index]}'),fit: BoxFit.fill)

                 ),
                );
              })




            ],
          ),
        ),
      )
    );
  }
}
