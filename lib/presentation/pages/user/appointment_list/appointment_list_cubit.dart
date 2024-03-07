import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant/control_app.dart';
import '../../../../data/dataproviders/http_service.dart';
import '../../../../data/models/booked_info.dart';
import '../../../../data/models/http_response/response_booked_list.dart';
import 'appointment_list_state.dart';

class AppointmentListCubit extends Cubit<AppointmentListState>{
  AppointmentListCubit() : super(AppointmentListState(appointmentList: []));

  Future<void> initPage()async {
    emit(state.copyWith(isLoading: true));
    List<AppointmentInfo> tempList = [];
    tempList = await getAppointmentList() as List<AppointmentInfo>;
    emit(state.copyWith(isLoading: false, appointmentList: tempList));
  }

  Future<void> refreshList() async {
    List<AppointmentInfo> tempList = [];
    tempList = await getAppointmentList() as List<AppointmentInfo>;
    emit(state.copyWith(isLoading: false, appointmentList: tempList));
  }

  Future<List<AppointmentInfo>> getAppointmentList() async {
    List<AppointmentInfo> tempList = [];
    ResponseBookedList? response = await HttpService.getUserBookedList(
        phone: ControlApp
            .Instance()
            ?.appInfo
            ?.phone ?? ""
    );
    if (response != null && response.resultData != null) {
      for (DataInfo item in response.resultData!) {
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
          strServices: item.services ?? "",
          services: colorList,
        ));
      }
    }

    return tempList;
  }
}