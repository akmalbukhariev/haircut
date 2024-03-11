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
    List<HairdresserInfoForUser> tempList = [];
    tempList = await getFavoriteList() as List<HairdresserInfoForUser>;
    emit(state.copyWith(isLoading: false, hairdresserInfoList: tempList));
  }

  Future<void> refreshFavoriteList() async {
    List<HairdresserInfoForUser> tempList = [];
    tempList = await getFavoriteList() as List<HairdresserInfoForUser>;
    emit(state.copyWith(isLoading: false, hairdresserInfoList: tempList));
  }

  Future<List<HairdresserInfoForUser>> getFavoriteList() async {
    List<HairdresserInfoForUser> tempList = [];
    ResponseFavoriteHairdresser? response = await HttpService.getAllFavoriteHairdresser(
        phone: ControlApp
            .Instance()
            ?.appInfo
            ?.phone ?? ""
    );
    if (response != null && response.resultData != null) {
      for (FavoriteInfo item in response.resultData!) {
        tempList.add(
            HairdresserInfoForUser(
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