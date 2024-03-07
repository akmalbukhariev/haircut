import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/constant/control_app.dart';
import 'package:haircut/data/models/app_info.dart';
import 'package:haircut/presentation/pages/choose_service/choose_service_page.dart';
import 'package:haircut/presentation/pages/user/appointment_list/appointment_list_cubit.dart';
import 'package:haircut/presentation/pages/user/favorite_list/favorite_hairdresser_cubit.dart';
import 'package:haircut/presentation/pages/user/hairdresser_list/hairdresser_list_cubit.dart';
import 'package:haircut/presentation/pages/user/hairdresser_page.dart';
import 'package:haircut/presentation/pages/user/my_main_page.dart';
import 'package:haircut/presentation/pages/user/my_room/my_room_page_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ControlApp? control = await ControlApp.Instance();
  control?.GetAppInfo();

  runApp(const HairCutApp());
}

class HairCutApp extends StatelessWidget{
  const HairCutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[
          BlocProvider(
            create: (context) => HairdresserListCubit(),
          ),
          BlocProvider(
            create: (context) => AppointmentListCubit(),
          ),
          BlocProvider(
            create: (context) => FavoriteHairdresserCubit(),
          ),
          BlocProvider(
            create: (context) => MyRoomPageCubit(),
          ),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: selectPage(),
          )
      )
    );
  }
}

Widget selectPage(){

  Widget widget = ChooseServicePage();
  AppInfo? appInfo = ControlApp.Instance()?.appInfo;
  if(appInfo?.isCustomer == "1" && appInfo?.isHairdresser == "0"){
    widget = MyMainPage();
  }
  else if(appInfo?.isCustomer == "0" && appInfo?.isHairdresser == "1"){
    widget = HairdresserPage();
  }

  return widget;
}
