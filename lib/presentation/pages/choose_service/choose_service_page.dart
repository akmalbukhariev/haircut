import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haircut/constant/control_app.dart';
import 'package:haircut/constant/language.dart';
import 'package:haircut/data/models/user_info.dart';

import '../../../data/dataproviders/http_service.dart';
import '../../../data/models/http_response/response_user_info.dart';
import '../../widgets/tap_animation_widget.dart';
import '../hairdresser/main_page/hairdresser_main_page.dart';
import '../loading_overlay.dart';
import '../sign_up/phone_number_page.dart';
import '../user/user_main_page.dart';

class ChooseServicePage extends StatefulWidget{
  const ChooseServicePage({super.key});

  @override
  State<ChooseServicePage> createState() => _ChooseServicePage();
}

class _ChooseServicePage extends State<ChooseServicePage> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Material(
            child: SafeArea(
                child: Stack(
                  children: [
                    Container(
                      color: const Color.fromRGBO(78, 65, 71, 1),),
                    Column(
                      children: [
                        Align(
                            heightFactor: 1.5,
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/app_logo.png", width: 120,
                                  height: 120,),
                                Text("BARBERS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'RumbleBrave'
                                  ),),
                                SizedBox(height: 20,),
                                Container(
                                  color: Colors.grey, width: 180, height: 1,),
                                SizedBox(height: 20,),
                                SizedBox(
                                  width: 300,
                                  child: Text(
                                    "Go'zallik uchun xizmat ko'rsatuvchi platformaga",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text("XUSH KELIBSIZ ", style: TextStyle(
                                    color: Colors.white, fontSize: 20),),
                              ],
                            )
                        ),
                        Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)
                                  )
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30,
                                          top: 30,
                                          right: 30,
                                          bottom: 10),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                              border: Border.all(
                                                  color: Colors.grey)
                                          ),
                                          child: ListTile(
                                            onTap: () {
                                              selectLanguage();
                                            },
                                            dense: true,
                                            leading: Image.asset(
                                              "images/uzbekistan.png",
                                              width: 30, height: 30,),
                                            title: Text(
                                              "O'zbek tilida davom ettirish",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      118, 118, 118, 1)),
                                            ),
                                            trailing: Image.asset(
                                              "images/icon_8.png", width: 20,
                                              height: 20,),
                                          )
                                      )
                                  ),
                                  const SizedBox(height: 20,),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 30),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TapAnimationWidget(
                                            tabWidget: createCard(
                                                title: "MEN XIZMAT KO'RSATUVCHIMAN",
                                                image: "images/i_service_provider.png"),
                                            onPressedCallBack: () {
                                                clickOption();
                                            },
                                          ),
                                          TapAnimationWidget(
                                            tabWidget: createCard(
                                                title: "MEN MIJOZMAN",
                                                image: "images/i_customer.png",
                                                isCustomer: true),
                                            onPressedCallBack: () {
                                              clickOption(isCustomer: true);
                                            },
                                          )
                                        ],
                                      )
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Text(
                                    "Iltimos dasturdan foydalanish usulingizni tanlang",
                                    style: TextStyle(color: Color.fromRGBO(
                                        204, 204, 204, 1)),),
                                  const SizedBox(height: 20,),
                                ],
                              ),
                            )
                        )
                      ],
                    ),
                  ],
                )
            )
        )
    );
  }

  Widget createCard({required String title, required String image, bool isCustomer = false}) {
    return SizedBox(
      height: 170,
        child: Card(
        color: const Color.fromRGBO(249, 249, 249, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, width: 90, height: 90,),
            SizedBox(height: isCustomer? 20 : 15,),
            SizedBox(
              width: 150,
              child: Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),),
            )
          ],
        )
    )
    );
  }

  Future<void> selectLanguage() async {
    switch (await showDialog<Language>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Tilni tanlang'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Language.Uzbek);
                },
                child: const Text("O'zbek"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Language.Uzbek_cyrillic);
                },
                child: const Text("Узбекча"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Language.Russian);
                },
                child: const Text("Ruski"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Language.English);
                },
                child: const Text("English"),
              ),
            ],
          );
        }
    ))
    {
      case Language.Uzbek:
        print("clicked uzbek");
        break;
      case Language.Uzbek_cyrillic:
        print("clicked uzbek cyrillic");
        break;
      case Language.Russian:
        print("clicked russin");
        break;
      case Language.English:
        print("clicked english");
        break;
      case null:
        break;
    }
  }

  Future<void> clickOption({bool isCustomer = false})async {

    ControlApp? control = ControlApp.Instance();

    if(control?.appInfo?.phone?.trim() != ""){
      if(isCustomer){
        LoadingOverlay.show(context);
        ResponseUserInfo? response = await HttpService.updateUserCustomer(
            data: UserInfo(
                phone: control?.appInfo?.phone,
                is_customer: "1")
        );
        LoadingOverlay.hide();

        Navigator.pushAndRemoveUntil( context,
          CupertinoPageRoute(builder: (BuildContext context) => UserMainPage()),
              (Route<dynamic> route) => false,);
      }
      else{
        LoadingOverlay.show(context);
        ResponseUserInfo? response = await HttpService.updateUserHairdresser(
            data: UserInfo(
                phone: control?.appInfo?.phone,
                is_hairdresser: "1")
        );
        LoadingOverlay.hide();

        Navigator.pushAndRemoveUntil( context,
          CupertinoPageRoute(builder: (BuildContext context) => HairdresserMainPage()),
              (Route<dynamic> route) => false,);
      }
    }
    else {
      control?.hasCustomerClicked = isCustomer;

      if(isCustomer){
        control?.registerUser?.is_customer = "1";
        control?.registerUser?.is_hairdresser = "0";
      }
      else{
        control?.registerUser?.is_customer = "0";
        control?.registerUser?.is_hairdresser = "1";
      }

      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>
                PhoneNumberPage()),
      );
    }
  }
}
