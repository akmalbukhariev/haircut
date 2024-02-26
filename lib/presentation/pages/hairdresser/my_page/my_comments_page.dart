
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/comment_info.dart';
import '../../../widgets/child_widgets.dart';


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

class MyCommentsPage extends StatelessWidget {
  const MyCommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                navigationBar(context: context, title: "Men haqimda sharhlar"),
                const SizedBox(height: 20,),
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
                                                context: context,
                                                starCount: 5,
                                                value: 5),
                                            createProgressBar(
                                                context: context,
                                                starCount: 4,
                                                value: 4),
                                            createProgressBar(
                                                context: context,
                                                starCount: 3,
                                                value: 3),
                                            createProgressBar(
                                                context: context,
                                                starCount: 2,
                                                value: 2),
                                            createProgressBar(
                                                context: context,
                                                starCount: 1,
                                                value: 1),
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
                                          //shrinkWrap: true,
                                        ),
                                      ],
                                    ),
                                  )
                                  /*ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: commentList.length,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      final item = commentList[index];
                                      return createComment(
                                          name: item.name,
                                          starCount: item.starCount,
                                          strDate: item.date,
                                          comment: item.comment
                                      );
                                    },
                                    separatorBuilder: (BuildContext context,
                                        int index) => const Divider(),
                                  )*/
                                ],
                              )
                          )
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
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

  /*Widget createScore({int score = 0}) {
    return Column(
      children: [
        Text(score.toString(),
          style: const TextStyle(
              color: Colors.black,
              fontSize: 70,
              fontWeight: FontWeight.normal
          ),
        ),
        rowStar(score: score)
      ],
    );
  }*/

  /*Widget rowStar({int score = 0}) {
    dynamic row;
    switch (score) {
      case 0:
        row = Row(
          children: [
            starOffImage(),
            starOffImage(),
            starOffImage(),
            starOffImage(),
            starOffImage(),
          ],
        );
        break;
      case 1:
        row = Row(
          children: [
            starOnImage(),
            starOffImage(),
            starOffImage(),
            starOffImage(),
            starOffImage(),
          ],
        );
        break;
      case 2:
        row = Row(
          children: [
            starOnImage(),
            starOnImage(),
            starOffImage(),
            starOffImage(),
            starOffImage(),
          ],
        );
        break;
      case 3:
        row = Row(
          children: [
            starOnImage(),
            starOnImage(),
            starOnImage(),
            starOffImage(),
            starOffImage(),
          ],
        );
        break;
      case 4:
        row = Row(
          children: [
            starOnImage(),
            starOnImage(),
            starOnImage(),
            starOnImage(),
            starOffImage(),
          ],
        );
        break;
      case 5:
        row = Row(
          children: [
            starOnImage(),
            starOnImage(),
            starOnImage(),
            starOnImage(),
            starOnImage(),
          ],
        );
        break;
    }
    return row;
  }*/

  /*Widget createProgressBar({required BuildContext context, double value = 0}) {
    return Row(
      children: [
        Text(value.toString(),
          style: const TextStyle(color: Colors.black),),
        /*Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: 200,
          height: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: 0.7,
              valueColor: const AlwaysStoppedAnimation<Color>(
                  Color.fromRGBO(252, 59, 45, 1)),
              backgroundColor: const Color(0xffD6D6D6),
            ),
          ),
        )*/
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinearPercentIndicator(
            animation: true,
            lineHeight: 10.0,
            width: MediaQuery
                .of(context)
                .size
                .width - 250,
            animationDuration: 2500,
            percent: ((value - 1) / 4) == 0 ? 0.1 : (value - 1) / 4,
            //center: Text("80.0%"),
            barRadius: const Radius.circular(10),
            progressColor: const Color.fromRGBO(252, 59, 45, 1),
          ),
        ),
      ]
      ,);
  }*/

  /*Widget starOnImage() {
    return Image.asset("images/icon_16.png", width: 20, height: 20,);
  }*/

  /*Widget starOffImage() {
    return Image.asset("images/icon_15.png", width: 20, height: 20,);
  }*/

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

/*class ProgressBar extends StatelessWidget {
  final double max;
  final double current;
  final Color color;

  const ProgressBar(
      {Key? key,
        required this.max,
        required this.current,
        this.color = Colors.blue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, boxConstraints) {
        var x = boxConstraints.maxWidth;
        var percent = (current / max) * x;
        return Stack(
          children: [
            Container(
              width: x,
              height: 7,
              decoration: BoxDecoration(
                color: Color(0xffd3d3d3),
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: percent,
              height: 7,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(35),
              ),
            ),
          ],
        );
      },
    );
  }
}*/