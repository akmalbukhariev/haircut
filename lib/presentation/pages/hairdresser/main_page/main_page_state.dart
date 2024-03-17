import '../../../../data/models/booked_info.dart';
import '../../../../data/models/my_service.dart';

class MainPageState{
  bool isLoading;
  String? strService;
  String? strServiceNo;
  String? date;
  List<MyService>? serviceList;
  List<AppointmentInfo>? appointmentList;

  MainPageState({
    this.isLoading = false,
    this.strService,
    this.strServiceNo,
    this.date,
    this.serviceList = const [],
    this.appointmentList = const [],
  });

  MainPageState copyWith({
    bool? isLoading,
    String? strService,
    String? strServiceNo,
    String? date,
    List<MyService>? serviceList,
    List<AppointmentInfo>? appointmentList,
  }){
    return MainPageState(
      isLoading: isLoading ?? this.isLoading,
      strService: strService ?? this.strService,
      strServiceNo: strServiceNo ?? this.strServiceNo,
      date: date ?? this.date,
      serviceList: serviceList ?? this.serviceList,
      appointmentList: appointmentList ?? this.appointmentList,
    );
  }
}