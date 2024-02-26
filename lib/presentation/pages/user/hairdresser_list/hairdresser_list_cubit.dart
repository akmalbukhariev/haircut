
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/data/models/service_info.dart';

import '../../../../constant/control_app.dart';
import '../../../../data/dataproviders/http_service.dart';
import '../../../../data/models/hairdresser_detail_info.dart';
import '../../../../data/models/hairdresser_info.dart';
import '../../../../data/models/http_response/response_detail_hairdresser.dart';
import '../../../../data/models/http_response/response_hairdresser.dart';
import '../../../../data/models/http_response/response_order_client.dart';
import '../../../../data/models/my_service.dart';
import '../../../../data/models/user_booked_info.dart';
import '../../dialog_box.dart';
import 'hairdresser_list_state.dart';

class HairdresserListCubit extends Cubit<HairdresserListState> {
  HairdresserListCubit() : super(HairdresserListState(hairdresserInfoList: []));

  Future<void> initPage() async {
    emit(state.copyWith(isLoading: true));
    List<HairdresserInfo> tempList = await getData();
    emit(state.copyWith(isLoading: false, dataList: tempList));
  }

  Future<void> refreshList() async {
    emit(state.copyWith(isLoading: false));
    List<HairdresserInfo> tempList = await getData();
    emit(state.copyWith(dataList: tempList));
  }

  Future<List<HairdresserInfo>> getData() async {
    List<HairdresserInfo> tempList = [];

    ResponseHairdresser? response = await HttpService.getAllHairdresserInfo();
    if (response != null && response.resultData != null) {
      for (HairdresserDetailInfo item in response.resultData!) {
        tempList.add(
            HairdresserInfo(
                image: "images/avatar_3.png",
                starCount: double.parse(item.allScores ?? "0.0"),
                phone: item.phone,
                name: item.name,
                //services: item.services,
                address: item.address,
                profession: item.profession,
                favorate: false
            )
        );
      }
    }
    return tempList;
  }

  Future<void> getDetailData() async {
    emit(state.copyWith(isLoading: true));
    ResponseDetailHairdresser? response = await HttpService
        .getDetailHairdresserInfo(phone: state.selectedItem?.phone ?? '');
    if (response != null && response.resultData != null) {
      HairdresserListState data = state.copyWith(
          isLoading: false,
          detailInfo: response.resultData);

      List<MyService> serviceList = await initServiceList(
          data: response.resultData!);
      List<String>? percentageList = response.resultData?.percentageScore
          ?.split(',');
      double score1 = 0.0;
      double score2 = 0.0;
      double score3 = 0.0;
      double score4 = 0.0;
      double score5 = 0.0;
      if (percentageList?.length == 5) {
        score1 = double.parse(percentageList?[0] ?? "0.0");
        score2 = double.parse(percentageList?[1] ?? "0.0");
        score3 = double.parse(percentageList?[2] ?? "0.0");
        score4 = double.parse(percentageList?[3] ?? "0.0");
        score5 = double.parse(percentageList?[4] ?? "0.0");
      }

      emit(state.copyWith(
          isLoading: false,
          detailInfo: response.resultData,
          serviceList: serviceList,
          score1: score1,
          score2: score2,
          score3: score3,
          score4: score4,
          score5: score5
      ));
    }
  }

  Future<List<MyService>> initServiceList(
      {required HairdresserDetailInfo data}) async {
    List<MyService> result = [];
    if (data.services != null) {
      for (var i = 0; i < data.services!.length; i++) {
        ServiceInfo item = data.services![i];
        String? strColor = ControlApp.Instance()?.formatColorForFlutter(
            item.color ?? "#ffffff");
        if (strColor != null) {
          Color color = Color(int.parse(strColor));
          result.add(MyService(
            no: item.no,
            color: color,
            text: item.name,
            price: item.price,
          ));
        }
      }
    }
    return result;
  }

  void setSelectItem({required int index}) {
    HairdresserInfo item = state.hairdresserInfoList[index];
    emit(state.copyWith(selectedItem: item));
  }

  Future<void> makeAppointment({required BuildContext context}) async {
    emit(state.copyWith(isLoading: true));

    String strServices = "";
    if (state.serviceList != null) {
      for (MyService item in state.serviceList!) {
        if (item.isChecked) {
          strServices += "${item.no!},";
        }
      }
    }

    if (strServices.trim() == "") {
      AppAlertDialog.showAlert(
        context,
        "Buyurtma qilish",
        "Iltimos Xizmat turini tanlang",
            () {
          // This callback will be executed after the dialog is dismissed
        },
      );
      emit(state.copyWith(isLoading: false));
      return;
    }

    UserBookedInfo userInfo = UserBookedInfo(
        userPhone: ControlApp
            .Instance()
            ?.appInfo
            ?.phone,
        hairdresserPhone: state.detailInfo?.phone,
        services: strServices.substring(0, strServices.length - 1),
        date: state.orderTime
    );
    ResponseOrderClient? response = await HttpService.bookClient(
        data: userInfo);
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