
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haircut/constant/control_app.dart';
import 'package:haircut/data/models/app_info.dart';
import 'package:haircut/data/models/http_response/response_detail_hairdresser.dart';

import '../../../constant/Result.dart';
import '../../../data/dataproviders/http_service.dart';
import '../../../data/models/http_response/response_hairdresser_info.dart';
import '../../../data/models/http_response/response_user_info.dart';
import '../dialog_box.dart';
import '../hairdresser/hairdresser_main_page.dart';
import '../loading_overlay.dart';
import '../user/user_main_page.dart';
import 'authentication_number_page.dart';
import '../../widgets/clean_button_textfield.dart';

class PhoneNumberPage extends StatefulWidget{
  const PhoneNumberPage({
    super.key
  });

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPage();
}

class _PhoneNumberPage extends State<PhoneNumberPage>{

  late final TextEditingController txtBoxPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              color: const Color.fromRGBO(78, 65, 71, 1),
            ),
            Column(
              children: [
                Align(
                    heightFactor: 2.5,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Image.asset(
                          "images/app_logo.png", width: 120, height: 120,),
                        Text("BARBERS",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'RumbleBrave'
                          ),),
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
                          const SizedBox(height: 20,),
                          Text("Ro'yxatdan o'tish",
                            style: TextStyle(
                                color: Color.fromRGBO(102, 102, 102, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.normal
                            ),),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20, top: 20, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey, width: 1)
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: CleanButtonTextField(
                                    controlTextField: this.txtBoxPhone,
                                    placeHolder: "Telefon raqamingizni kiriting",)
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 20, top: 20, right: 20),
                              child: Text(
                                "Telefon raqamingizni kiritayotganingizda uning "
                                    "to'g'riligiga ichonch hoxil qiling. Tasdiqlashingiz uchun biz bu "
                                    "raqamga maxsus kod yuboramiz.",
                                style: TextStyle(
                                    color: Color.fromRGBO(128, 128, 128, 1),
                                    fontSize: 14
                                ),
                              )
                          ),
                          Expanded(child: SizedBox()),
                          Padding(
                              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                              child: SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .circular(
                                              10),
                                        )
                                    ),
                                    onPressed: () {
                                      moveNextPage();
                                    },
                                    child: const Text("Keyingi"),
                                  )
                              )
                          ),
                        ],
                      )
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> moveNextPage() async{

    if(txtBoxPhone.text.isEmpty) {
      AppAlertDialog.showAlert(
        context,
        "Ro'yxatdan o'tish",
        "Iltimos telefon raqamingizni tekshiring",
            () {
          // This callback will be executed after the dialog is dismissed
        },
      );
      return;
    }

    ControlApp? control = ControlApp.Instance();
    control?.registerUser?.phone = txtBoxPhone.text;

    if(control?.hasCustomerClicked == true) {
      LoadingOverlay.show(context);
      ResponseUserInfo? response = await HttpService.getUserInfo(
          phone: txtBoxPhone.text
      );
      LoadingOverlay.hide();

      if(response?.resultCode == Result.USER_EXIST_CODE.toString()){

        AppInfo appInfo = AppInfo(
            phone: txtBoxPhone.text,
            name: response?.resultData?.name,
            surName: response?.resultData?.surname,
            language: response?.resultData?.language,
            notification: response?.resultData?.notification,
            isCustomer: control?.registerUser?.is_customer,
            isHairdresser: control?.registerUser?.is_hairdresser
        );
        await control?.SetAppInfo(appInfo: appInfo);

        Navigator.pushAndRemoveUntil(context,
          CupertinoPageRoute(builder: (BuildContext context) => UserMainPage()),
              (Route<dynamic> route) => false,);
      }
      else{
        await Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) =>
                  AuthenticationNumberPage()),
        );
      }
    }
    else{
      LoadingOverlay.show(context);
      ResponseHairdresserInfo? response = await HttpService.getHairdresserInfo(
          phone: txtBoxPhone.text
      );
      LoadingOverlay.hide();

      if(response?.resultCode == Result.USER_EXIST_CODE.toString()){
        AppInfo appInfo = AppInfo(
            phone: txtBoxPhone.text,
            name: response?.resultData?.name,
            surName: response?.resultData?.surname,
            language: response?.resultData?.language,
            notification: response?.resultData?.notification,
            isCustomer: control?.registerUser?.is_customer,
            isHairdresser: control?.registerUser?.is_hairdresser
        );
        await control?.SetAppInfo(appInfo: appInfo);

        Navigator.pushAndRemoveUntil(context,
          CupertinoPageRoute(builder: (BuildContext context) => HairdresserMainPage()),
              (Route<dynamic> route) => false,);
      }
      else{
        await Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) =>
                  AuthenticationNumberPage()),
        );
      }
    }
  }
}