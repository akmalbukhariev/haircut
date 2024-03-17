import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/constant/control_app.dart';
import 'package:haircut/data/dataproviders/http_service.dart';
import 'package:haircut/presentation/pages/hairdresser/main_page/main_page_state.dart';

import '../../../../data/models/booked_info.dart';
import '../../../../data/models/hairdresser_booked_client_himself.dart';
import '../../../../data/models/hairdresser_client_book.dart';
import '../../../../data/models/http_response/response_hairdresser_booked_clients.dart';
import '../../../../data/models/http_response/response_hairdresser_service.dart';
import '../../../../data/models/http_response/response_order_client.dart';
import '../../../../data/models/my_service.dart';
import '../../dialog_box.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageState());

  Future<void> initMonthPage() async {
    emit(state.copyWith(isLoading: true));
    List<AppointmentInfo> tempList = [];
    tempList = await getAppointmentList() as List<AppointmentInfo>;
    emit(state.copyWith(isLoading: false, appointmentList: tempList));
  }

  Future<List<AppointmentInfo>> getAppointmentList() async {
    List<AppointmentInfo> tempList = [];
    ResponseHairdresserBookedClient? response = await HttpService
        .getHairdresserBookedList(
        data: HairdresserClientBookInfo(
            phone: ControlApp
                .Instance()
                ?.appInfo
                ?.phone ?? "",
            date: ""
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
}