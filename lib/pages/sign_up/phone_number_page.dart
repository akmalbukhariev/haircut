
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../content_views/clean_button_textfield.dart';
import '../../net/http_response/register_user.dart';
import '../dialog_box.dart';
import 'authentication_number_page.dart';

class PhoneNumberPage extends StatefulWidget{
  const PhoneNumberPage({super.key});

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
                                      if(txtBoxPhone.text.isEmpty) {
                                        AppAlertDialog.showAlert(
                                          context,
                                          "Ro'yxatdan o'tish",
                                          "Iltimos telfon raqamingizni tekshiring",
                                        );
                                        return;
                                      }
                                      RegisterUser newUser = RegisterUser(
                                        phone: this.txtBoxPhone.text,
                                        name: '',
                                        password: '',
                                        location: '36.1234,126.45762',
                                        is_customer: 1,
                                      );
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                AuthenticationNumberPage(
                                                  registerUser: newUser,
                                                )),
                                      );
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
}