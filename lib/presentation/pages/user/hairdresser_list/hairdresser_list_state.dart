
import '../../../../data/models/hairdresser_detail_info.dart';
import '../../../../data/models/hairdresser_info.dart';
import '../../../../data/models/my_service.dart';

class HairdresserListState{
  bool isLoading;
  double? score1;
  double? score2;
  double? score3;
  double? score4;
  double? score5;
  String? orderTime;
  HairdresserInfo? selectedItem;
  HairdresserDetailInfo? detailInfo;
  List<HairdresserInfo> hairdresserInfoList;
  List<MyService>? serviceList;

  HairdresserListState({
    this.isLoading = false,
    this.selectedItem,
    this.detailInfo,
    this.hairdresserInfoList = const [],
    this.serviceList = const [],
    this.orderTime,
    this.score1,
    this.score2,
    this.score3,
    this.score4,
    this.score5
  });

  HairdresserListState copyWith({
    bool? isLoading,
    HairdresserInfo? selectedItem,
    HairdresserDetailInfo? detailInfo,
    List<HairdresserInfo>? dataList,
    List<MyService>? serviceList,
    String? orderTime,
    double? score1,
    double? score2,
    double? score3,
    double? score4,
    double? score5,
}) {
    return HairdresserListState(
      isLoading: isLoading ?? this.isLoading,
      selectedItem: selectedItem ?? this.selectedItem,
      detailInfo: detailInfo ?? this.detailInfo,
      hairdresserInfoList: dataList ?? this.hairdresserInfoList,
      serviceList: serviceList ?? this.serviceList,
      orderTime: orderTime ?? this.orderTime,
      score1: score1 ?? 0.0,
      score2: score2 ?? 0.0,
      score3: score3 ?? 0.0,
      score4: score4 ?? 0.0,
      score5: score5 ?? 0.0,
    );
  }
}