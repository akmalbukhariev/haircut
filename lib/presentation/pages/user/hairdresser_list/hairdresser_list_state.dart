
import '../../../../data/models/hairdresser_detail_info.dart';
import '../../../../data/models/hairdresser_info.dart';

class HairdresserListState{
  bool isLoading;
  HairdresserInfo? selectedItem;
  HairdresserDetailInfo? detailInfo;
  List<HairdresserInfo> hairdresserInfoList;

  HairdresserListState({
    this.isLoading = false,
    this.selectedItem,
    this.detailInfo,
    this.hairdresserInfoList = const []
  });

  HairdresserListState copyWith({
    bool? isLoading,
    HairdresserInfo? selectedItem,
    HairdresserDetailInfo? detailInfo,
    List<HairdresserInfo>? dataList
}) {
    return HairdresserListState(
        isLoading: isLoading ?? this.isLoading,
        selectedItem: selectedItem ?? this.selectedItem,
        detailInfo: detailInfo ?? this.detailInfo,
        hairdresserInfoList: dataList ?? this.hairdresserInfoList
    );
  }
}