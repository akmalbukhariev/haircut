
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../content_views/child_widgets.dart';
import '../../content_views/clean_button_textfield.dart';
import '../../net/Result.dart';
import '../../net/http_models/response_register.dart';
import '../../net/http_response/register_user.dart';
import '../../net/http_service.dart';
import '../dialog_box.dart';
import '../loading_overlay.dart';

class NamePage extends StatefulWidget{
   NamePage({
    super.key,
    required this.registerUser
  });

  final RegisterUser? registerUser;

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
                                        if(txtBoxFirstName.text.isEmpty ||
                                            txtBoxLastName.text.isEmpty){
                                          AppAlertDialog.showAlert(
                                            context,
                                            "Ro'yxatdan o'tish",
                                            "Iltimos ism yoki familiangizni kiriting",
                                          );
                                          return;
                                        }

                                        widget.registerUser?.name = '${txtBoxFirstName.text} ${txtBoxLastName.text}';
                                        LoadingOverlay.show(context);
                                        /*Future.delayed(
                                            const Duration(seconds: 5), () {
                                          LoadingOverlay.hide();
                                        });*/
                                        ResponseRegister? response = await HttpService.register(data: widget.registerUser);
                                        LoadingOverlay.hide();

                                        if (response != null && response.resultCode != null) {
                                          if (response.resultCode != Result.SUCCESS_CODE) {
                                            AppAlertDialog.showAlert(
                                              context,
                                              "Ro'yxatdan o'tish",
                                              response.resultMsg!,
                                            );
                                          }
                                        }
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
}