
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../content_views/child_widgets.dart';
import '../../content_views/clean_button_textfield.dart';
import '../../models/my_service.dart';

final servies = [
  MyService(color: Colors.red, text: "Ukladka(50 000 so'm"),
  MyService(color: Colors.pink, text: "Soch bo'yash"),
  MyService(color: Colors.yellow, text: "Soch olish"),
];

class MyServicesPage extends StatefulWidget{
  const MyServicesPage({super.key});

  @override
  State<MyServicesPage> createState() =>  _MyServicesPage();
}

class _MyServicesPage extends State<MyServicesPage> {
  bool _colorBoxVisible = false;

  late final TextEditingController controlTextField;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        child: SafeArea(
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
                        Stack(
                          children: [
                            navigationBar(
                                context: context, title: "Mening xizmatlarim"),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _colorBoxVisible =
                                            !_colorBoxVisible;
                                          });
                                        },
                                        child: Image.asset(
                                          "images/icon_10.png", width: 30,
                                          height: 30,)
                                    )
                                )
                            )
                          ],
                        ),
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
                                  child: ListView.builder(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    itemCount: servies.length,
                                    itemBuilder: (context, index) =>
                                        Container(
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Color.fromRGBO(
                                                          245, 245, 245, 1))
                                              )
                                          ),
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              radius: 17,
                                              backgroundColor: servies[index]
                                                  .color,
                                            ),
                                            title: Text(servies[index].text,
                                              style: const TextStyle(
                                                  color: Colors.grey),),
                                            trailing: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        180, 53, 53, 1),
                                                    borderRadius: BorderRadius
                                                        .circular(
                                                        30)
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                    "images/delete.png",
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                )
                                            ),
                                          ),
                                        ),
                                  )
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                animateWidget(
                    widget: createColorBox(), visible: _colorBoxVisible),
              ]
              ,)
        ),
      ),
    );
  }

  Widget animateWidget({required Widget widget, bool visible = false}) {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
        bottom: visible ? 0 : -MediaQuery
            .of(super.context)
            .size
            .height,
        left: 0,
        right: 0,
        child: widget
    );
  }

  Widget createColorBox() {
    return Container(
        color: Colors.black.withOpacity(0.5),
        height: MediaQuery
            .of(super.context)
            .size
            .height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: MediaQuery
                      .of(super.context)
                      .size
                      .height - 180,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _colorBoxVisible = !_colorBoxVisible;
                            });
                          },
                          child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                width: 100,
                                height: 5,
                              )
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text("Yangi xizmat turini qo'shish",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: CleanButtonTextField(
                                controlTextField: this.controlTextField,
                                placeHolder: "Type service name",),
                            ),
                            const Divider(height: 1,),
                            ListTile(
                              leading: createText(text: "Sarflanadigan vaqt"),
                              trailing: Text("daqiqa",
                                style: TextStyle(color: Colors.grey),),
                            ),
                            const Divider(height: 1,),
                            ListTile(
                              leading: createText(text: "Hizmat narxi"),
                              trailing: createDropBox(),
                            ),
                            const Divider(height: 1,),
                            const SizedBox(height: 10,),
                            createColorTable()
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child:
                            Center(
                                child: saveButton(
                                    onPressedCallBack: () {
                                      setState(() {
                                        _colorBoxVisible = !_colorBoxVisible;
                                      });
                                    }
                                )
                            )
                        )
                      ],
                    ),
                  ),
                )
            ),
            const SizedBox(height: 20,)
          ],
        )
    );
  }

  Widget createText({String text = ""}) {
    return Text(text,
      style: TextStyle(color: Color.fromRGBO(167, 167, 167, 1)),
    );
  }

  List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  Widget createDropBox() {
    String? selectedItem = list.first;
    final TextEditingController colorController = TextEditingController();

    return /*DropdownMenu<String>(
      initialSelection: list.first,
      /*inputDecorationTheme: const InputDecorationTheme(
        filled: true,
      ),*/
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          selectedItem = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );*/

      /*DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 3, color: Colors.red)
          )
        ),
          value: selectedItem,
          items: list.map((item) =>
              DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: TextStyle(fontSize: 24),)
              )).toList(),
          onChanged: (item) =>
          {
            setState(() => selectedItem = item),
          }
      );*/

      Container(
          width: 80,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(child: DropdownButton<String>(
            value: selectedItem,
            //icon: const Icon(Icons.arrow_forward_ios, size: 12),
            elevation: 0,
            style: const TextStyle(color: Colors.grey),
            underline: const SizedBox(),
            onChanged: (String? newValue) {},
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          )
      );
  }

  Widget createColorTable(){
    return ColorPicker(
      pickerColor: Colors.red, //default color
      onColorChanged: (Color color){ //on color picked
        print(color);
      },
    );
  }
}