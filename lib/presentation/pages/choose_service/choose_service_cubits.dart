
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/constant/control_app.dart';

import '../../../data/models/app_info.dart';
import 'choose_service_state.dart';

class ChooseServiceCubit extends Cubit<ChooseServiceState>{
  ChooseServiceCubit() : super(ChooseServiceState());

}