
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/presentation/pages/user/appointment_list/appointment_list_state.dart';

import '../../../../data/models/booked_info.dart';
import '../../loading_overlay.dart';
import 'appointment_list_cubit.dart';

class MyAppointmentHistoryPage extends StatefulWidget{
  const MyAppointmentHistoryPage({super.key});

  @override
  State<MyAppointmentHistoryPage> createState() => _MyAppointmentHistoryPage();
}

class _MyAppointmentHistoryPage extends State<MyAppointmentHistoryPage> {

  @override
  void initState() {
    context.read<AppointmentListCubit>().initPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: BlocBuilder<AppointmentListCubit, AppointmentListState>(
            builder: (context, state) {
              return Material(
                  child: SafeArea(
                      child: Container(
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  createHeader(),
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: Container(
                                            color: const Color.fromRGBO(
                                                240, 244, 249, 1),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 20, right: 20),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                //borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: RefreshIndicator(
                                                onRefresh: context
                                                    .read<AppointmentListCubit>()
                                                    .refreshList,
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: state.appointmentList
                                                        ?.length,
                                                    itemBuilder: (context,
                                                        index) {
                                                      return createItem(
                                                          info: state
                                                              .appointmentList![index]);
                                                    }
                                                )
                                              )
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              if(state.isLoading)
                                LoadingOverlayWidget()
                            ],)
                      )
                  )
              );
            }
        )
    );
  }

  Widget createHeader() {
    return Padding(
        padding: const EdgeInsets.only(
            left: 10, right: 15, top: 10, bottom: 10),
        child: Text("Mening buyurtmalarim tarixi", style: const TextStyle(
            color: Color.fromRGBO(51, 51, 51, 1), fontSize: 20),
        )
    );
  }

  Widget createItem({required AppointmentInfo info}) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 10,
              height: 60,
              color: info.services[0],
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(info.name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(102, 102, 102, 1)),),
                            Text(info.date, style: const TextStyle(
                                color: Color.fromRGBO(102, 102, 102, 1)),),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 180,
                              child: Text(info.strServices,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromRGBO(102, 102, 102, 1)),),
                            ),
                            Text("${info.startTime}-${info.endTime}",
                              style: const TextStyle(
                                  color: Color.fromRGBO(102, 102, 102, 1)),),
                          ],
                        ),
                      ],
                    )
                )
            )
          ],
        ),
        Container(
          height: 2,
          color: Color.fromRGBO(241, 241, 241, 1),
        )
        //const Divider(height: 3, color: Color.fromRGBO(241, 241, 241, 1),)
      ],);
  }
}