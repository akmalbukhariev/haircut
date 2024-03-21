import '../../../../data/models/booked_info.dart';
import '../../../../data/models/my_service.dart';

class MainPageState{
  bool isLoading;
  String? strDay;
  String? strMonth;
  String? strYear;
  String? strService;
  String? strServiceNo;
  String? date;
  DateTime? initialDateTime;
  List<MyService>? serviceList;
  List<AppointmentInfo>? appointmentList;

  MainPageState({
    this.isLoading = false,
    this.strDay,
    this.strMonth,
    this.strYear,
    this.strService,
    this.strServiceNo,
    this.date,
    this.initialDateTime,
    this.serviceList = const [],
    this.appointmentList = const [],
  });

  MainPageState copyWith({
    bool? isLoading,
    String? strDay,
    String? strMonth,
    String? strYear,
    String? strService,
    String? strServiceNo,
    String? date,
    DateTime? initialDateTime,
    List<MyService>? serviceList,
    List<AppointmentInfo>? appointmentList,
  }){
    return MainPageState(
      isLoading: isLoading ?? this.isLoading,
      strDay: strDay ?? this.strDay,
      strMonth: strMonth ?? this.strMonth,
      strYear: strYear ?? this.strYear,
      strService: strService ?? this.strService,
      strServiceNo: strServiceNo ?? this.strServiceNo,
      date: date ?? this.date,
      initialDateTime: initialDateTime ?? this.initialDateTime,
      serviceList: serviceList ?? this.serviceList,
      appointmentList: appointmentList ?? this.appointmentList,
    );
  }
}