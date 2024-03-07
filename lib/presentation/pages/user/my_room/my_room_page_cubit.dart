import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/constant/control_app.dart';
import 'package:haircut/constant/notification.dart';
import 'package:haircut/data/models/user_info.dart';

import '../../../../constant/Result.dart';
import '../../../../constant/language.dart';
import '../../../../data/dataproviders/http_service.dart';
import '../../../../data/models/app_info.dart';
import '../../../../data/models/http_response/response_user_info.dart';
import '../../../widgets/app_alert_dialog.dart';
import '../../choose_service/choose_service_page.dart';
import '../../dialog_box.dart';
import 'my_room_page_state.dart';

class MyRoomPageCubit extends Cubit<MyRoomPageState>{
  MyRoomPageCubit() : super(MyRoomPageState(isLoading: false));

  bool? stateHasChanged = false;

  void initPage() {
    AppInfo? appInfo = ControlApp
        .Instance()
        ?.appInfo!;
    emit(state.copyWith(
      name: appInfo!.name,
      surName: appInfo.surName!,
      phone: appInfo.phone!,
      language: appInfo.language!,
      notification: appInfo.notification!,
    )
    );
  }

  void setName({required String name}){
    stateHasChanged = true;
    emit(state.copyWith(name: name));
  }

  void setSurName({required String surName}){
    stateHasChanged = true;
    emit(state.copyWith(surName: surName));
  }

  void setPhone({required String phone}){
    stateHasChanged = true;
    emit(state.copyWith(phone: phone));
  }

  void setLanguage({required Language language}){
    String strLanguage = enumToLanguageString(language: language);
    stateHasChanged = true;
    emit(state.copyWith(language: strLanguage));
  }

  void setNotification({required NotificationId notification}){
    String strNotification = enumToStringNotification(notification: notification);
    stateHasChanged = true;
    emit(state.copyWith(notification: strNotification));
  }
  
  Future<void> updateUserInfo({required BuildContext context}) async{
    if(stateHasChanged == true) {
      emit(state.copyWith(isLoading: true));
      UserInfo data = UserInfo(
        name: state.name,
        surname: state.surName,
        phone: state.phone,
        language: state.language,
        notification: state.notification
      );
      ResponseUserInfo? response = await HttpService.updateUserInfo(data: data);
      emit(state.copyWith(isLoading: false));
      if (response != null) {
        if (response.resultCode == Result.FAILED_CODE.toString() ||
            response.resultCode == Result.SERVER_ERROR_CODE.toString()) {
          await AppAlertDialog.showAlert(
              context,
              "Shaxsiy kabinet",
              response.resultMsg!, () async {
            Navigator.pop(context);
          }
          );
        }
        else{
          ControlApp.Instance()?.SetAppInfo(
              appInfo: AppInfo(
                phone: data.phone,
                name: data.name,
                surName: data.surname,
                language: data.language,
                notification: data.notification,
                isCustomer: ControlApp.Instance()?.appInfo?.isCustomer,
                isHairdresser: ControlApp.Instance()?.appInfo?.isHairdresser,
              ));
          Navigator.pop(context);
        }
      }else{
        Navigator.pop(context);
      }
    }
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