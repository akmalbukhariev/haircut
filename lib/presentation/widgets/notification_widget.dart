import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/notification.dart';
import 'child_widgets.dart';

class NotificationWidget extends StatefulWidget{
   NotificationWidget({
    super.key,
    required this.onPressedCallBack,
     this.selectedNotification = NotificationId.n_5_minute
  });

  final void Function(NotificationId) onPressedCallBack;
  NotificationId? selectedNotification;

  @override
  State<NotificationWidget> createState() => _NotificationWidget();
}

class _NotificationWidget extends State<NotificationWidget>{
  bool _notificationVisible = false;

  @override
  Widget build(BuildContext context) {
     return Container(
         color: Colors.black.withOpacity(0.5),
         height: MediaQuery
             .of(context)
             .size
             .height,
         child: Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 10, right: 10),
                 child: Container(
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(10)
                     ),
                     height: 500,
                     child: SingleChildScrollView(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const SizedBox(height: 20,),
                           GestureDetector(
                             onTap: () {
                               setState(() {
                                 _notificationVisible = !_notificationVisible;
                               });
                             },
                             child: Center(
                                 child: Container(
                                   decoration: BoxDecoration(
                                       color: Colors.grey,
                                       borderRadius: BorderRadius.circular(10)
                                   ),
                                   width: 100,
                                   height: 5,
                                 )
                             ),
                           ),
                           const SizedBox(height: 10,),
                           const Padding(
                             padding: EdgeInsets.only(left: 20),
                             child: Text("Oldindan xabardor qilish vaqti",
                               style: TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 18
                               ),
                             ),
                           ),
                           const SizedBox(height: 20,),
                           Column(
                             children: [
                               notificationItem(name: "Kerak emas",
                                   notificationId: NotificationId.none),
                               notificationItem(name: "5 daqiqa",
                                   notificationId: NotificationId.n_5_minute),
                               notificationItem(name: "10 daqiqa oldin",
                                   notificationId: NotificationId.n_10_minute),
                               notificationItem(name: "15 daqiqa oldin",
                                   notificationId: NotificationId.n_15_minute),
                               notificationItem(name: "20 daqiqa oldin",
                                   notificationId: NotificationId.n_20_minute),
                               notificationItem(name: "30 daqiqa oldin",
                                   notificationId: NotificationId.n_30_minute),
                               notificationItem(name: "45 daqiqa oldin",
                                   notificationId: NotificationId.n_45_minute),
                               notificationItem(name: "1 soat oldin",
                                   notificationId: NotificationId.n_1_hour),
                               notificationItem(name: "1 soat 30 daqiqa oldin",
                                   notificationId: NotificationId.n_1_30_hour),
                               notificationItem(name: "2 soat oldin",
                                   notificationId: NotificationId.n_2_hour),
                             ],
                           ),
                           const SizedBox(height: 10,),
                           Padding(
                               padding: const EdgeInsets.only(
                                   left: 10, right: 10),
                               child:
                               Center(
                                   child: saveButton(
                                       onPressedCallBack: () {
                                         widget.onPressedCallBack.call(widget.selectedNotification!);
                                       }
                                   )
                               )
                           ),
                         ],
                       ),
                     )
                 ),
               ),
               const SizedBox(height: 20,)
             ])
     );
  }

  Widget notificationItem({String name = "", required NotificationId notificationId}) {
    return Column(
      children: [
        RadioListTile<NotificationId>(
          activeColor: const Color.fromRGBO(17, 138, 178, 1),
          title: Text(name, style: const TextStyle(
              fontSize: 18, color: Color.fromRGBO(102, 102, 102, 1)),),
          value: notificationId,
          groupValue: widget.selectedNotification,
          onChanged: (NotificationId? value) {
            setState(() {
              widget.selectedNotification = value;
            });
          },
        ),
        if(notificationId != NotificationId.n_2_hour)
          const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Divider(
                height: 2, color: Color.fromRGBO(220, 220, 220, 1),)
          )
      ],
    );
  }
}