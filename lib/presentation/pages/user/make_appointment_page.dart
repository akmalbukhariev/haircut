
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/constant/control_app.dart';
import 'package:haircut/data/models/hairdresser_detail_info.dart';

import '../../../data/models/my_service.dart';
import '../../widgets/app_alert_dialog.dart';
import '../../widgets/clean_button_textfield.dart';
import '../../widgets/tap_animation_widget.dart';
import '../loading_overlay.dart';
import 'hairdresser_list/hairdresser_list_cubit.dart';
import 'hairdresser_list/hairdresser_list_state.dart';

class MakeAppointmentPage extends StatefulWidget{
  const MakeAppointmentPage({super.key});

  @override
  State<MakeAppointmentPage> createState() => _MakeAppointmentPage();
}

class _MakeAppointmentPage extends State<MakeAppointmentPage>{

  DateTime _selectedStartTime = DateTime.now();
  DateTime _selectedEndTime = DateTime.now();

  late final TextEditingController controlTextField= TextEditingController();

  @override
  void dispose() {
    controlTextField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: BlocBuilder<HairdresserListCubit, HairdresserListState>(
            builder: (context, state) {
              return Material(
                child: SafeArea(
                  child: Container(
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            createHeader(state: state),
                            Expanded(
                              child: Container(
                                  color: const Color.fromRGBO(240, 244, 249, 1),
                                  child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, top: 20, right: 20),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius
                                                      .circular(10)
                                              ),
                                              child: createInfo1(state: state),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, top: 20, right: 20),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius
                                                      .circular(10)
                                              ),
                                              child: createInfo2(state: state),
                                            ),
                                          ),
                                        ],
                                      )
                                  )
                              ),
                            ),
                          ],
                        ),
                        if(state.isLoading)
                          LoadingOverlayWidget()
                    ],)
                  ),
                ),
              );
            }
        )
    );
  }

  Widget createHeader({required HairdresserListState state}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 15, top: 10, bottom: 10),
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
            tabWidget: const Text(
              "Qabulga yozilish",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 25
              ),
            ),
            onPressedCallBack: () async{
              bool? result = await AppAlertDialogYesNo.showAlert(
                context: context,
                title: 'Qabulga yozilish',
                content: 'Davom etishni xohlaysizmi?',
              );
              if (result != null && result) {
                context.read<HairdresserListCubit>().makeAppointment(context: context);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget createInfo1({required HairdresserListState state}) {

    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                CleanButtonTextField(
                  //controlTextField: nameController,
                  placeHolder: ControlApp.Instance()?.appInfo?.name ?? "",
                  isReadOnly: true,
                ),
                const Divider(
                  height: 0.5, color: Color.fromRGBO(167, 167, 167, 1),),
                CleanButtonTextField(
                  //controlTextField: phoneController,
                  placeHolder: ControlApp.Instance()?.appInfo?.phone ?? "",
                  isReadOnly: true,
                ),
                const Divider(
                  height: 0.5, color: Color.fromRGBO(167, 167, 167, 1),),
              ],
            )
        ),
        ExpansionTile(
            title: const Text(
              "Xizmat turlari",
              style: TextStyle(
                color: Color.fromRGBO(102, 102, 102, 1),
                fontWeight: FontWeight.normal,
                fontSize: 17,
              ),
            ),
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.serviceList?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.only(left: 15, right: 20),
                        child: itemService(service: state.serviceList![index])
                    );
                  },
                ),
              ),
            ]
        ),
      ],
    );
  }

  Widget createInfo2({required HairdresserListState state}) {
    String strStartDate = "${_selectedStartTime.day}.${_selectedStartTime
        .month}.${_selectedStartTime.year}";
    String strStartTime = "${_selectedStartTime.hour}:${_selectedStartTime
        .minute}";

    String strEndDate = "${_selectedEndTime.day}.${_selectedEndTime
        .month}.${_selectedEndTime.year}";
    String strEndTime = "${_selectedEndTime.hour}:${_selectedEndTime.minute}";

    state.orderTime = "$strStartDate/$strStartTime - $strEndDate/$strEndTime";

    return Column(
      children: [
        createDateTime(title: "Boshlanish vaqti", time1: strStartDate, time2: strStartTime, isStartDate: true),
        const Padding(
          padding: EdgeInsets.only(left: 15,),
          child: Divider(height: 0.5, color: Color.fromRGBO(167, 167, 167, 1),),
        ),
        createDateTime(title: "Tugash vaqti", time1: strEndDate, time2: strEndTime )
      ],
    );
  }

  Widget createDateTime({required String title, required String time1, required String time2, bool isStartDate = false}){
    return ExpansionTile(
      title: Text(title,
        style: TextStyle(color: Color.fromRGBO(102, 102, 102, 1)),),
      trailing: SizedBox(
        width: 140,
        child: Row(
          children: [
            Text(time1,
              style: const TextStyle(color: Color.fromRGBO(17, 138, 178, 1)),),
            const SizedBox(width: 7,),
            Text(time2,
              style: const TextStyle(color: Color.fromRGBO(17, 138, 178, 1),fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      children: [
        SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              itemExtent: 50,
              mode: CupertinoDatePickerMode.dateAndTime,
              initialDateTime: isStartDate? _selectedStartTime : _selectedEndTime,
              use24hFormat: true,
              onDateTimeChanged: (DateTime newTime) {
                setState(() {
                  if(isStartDate){
                    _selectedStartTime = newTime;
                  }
                  else{
                    _selectedEndTime = newTime;
                  }
                });
              },
            )
        ),
      ],
    );
  }

  Widget itemService({required MyService service}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          service.isChecked = !service.isChecked;
        });
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: service.color,//service.isChecked ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                    ),
                    child: service.isChecked
                        ? Icon(Icons.check, color: Colors.white, size: 12)
                        : null,
                  ),
                  const SizedBox(width: 10),
                  createText(text: service.text ?? ""),
                ],
              ),
              createText(text: service.price ?? ""),
            ],
          ),
          SizedBox(height: 5),
          Container(height: 1, color: const Color.fromRGBO(240, 240, 240, 1)),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget createText({required String text, FontWeight fontWeight = FontWeight.normal,Color color = const Color.fromRGBO(102, 102, 102, 1),textOverflow = TextOverflow.ellipsis}) {
    return Text(text,
      overflow: textOverflow,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 17),
    );
  }
}