
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haircut/pages/main_page/select_service.dart';
import 'package:haircut/pages/my_page/my_services_page.dart';

import '../../content_views/clean_button_textfield.dart';

class AddCustomerPage extends StatefulWidget{

  @override
  State<AddCustomerPage> createState()  => _AddCustomerPage();
}

class _AddCustomerPage extends State<AddCustomerPage> {
  bool light = true;
  DateTime _selectedTime1 = DateTime.now();
  DateTime _selectedTime2 = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Material(
          child: SafeArea(
            child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    createHeader(),
                    const SizedBox(height: 20,),
                    Expanded(
                      child: Container(
                        color: const Color.fromRGBO(240, 244, 249, 1),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              const SizedBox(height: 20,),
                              createInfo1(),
                              const SizedBox(height: 20,),
                              createInfo2(),
                              const SizedBox(height: 20,),
                              createInfo3(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
        )
    );
  }

  Widget createHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 15, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("images/icon_1.png", width: 30, height: 30,),
          const Expanded(child: SizedBox()),
          Text("Saqlash",
            style: TextStyle(color: Colors.red, fontSize: 25),
          )
        ],
      ),
    );
  }

  Widget createInfo1() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              children: [
                CleanButtonTextField(placeHolder: "Ism",),
                Divider(height: 2, color: Colors.grey,)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              children: [
                CleanButtonTextField(placeHolder: "Telfon nomer",),
                Divider(height: 2, color: Colors.grey,),
                //const SizedBox(height: 10,)
              ],
            ),
          ),
          ListTile(
              title: Text("Xizmat turi", style: TextStyle(color: Colors.grey),),
              subtitle: Text('Soch olish, Soqol olish,'),
              trailing:
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => SelectServicePage()),
                    );
                  },
                  child: Image.asset(
                    "images/icon_3.png", width: 30, height: 30,)
              )
          )
        ],
      ),
    );
  }

  Widget createInfo2() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            ListTile(
              title: Text("To'liq kun",
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Switch(
                // This bool value toggles the switch.
                value: light,
                activeColor: const Color.fromRGBO(18, 138, 178, 1),
                onChanged: (bool value) {
                  setState(() {
                    light = value;
                  });
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Divider(height: 2, color: Colors.grey,),
            ),
            GestureDetector(
              onTap: () {
                _showDialog(
                    CupertinoDatePicker(
                      itemExtent: 50,
                      mode: CupertinoDatePickerMode.dateAndTime,
                      initialDateTime: _selectedTime1,
                      use24hFormat: true,
                      onDateTimeChanged: (DateTime newTime) {
                        setState(() {
                          _selectedTime1 = newTime;
                        });
                      },
                    )
                );
              },
              child: ListTile(
                  title: Text('Boshlanish vaqti'),
                  trailing: Text('03.01.2023y. 17:30',
                    style: TextStyle(color: Color.fromRGBO(0, 140, 182, 1)),
                  )
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Divider(height: 2, color: Colors.grey,),
            ),
            GestureDetector(
              onTap: () {
                _showDialog(
                    CupertinoDatePicker(
                      itemExtent: 50,
                      mode: CupertinoDatePickerMode.dateAndTime,
                      initialDateTime: _selectedTime1,
                      use24hFormat: true,
                      onDateTimeChanged: (DateTime newTime) {
                        setState(() {
                          _selectedTime1 = newTime;
                        });
                      },
                    )
                );
              },
              child: ListTile(
                  title: Text('Tugash vaqti'),
                  trailing: Text('03.01.2023y. 18:30',
                    style: TextStyle(color: Color.fromRGBO(0, 140, 182, 1)),
                  )
              ),
            ),
          ],
        )
    );
  }

  Widget createInfo3() {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (text) {
              setState(() {});
            },
            decoration: const InputDecoration(
              hintText: "Qo'shimcha ma'lumot",
              border: InputBorder.none,
            )
        )
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}