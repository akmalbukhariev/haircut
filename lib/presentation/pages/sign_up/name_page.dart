import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haircut/constant/control_app.dart';

import '../../../constant/Result.dart';
import '../../../data/dataproviders/http_service.dart';
import '../../../data/models/app_info.dart';
import '../../../data/models/http_response/response_register.dart';
import '../../../data/models/http_models/register_user.dart';
import '../../widgets/clean_button_textfield.dart';
import '../dialog_box.dart';
import '../hairdresser/hairdresser_main_page.dart';
import '../loading_overlay.dart';
import '../user/my_main_page.dart';

class NamePage extends StatefulWidget{
   NamePage({
    super.key
  });

  @override
  State<NamePage> createState() => _NamePage();
}

class _NamePage extends State<NamePage> {

  late final TextEditingController txtBoxLastName = TextEditingController();
  late final TextEditingController txtBoxFirstName = TextEditingController();

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
                                child: Text(
                                  "Siz kiritgan telfon raqamiro'yxatdan o'tmagan"
                                      "Shu bois, ro'yxatdan o'tish uchun ismingiz va"
                                      "familiangizni kiriting. Qolgan ma'lumotlar ro'yxatdan"
                                      "o'tganingizdan so'ng, shaxsiy kabinetingiz orqali"
                                      "to'ldirishingiz mumkin.",
                                  style: TextStyle(
                                      color: Color.fromRGBO(128, 128, 128, 1),
                                      fontSize: 14
                                  ),
                                )
                            ),
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
                                      controlTextField: txtBoxFirstName,
                                      placeHolder: "Ismingizni kiriting",)
                                ),
                              ),
                            ),
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
                                      controlTextField:txtBoxLastName,
                                      placeHolder: "Familiangizni kiriting",)
                                ),
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
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
                                      onPressed: () async {
                                        await registerUser();
                                      },
                                      child: const Text("Davom etish"),
                                    )
                                )
                            ),
                          ],
                        )
                    ),
                  )
                ],
              ),
              //showLoading()
            ],
          ),
      ),
    );
  }

  Future<void> registerUser() async {
    if (txtBoxFirstName.text.isEmpty || txtBoxLastName.text.isEmpty) {
      AppAlertDialog.showAlert(
        context,
        "Ro'yxatdan o'tish",
        "Iltimos ism yoki familiangizni kiriting",
            () {
          // This callback will be executed after the dialog is dismissed
        },
      );
      return;
    }

    ControlApp? control = ControlApp?.Instance();
    control?.registerUser?.name = '${txtBoxFirstName.text} ${txtBoxLastName.text}';
    LoadingOverlay.show(context);
    ResponseRegister? response = await HttpService.register(data: control?.registerUser);
    LoadingOverlay.hide();

    if (response != null && response.resultCode != null) {
      await AppAlertDialog.showAlert(
        context,
        "Ro'yxatdan o'tish",
        response.resultMsg!, () async {
          if (response.resultCode == Result.SUCCESS_CODE.toString()) {
            if (control?.hasCustomerClicked == true) {

              AppInfo appInfo = AppInfo(
                  phone: control?.registerUser?.phone,
                  name: control?.registerUser?.name,
                  isCustomer: control?.registerUser?.is_customer,
                  isHairdresser: control?.registerUser?.is_hairdresser
              );
              await control?.SetAppInfo(appInfo: appInfo);

              Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(
                    builder: (BuildContext context) => MyMainPage()),
                    (Route<dynamic> route) => false,
              );
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(
                    builder: (BuildContext context) => HairdresserMainPage()),
                    (Route<dynamic> route) => false,
              );
            }
          }
        },
      );
    }
  }
}