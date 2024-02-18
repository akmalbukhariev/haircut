
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/dataproviders/http_service.dart';
import '../../../../data/models/hairdresser_info.dart';
import '../../../../data/models/http_response/response_hairdresser.dart';
import 'hairdresser_list_state.dart';

class HairdresserListCubit extends Cubit<HairdresserListState>{
  HairdresserListCubit() : super(HairdresserListState(hairdresserInfoList: []));

  Future<void> initPage() async{
    emit(state.copyWith(isLoading: true));
    List<HairdresserInfo> tempList = await getData();
    emit(state.copyWith(isLoading: false, dataList: tempList));
  }

  Future<void> refreshList() async {
    emit(state.copyWith(isLoading: false));
    List<HairdresserInfo> tempList = await getData();
    emit(state.copyWith(dataList: tempList));
  }

  Future<List<HairdresserInfo>> getData() async{
    List<HairdresserInfo> tempList = [];

    ResponseHairdresser? response = await HttpService.getAllHairdresserInfo();
    if (response != null && response.resultData != null) {
      for (HairdresserItem item in response!.resultData!) {
        tempList.add(
            HairdresserInfo(
                image: "images/avatar_3.png",
                starCount: double.parse(item?.averageScore ?? "0.0"),
                phone: item?.phone,
                name: item?.name,
                services: item?.services,
                address: item.address,
                profession: item?.profession,
                favorate: false
            )
        );
      }
    }

    return tempList;
  }
}