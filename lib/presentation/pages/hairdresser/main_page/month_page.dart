import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/presentation/pages/hairdresser/main_page/main_page_cubit.dart';

import '../../../../data/models/booked_info.dart';
import '../../loading_overlay.dart';
import 'main_page_state.dart';

class MonthPage extends StatefulWidget{

  @override
  State<MonthPage> createState() => _MonthPage();
}

class _MonthPage extends State<MonthPage> {

  EventController controlTextField = EventController();

  @override
  void initState() {
    context.read<MainPageCubit>().initMonthPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: BlocBuilder<MainPageCubit, MainPageState>(
            builder: (context, state) {
              return SafeArea(
                  child: Stack(
                    children: [
                      Container(
                          color: const Color.fromRGBO(250, 250, 250, 1),
                          child: Column(
                            children: [
                              const SizedBox(height: 10,),
                              createCalendar(),
                              Container(height: 2,
                                color: const Color.fromRGBO(222, 222, 222, 1),),
                              const SizedBox(height: 2,),
                              Container(height: 2,
                                color: const Color.fromRGBO(222, 222, 222, 1),),
                              Container(
                                height: 200,
                                //child: Expanded(
                                child: CustomScrollView(
                                  slivers: [
                                    SliverList(
                                      delegate: SliverChildBuilderDelegate((
                                          BuildContext context, int index) {
                                        final item = state
                                            .appointmentList![index];
                                        return createBookedItem(info: item);
                                      },
                                        childCount: state.appointmentList
                                            ?.length,
                                      ),
                                      //shrinkWrap: true,
                                    ),
                                  ],
                                ),
                                //),
                              )
                            ]
                            ,)
                      ),
                      if(state.isLoading)
                        const LoadingOverlayWidget()
                    ],
                  )
              );
            }
        )
    );
  }

  Widget createCalendar() {
    return Expanded(
        child: CalendarControllerProvider(
            controller: controlTextField,
            child: Scaffold(
              body: MonthView(
                headerStyle: const HeaderStyle(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(250, 250, 250, 1)
                  ),
                  headerTextStyle: TextStyle(
                      color: Color.fromRGBO(17, 138, 178, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 0.0),
                  rightIconVisible: false,
                  leftIconVisible: false,
                ),
                borderColor: const Color.fromRGBO(220, 220, 220, 1),
                borderSize: 1,
                cellAspectRatio: 0.6,
                onEventTap: (event, date) {
                  print(event);
                },
                weekDayBuilder: (int index) {
                  final day = [
                    'Du',
                    'Se',
                    'Ch',
                    'Pa',
                    'Ju',
                    'Sh',
                    'Ya'
                  ];
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(day[index]),
                  );
                },
                headerStringBuilder: (DateTime time,{DateTime? secondaryDate}){
                  return "";
                },
              ),
            )
        )
    );
  }

  Widget createBookedItem({required AppointmentInfo info}) {
    Color serviceColor = info.services.isNotEmpty? info.services[0] : Colors.white;
    double height = 45;
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: height,
              color: const Color.fromRGBO(242, 249, 253, 1),
              child: Column(
                children: [
                  const SizedBox(height: 5,),
                  Text(info.startTime, style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),),
                  //const SizedBox(height: 5,),
                  Text(info.startTime, style: const TextStyle(
                      color: Color.fromRGBO(102, 102, 102, 1),
                      fontWeight: FontWeight.bold),),
                  //const SizedBox(height: 15,)
                ],
              ),
            ),
            Container(width: 5, height: height, color: serviceColor,),
            //createColorBar(info.services),
            const SizedBox(width: 10,),
            Expanded(
                child: SizedBox(
                  height: height,
                  child: Column(
                    children: [
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(info.name,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color.fromRGBO(102, 102, 102, 1)),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(info.phone,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color.fromRGBO(102, 102, 102, 1)),)
                        ],
                      ),
                      //const SizedBox(height: 5,),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(info.strServices,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Color.fromRGBO(102, 102, 102, 1)),)
                      )
                    ],
                  ),
                )
            ),
            const SizedBox(width: 10,)
          ],
        ),
        Container(height: 2, color: Colors.white,),
        Container(height: 2, color: const Color.fromRGBO(241, 241, 241, 1),),
        Container(height: 2, color: Colors.white,),
      ],
    );
  }

  Widget createColorBar(List<Color> colors) {
    return Column(
        children: colors.map((item) =>
        Container(
          width: 5,
          color: item,
        )
    ).toList());
  }
}