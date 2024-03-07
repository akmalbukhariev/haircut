
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/presentation/pages/user/my_room/my_room_name_page.dart';
import 'package:haircut/presentation/pages/user/my_room/my_room_page_cubit.dart';
import 'package:haircut/presentation/pages/user/my_room/my_room_page_state.dart';
import 'package:haircut/presentation/pages/user/my_room/my_room_phone_page.dart';
import 'package:haircut/presentation/pages/user/my_room/my_room_surname_page.dart';
import 'package:haircut/presentation/widgets/tap_animation_widget.dart';

import '../../../../constant/language.dart';
import '../../../../constant/notification.dart';
import '../../../widgets/child_widgets.dart';
import '../../../widgets/language_widget.dart';
import '../../../widgets/notification_widget.dart';
import '../../loading_overlay.dart';

class MyRoomPage extends StatefulWidget{
  const MyRoomPage({super.key});

  @override
  State<MyRoomPage> createState() => _MyRoomPage();
}

class _MyRoomPage extends State<MyRoomPage>{

  bool _languageVisible = false;
  bool _notificationVisible = false;

  @override
  void initState() {
    context.read<MyRoomPageCubit>().initPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: BlocBuilder<MyRoomPageCubit, MyRoomPageState>(
            builder: (context, state) {
              return SafeArea(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                createHeader(),
                                const SizedBox(height: 20,),
                                Expanded(
                                    child: Stack(
                                      children: [
                                        Container(color: const Color.fromRGBO(
                                            240, 244, 249, 1),),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                top: 20,
                                                bottom: 30),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius
                                                        .circular(10)
                                                ),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      ExpansionTile(
                                                        title: Row(
                                                          children: [
                                                            Image.asset(
                                                              "images/userinfo.png",
                                                              width: 20,
                                                              height: 20,),
                                                            const SizedBox(
                                                              width: 5,),
                                                            Text(
                                                              "Mening ma'lumotlarim",
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                      113,
                                                                      113,
                                                                      113,
                                                                      1)
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  left: 10),
                                                              child: Container(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    249, 249,
                                                                    249,
                                                                    1),
                                                                child: Column(
                                                                  children: [
                                                                    TapAnimationWidget(
                                                                      tabWidget: createText(
                                                                        text1: "Ismim",
                                                                        text2: state.name ?? "",
                                                                      ),
                                                                      onPressedCallBack: () {
                                                                        Navigator
                                                                            .push(
                                                                          context,
                                                                          CupertinoPageRoute(
                                                                              builder: (
                                                                                  context) =>
                                                                                  MyRoomNamePage()
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                    TapAnimationWidget(
                                                                      tabWidget: createText(
                                                                          text1: "Familiyam",
                                                                          text2: state.surName ?? ""
                                                                      ),
                                                                      onPressedCallBack: () {
                                                                        Navigator
                                                                            .push(
                                                                          context,
                                                                          CupertinoPageRoute(
                                                                              builder: (
                                                                                  context) =>
                                                                                  MyRoomSurnamePage()),
                                                                        );
                                                                      },
                                                                    ),
                                                                    TapAnimationWidget(
                                                                      tabWidget: createText(
                                                                          text1: "Telefon raqamim",
                                                                          text2: state.phone ?? ""
                                                                      ),
                                                                      onPressedCallBack: () {
                                                                        Navigator
                                                                            .push(
                                                                          context,
                                                                          CupertinoPageRoute(
                                                                              builder: (
                                                                                  context) =>
                                                                                  MyRoomPhonePage()),
                                                                        );
                                                                      },
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                          )
                                                        ],
                                                      ),
                                                      //const Divider(color: Colors.black12),//Color.fromRGBO(241, 241, 241, 1),),
                                                      ExpansionTile(
                                                        collapsedShape: const RoundedRectangleBorder(
                                                          side: BorderSide
                                                              .none,
                                                        ),
                                                        title: Row(
                                                          children: [
                                                            Image.asset(
                                                              "images/services.png",
                                                              width: 20,
                                                              height: 20,),
                                                            const SizedBox(
                                                              width: 5,),
                                                            Text("Sozlamalar",
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                      113,
                                                                      113,
                                                                      113,
                                                                      1)
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  left: 10),
                                                              child: Container(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    249, 249,
                                                                    249,
                                                                    1),
                                                                child: Column(
                                                                  children: [
                                                                    TapAnimationWidget(
                                                                      tabWidget: createText(
                                                                        text1: "Til",
                                                                        text2: state.language!,
                                                                      ),
                                                                      onPressedCallBack: () {
                                                                        setState(() {
                                                                          _languageVisible =
                                                                          !_languageVisible;
                                                                        });
                                                                      },
                                                                    ),
                                                                    TapAnimationWidget(
                                                                      tabWidget: createText(
                                                                          text1: "Xabardor qilish",
                                                                          text2: "${state.notification} daqiqa oldin"
                                                                      ),
                                                                      onPressedCallBack: () {
                                                                        setState(() {
                                                                          _notificationVisible =
                                                                          !_notificationVisible;
                                                                        });
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                          )
                                                        ],
                                                      ),
                                                      //const Divider(color: Colors.black12, height: 5,),//Color.fromRGBO(241, 241, 241, 1),),
                                                      Padding(
                                                          padding: const EdgeInsets
                                                              .only(left: 15,
                                                            top: 10,
                                                            bottom: 10,),
                                                          child: Row(
                                                            children: [
                                                              Image.asset(
                                                                "images/email.png",
                                                                width: 20,
                                                                height: 20,),
                                                              const SizedBox(
                                                                width: 10,),
                                                              Text(
                                                                  "Dastur bo'yicha murojat yuborish",
                                                                  style: TextStyle(
                                                                      color: Color
                                                                          .fromRGBO(
                                                                          113,
                                                                          113,
                                                                          113,
                                                                          1)
                                                                  )
                                                              ),
                                                            ],
                                                          )
                                                      ),
                                                      const Divider(
                                                        color: Colors.black12,
                                                        height: 5,),
                                                      //Color.fromRGBO(241, 241, 241, 1),),
                                                      Padding(
                                                          padding: const EdgeInsets.only(left: 15,
                                                            top: 10,
                                                            bottom: 10,),
                                                          child: TapAnimationWidget(
                                                            tabWidget:Row(
                                                              children: [
                                                                Image.asset(
                                                                  "images/logout.png",
                                                                  width: 20,
                                                                  height: 20,),
                                                                const SizedBox(
                                                                  width: 10,),
                                                                Text("Chiqish",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red)),
                                                              ],
                                                            ),
                                                            onPressedCallBack: (){
                                                              context.read<MyRoomPageCubit>().exitApp(context);
                                                            },
                                                          )
                                                      )
                                                    ],
                                                  ),
                                                )
                                            )
                                        )
                                      ],
                                    )
                                )
                              ],
                            )
                        ),
                      ),
                      animateWidget(
                          widget: LanguageWidget(
                            selectlanguage: stringToLanguage(state.language ?? Language.Uzbek.toString()),
                            onPressedCallBack: (Language language) {
                              context.read<MyRoomPageCubit>().setLanguage(language: language);
                            setState(() {
                              _languageVisible = !_languageVisible;
                            });
                          },),
                          context: context,
                          visible: _languageVisible
                      ),
                      animateWidget(
                          widget: NotificationWidget(
                            selectedNotification: stringToNotification(state.notification ?? NotificationId.n_5_minute.toString()),
                            onPressedCallBack: (NotificationId notification) {
                              context.read<MyRoomPageCubit>().setNotification(notification: notification);
                              setState(() {
                                _notificationVisible = !_notificationVisible;
                              });
                            },
                          ),
                          context: context,
                          visible: _notificationVisible
                      ),
                      if(state.isLoading)
                        LoadingOverlayWidget()
                    ],
                  )
              );
            }
        )
    );
  }

  Widget createHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 15, top: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.read<MyRoomPageCubit>().updateUserInfo(context: context);
            },
            child: Image.asset("images/icon_1.png", width: 25, height: 25,),
          ),
          const SizedBox(width: 10,),
          Text("Shaxsiy kabinet", style: const TextStyle(
              color: Color.fromRGBO(51, 51, 51, 1), fontSize: 20),)
        ],
      ),
    );
  }

  Widget createText({required String text1, required String text2, bool useBlue = true}){
    Color txtColor = useBlue? const Color.fromRGBO(73, 162, 191, 1) : const Color.fromRGBO(113, 113, 113, 1);
     return Padding(
         padding: const EdgeInsets.only(left: 10),
         child: Column(
           children: [
             Padding(padding: const EdgeInsets.only(top: 5, right: 5),
             child: ListTile(
               title: Text(text1, style: TextStyle(color: Color.fromRGBO(113, 113, 113, 1),),),
               trailing: Text(text2, style: TextStyle(color: txtColor, fontWeight: FontWeight.bold),),
             )),
             const Divider(height: 1, color: Color.fromRGBO(113, 113, 113, 1),)
           ],
         ),
     );
  }
}