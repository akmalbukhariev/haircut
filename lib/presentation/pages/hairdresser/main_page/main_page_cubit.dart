import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/constant/calendar_manager.dart';
import 'package:haircut/constant/control_app.dart';
import 'package:haircut/data/dataproviders/http_service.dart';
import 'package:haircut/data/models/hairdresser_detail_info.dart';
import 'package:haircut/presentation/pages/hairdresser/main_page/main_page_state.dart';

import '../../../../data/models/app_info.dart';
import '../../../../data/models/booked_info.dart';
import '../../../../data/models/hairdresser_booked_client_himself.dart';
import '../../../../data/models/hairdresser_client_book.dart';
import '../../../../data/models/http_response/response_detail_hairdresser.dart';
import '../../../../data/models/http_response/response_hairdresser_booked_clients.dart';
import '../../../../data/models/http_response/response_hairdresser_detail.dart';
import '../../../../data/models/http_response/response_hairdresser_service.dart';
import '../../../../data/models/http_response/response_order_client.dart';
import '../../../../data/models/my_service.dart';
import '../../../widgets/app_alert_dialog.dart';
import '../../choose_service/choose_service_page.dart';
import '../../dialog_box.dart';
import '../../user/hairdresser_list/hairdresser_list_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageState());

  Future<void> initMonthPage() async {
    emit(state.copyWith(isLoading: true));
    List<AppointmentInfo> tempList = [];
    tempList = await getAppointmentList(date: DateTime.now());
    emit(state.copyWith(isLoading: false, appointmentList: tempList,initialDateTime: DateTime.now()));
  }

  Future<void> refreshAppointmentList({required DateTime date}) async {
    emit(state.copyWith(isLoading: true));
    List<AppointmentInfo> tempList = [];
    tempList = await getAppointmentList(date: date);
    emit(state.copyWith(isLoading: false, appointmentList: tempList));
  }

  Future<List<AppointmentInfo>> getAppointmentList({required DateTime date}) async {
    String strDate = "${date.day}.${date.month}.${date.year}";
    List<AppointmentInfo> tempList = [];
    ResponseHairdresserBookedClient? response = await HttpService
        .getHairdresserBookedList(
        data: HairdresserClientBookInfo(
            phone: ControlApp
                .Instance()
                ?.appInfo
                ?.phone ?? "",
            date: strDate
        )
    );
    if (response != null && response.resultData != null) {
      for (HairdresserBookedClient item in response.resultData!) {
        List<String>? strColorList = item.colors?.split(',');
        List<Color> colorList = [];
        for (String strColorItem in strColorList!) {
          String? strColor = ControlApp.Instance()?.formatColorForFlutter(
              strColorItem ?? "#ffffff");
          colorList.add(Color(int.parse(strColor!)));
        }

        tempList.add(AppointmentInfo(
          date: item.date ?? "",
          startTime: item.startTime ?? "",
          endTime: item.endTime ?? "",
          name: item.name ?? "",
          phone: item.phone ?? "",
          strServices: item.services ?? "",
          services: colorList,
        ));
      }
    }

    return tempList;
  }

  Future<void> initServicePage() async {
    emit(state.copyWith(isLoading: true));
    ResponseHairdresserService? response = await HttpService.getHairdresserServices(
        phone: ControlApp
            .Instance()
            ?.appInfo
            ?.phone ?? ""
    );

    List<MyService> tempList = [];
    if (response != null && response.resultData != null){
      for (ServiceInfo item in response.resultData!){
        String? strColor = ControlApp.Instance()?.formatColorForFlutter(
            item.color ?? "#ffffff");
        tempList.add(MyService(
          no: item.no,
          color: Color(int.parse(strColor!)),
            text: item.service!
          //text: "${item.service!}(${item.price!})"
        ));
      }
    }

    emit(state.copyWith(isLoading: false, serviceList: tempList));
  }

  buildStrService(){
    String strService = "";
    String strServiceNo = "";
    for (MyService item in state.serviceList!){
      if(item.isChecked){
        strService += "${item.text!},";
        strServiceNo += "${item.no!},";
      }
    }

    emit(state.copyWith(strServiceNo: strServiceNo, strService: strService));
  }

  updateHeaderDate({required DateTime date}){
    String strDay = date.day.toString();
    String strMonth = CalendarManager().getMonthName(date);
    String strYear = date.year.toString();
    emit(state.copyWith(strDay: strDay, strMonth: strMonth, strYear: strYear, initialDateTime: date));
  }

  Future<void> getDetailData() async {
    emit(state.copyWith(isLoading: true));
    ResponseDetailHairdresser? response = await HttpService.getDetailHairdresserInfo(
        phone: ControlApp.Instance()?.appInfo?.phone ?? ""
    );
    if (response != null && response.resultData != null) {
       emit(state.copyWith(hairdresserDetailInfo: response.resultData));
    }
    emit(state.copyWith(isLoading: false));
  }
  
  Future<void> createAppointment({
    required BuildContext context,
    required String name,
    required String phone,
    String note = ""
  }) async {
    emit(state.copyWith(isLoading: true));
    ResponseOrderClient? response = await HttpService.
    hairdresserBookClient(data:
    HairdresserBookedClientHimSelf(
        hairdresser_phone: ControlApp
            .Instance()
            ?.appInfo
            ?.phone ?? "",
        client_name: name,
        client_phone: phone,
        service: state.strServiceNo,
        date: state.date,
      note: note
    )
    );
    AppAlertDialog.showAlert(
      context,
      "Buyurtma qilish",
      response!.resultMsg!, () {
      emit(state.copyWith(isLoading: false));
      Navigator.pop(context);
    },
    );
  }

  updateDetailHairdresserInfoState({required HairdresserDetailInfo info}){
    emit(state.copyWith(hairdresserDetailInfo: info));
  }

  Future<void> updateDetailHairdresserInfo({required BuildContext context}) async{
    emit(state.copyWith(isLoading: true));
    ResponseHairdresserDetail? response = await HttpService.updateDetailHairdresserInfo(
        data: state.hairdresserDetailInfo
    );
    AppAlertDialog.showAlert(
      context,
      "Buyurtma qilish",
      response!.resultMsg!, () {
      emit(state.copyWith(isLoading: false));
      Navigator.pop(context);
    },
    );
  }

  Future<void> exitApp(BuildContext context) async {
    bool? result = await AppAlertDialogYesNo.showAlert(
      context: context,
      title: 'Shaxsiy kabinet',
      content: 'Haqiqatan chiqmoqchimisiz?',
    );
    if (result != null && result == false) return;

    await ControlApp.Instance()?.SetAppInfo(appInfo: AppInfo());

    await Navigator.pushAndRemoveUntil( context,
      CupertinoPageRoute(builder: (BuildContext context) => ChooseServicePage()),
          (Route<dynamic> route) => false,);
  }
}