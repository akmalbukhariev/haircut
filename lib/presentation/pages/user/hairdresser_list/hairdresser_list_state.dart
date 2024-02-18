
import '../../../../data/models/hairdresser_info.dart';

class HairdresserListState{
  bool isLoading;
  List<HairdresserInfo> hairdresserInfoList;

  HairdresserListState({
    this.isLoading = false,
    this.hairdresserInfoList = const []
  });

  HairdresserListState copyWith({
    bool? isLoading,
    List<HairdresserInfo>? dataList
}){
    return HairdresserListState(
      isLoading: isLoading ?? this.isLoading,
      hairdresserInfoList: dataList ?? this.hairdresserInfoList
    );
  }
}