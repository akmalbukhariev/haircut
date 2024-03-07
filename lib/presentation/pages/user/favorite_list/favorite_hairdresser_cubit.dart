import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/presentation/pages/user/favorite_list/favorite_hairdresser_state.dart';

import '../../../../constant/control_app.dart';
import '../../../../data/dataproviders/http_service.dart';
import '../../../../data/models/hairdresser_info.dart';
import '../../../../data/models/http_response/response_favorite_hairdresser.dart';

class FavoriteHairdresserCubit extends Cubit<FavoriteHairdresserState>{
  FavoriteHairdresserCubit() : super(FavoriteHairdresserState(hairdresserInfoList: []));

  Future<void> initFavoriteList() async {
    emit(state.copyWith(isLoading: true));
    List<HairdresserInfo> tempList = [];
    tempList = await getFavoriteList() as List<HairdresserInfo>;
    emit(state.copyWith(isLoading: false, hairdresserInfoList: tempList));
  }

  Future<void> refreshFavoriteList() async {
    List<HairdresserInfo> tempList = [];
    tempList = await getFavoriteList() as List<HairdresserInfo>;
    emit(state.copyWith(isLoading: false, hairdresserInfoList: tempList));
  }

  Future<List<HairdresserInfo>> getFavoriteList() async {
    List<HairdresserInfo> tempList = [];
    ResponseFavoriteHairdresser? response = await HttpService.getAllFavoriteHairdresser(
        phone: ControlApp
            .Instance()
            ?.appInfo
            ?.phone ?? ""
    );
    if (response != null && response.resultData != null) {
      for (FavoriteInfo item in response.resultData!) {
        tempList.add(
            HairdresserInfo(
                image: "images/avatar_1.png",
                name: item.name,
                profession: item.profession
            )
        );
      }
    }

    return tempList;
  }
}