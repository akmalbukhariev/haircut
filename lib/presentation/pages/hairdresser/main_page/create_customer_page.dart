
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/presentation/pages/hairdresser/main_page/select_service.dart';
import 'package:haircut/presentation/widgets/tap_animation_widget.dart';

import '../../../widgets/clean_button_textfield.dart';
import '../../loading_overlay.dart';
import 'main_page_cubit.dart';
import 'main_page_state.dart';

class AddCustomerPage extends StatefulWidget{

  @override
  State<AddCustomerPage> createState() => _AddCustomerPage();
}

class _AddCustomerPage extends State<AddCustomerPage> {
  bool light = true;
  DateTime _selectedTime1 = DateTime.now();
  DateTime _selectedTime2 = DateTime.now();

  final TextEditingController controlTextFieldName= TextEditingController();
  final TextEditingController controlTextFieldPhone= TextEditingController();
  final TextEditingController controlTextFieldNote= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Material(
          child:BlocBuilder<MainPageCubit, MainPageState>(
            builder: (context, state){
              return SafeArea(
                child: Stack(
                  children: [
                    Container(
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
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 20,),
                                          createInfo1(state: state),
                                          const SizedBox(height: 20,),
                                          createInfo2(state: state),
                                          const SizedBox(height: 20,),
                                          createInfo3(),
                                        ],
                                      ),
                                    )
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                    if(state.isLoading)
                      LoadingOverlayWidget()
                  ],
                )
              );
            }
          )
        )
    );
  }

  Widget createHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 15, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("images/icon_1.png", width: 30, height: 30,),
          ),
          const Expanded(child: SizedBox()),
          TapAnimationWidget(
              onPressedCallBack: (){
                context.read<MainPageCubit>().createAppointment(
                    context: context,
                    name: controlTextFieldName.text,
                    phone: controlTextFieldPhone.text,
                  note: controlTextFieldNote.text
                );
              },
              tabWidget: const Text("Saqlash",style: TextStyle(color: Colors.red, fontSize: 25),
          )
          )
        ],
      ),
    );
  }

  Widget createInfo1({required MainPageState state}) {
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
                CleanButtonTextField(
                  controlTextField: controlTextFieldName,
                  placeHolder: "Ism",
                ),
                Divider(height: 2, color: Colors.grey,)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              children: [
                CleanButtonTextField(
                  controlTextField: controlTextFieldPhone,
                  placeHolder: "Telfon nomer",
                ),
                Divider(height: 2, color: Colors.grey,),
                //const SizedBox(height: 10,)
              ],
            ),
          ),
          ListTile(
              title: Text("Xizmat turi", style: TextStyle(color: Colors.grey),),
              subtitle: Text(state.strService ?? "",
                overflow: TextOverflow.ellipsis,
              ),
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

  Widget createInfo2({required MainPageState state}) {
    String strStartDate = "${_selectedTime1.day}.${_selectedTime1
        .month}.${_selectedTime1.year}";
    String strStartTime = "${_selectedTime1.hour}:${_selectedTime1
        .minute}";

    String strEndDate = "${_selectedTime2.day}.${_selectedTime2
        .month}.${_selectedTime2.year}";
    String strEndTime = "${_selectedTime2.hour}:${_selectedTime2.minute}";

    state.date = "$strStartDate/$strStartTime - $strEndDate/$strEndTime";

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
                  trailing: Text("${strStartDate}. ${strStartTime}",//'03.01.2023y. 17:30',
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
                      initialDateTime: _selectedTime2,
                      use24hFormat: true,
                      onDateTimeChanged: (DateTime newTime) {
                        setState(() {
                          _selectedTime2 = newTime;
                        });
                      },
                    )
                );
              },
              child: ListTile(
                  title: Text('Tugash vaqti'),
                  trailing: Text("${strEndDate}. ${strEndTime}",
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
            controller: controlTextFieldNote,
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