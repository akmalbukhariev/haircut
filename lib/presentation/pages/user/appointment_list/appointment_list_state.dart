import '../../../../data/models/booked_info.dart';

class AppointmentListState {
  bool isLoading;
  List<AppointmentInfo>? appointmentList;

  AppointmentListState({
    this.isLoading = false,
    this.appointmentList = const [],
  });

  AppointmentListState copyWith({
    bool? isLoading,
    List<AppointmentInfo>? appointmentList,
}){
    return AppointmentListState(
      isLoading: isLoading ?? this.isLoading,
      appointmentList: appointmentList ?? this.appointmentList,
    );
  }
}