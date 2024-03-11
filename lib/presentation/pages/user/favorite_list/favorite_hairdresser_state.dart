import '../../../../data/models/hairdresser_info.dart';

class FavoriteHairdresserState{
  bool isLoading;
  List<HairdresserInfoForUser> hairdresserInfoList;

  FavoriteHairdresserState({
    this.isLoading = false,
    this.hairdresserInfoList = const [],
  });

  FavoriteHairdresserState copyWith({
    bool? isLoading,
    List<HairdresserInfoForUser>? hairdresserInfoList,
  }){
    return FavoriteHairdresserState(
      isLoading: isLoading ?? this.isLoading,
      hairdresserInfoList: hairdresserInfoList ?? this.hairdresserInfoList,
    );
  }
}