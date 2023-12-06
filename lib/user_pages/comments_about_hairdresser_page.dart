
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../content_views/child_widgets.dart';
import '../content_views/tap_animation_widget.dart';
import '../models/comment_info.dart';

final commentList = [
  CommentInfo(name: "Begzot Nazarov",starCount: 4, date: "05.10.2023", comment: "Axbvxvhsxg hsxhv  ncbxc"),
  CommentInfo(name: "Ikrom Ilxomov",starCount: 3, date: "10.10.2023", comment: "sdcsdc hsxhv  ncbxc"),
  CommentInfo(name: "Begzot Ashurov",starCount: 1, date: "12.06.2023", comment: "sdcsdc hsxhv  ncbxc"),
  CommentInfo(name: "Begzot Temirov",starCount: 5, date: "04.03.2023", comment: "Axbvxvhsxg rthgrth  ncbxc"),
  CommentInfo(name: "Begzot Bozorov",starCount: 4, date: "09.11.2023", comment: "sdcdsc zczxcz  ncbxc"),
  CommentInfo(name: "Begzot Toshpulatov",starCount: 2, date: "20.10.2023", comment: "fgbfgb hsxhv  bdgbfb"),
  CommentInfo(name: "Begzot Ziyoddinov",starCount: 2, date: "26.12.2023", comment: "btyhy hsxhv  tyhty"),
  CommentInfo(name: "Begzot Sobirov",starCount: 3, date: "18.07.2023", comment: "csdvdsfsdfsdfsf hsxsdfsdfhv  ncbxc"),
];

class CommentsAboutHairdresserPage extends StatefulWidget{
  const CommentsAboutHairdresserPage({super.key});

  @override
  State<CommentsAboutHairdresserPage> createState() => _CommentsAboutHairdresserPage();
}

class _CommentsAboutHairdresserPage extends State<CommentsAboutHairdresserPage>{
  @override
  Widget build(BuildContext context) {
     return CupertinoPageScaffold(
       child: Material(
         child: SafeArea(
         child: Container(
           color: Colors.white,
           child: Column(
               children: [
                 createNavigationbar(),
                 Expanded(
                   child: Container(
                       color: const Color.fromRGBO(240, 244, 249, 1),
                       child: Padding(
                           padding: const EdgeInsets.only(
                               left: 20, right: 20, top: 20, bottom: 30),
                           child: Container(
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(10)
                               ),
                               child: Column(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(top: 10),
                                     child: createHeader(),
                                   ),
                                   Container(
                                     decoration: const BoxDecoration(
                                         color: Color.fromRGBO(249, 249, 249, 1),
                                         border: Border(
                                           top: BorderSide(color: Color.fromRGBO(
                                               243, 243, 243, 1)),
                                           bottom: BorderSide(
                                               color: Color.fromRGBO(
                                                   243, 243, 243, 1)),
                                         )
                                     ),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         createScore(score: 3),
                                         const SizedBox(width: 45,),
                                         Column(
                                           children: [
                                             createProgressBar(
                                                 context: context, value: 5),
                                             createProgressBar(
                                                 context: context, value: 4),
                                             createProgressBar(
                                                 context: context, value: 3),
                                             createProgressBar(
                                                 context: context, value: 2),
                                             createProgressBar(
                                                 context: context, value: 1),
                                           ],)
                                       ],
                                     ),
                                   ),
                                   Expanded(
                                     child: CustomScrollView(
                                       slivers: [
                                         SliverList(
                                           delegate: SliverChildBuilderDelegate(
                                                 (BuildContext context,
                                                 int index) {
                                               final item = commentList[index];
                                               return createComment(
                                                   name: item.name,
                                                   starCount: item.starCount,
                                                   strDate: item.date,
                                                   comment: item.comment
                                               ); // Replace with your list item widget
                                             },
                                             childCount: commentList.length,
                                           ),
                                         ),
                                       ],
                                     ),
                                   )
                                 ],
                               )
                           )
                       )
                   ),
                 )
               ],
           ),
         )
         ),
       ),
     );
  }

  Widget createNavigationbar() {
    return Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: Row(
          children: [
            TapAnimationWidget(
              tabWidget: Image.asset(
                "images/icon_1.png", width: 30, height: 30,),
              onPressedCallBack: () {
                //Navigator.pop(context);
              },
            ),
            const SizedBox(width: 15,),
            CircleAvatar(
                radius: 19,
                backgroundColor: Colors.grey,
                child: ClipOval(
                    child: Image.asset(
                      "images/avatar_1.png", width: 35, height: 35,)
                )
            ),
            const SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Alisher Karimov", style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1), fontSize: 17),),
                Row(
                  children: [
                    Text("ID 1234567",
                      style: TextStyle(
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontSize: 14),
                    ),
                    //Expanded(child: SizedBox(height: 10,),)
                  ],
                )
              ],
            ),
          ],
        )
    );
  }

  Widget createHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        headerItem(image: "images/speech_bubble.png", text: "5"),
        Container(
          width: 1,
          height: 30,
          color: Colors.grey,
        ),
        headerItem(image: "images/visible.png", text: "50"),
        Container(
          width: 1,
          height: 30,
          color: Colors.grey,
        ),
        headerItem(image: "images/love.png", text: "10"),
      ],
    );
  }

  Widget headerItem({String image = "", String text = ""}) {
    return Column(
      children: [
        Image.asset(image, width: 30, height: 30,),
        const SizedBox(height: 5,),
        Text(text, style: const TextStyle(color: Colors.grey, fontSize: 15),),
      ],
    );
  }

  Widget createComment({String name = "", int starCount = 0, String strDate = "", String comment = ""}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          Row(
            children: [
              rowStar(score: starCount),
              const SizedBox(width: 15,),
              Text(strDate, style: const TextStyle(fontSize: 13),)
            ],
          ),
          const SizedBox(height: 10,),
          Text(comment, style: const TextStyle(color: Colors.grey),),
          const Divider(color: Colors.grey,)
        ],)
      ,);
  }
}