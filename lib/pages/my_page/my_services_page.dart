import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/my_service.dart';
import 'content_views/child_widgets.dart';

final servies = [
  MyService(color: Colors.red, text: "Ukladka(50 000 so'm"),
  MyService(color: Colors.pink, text: "Soch bo'yash"),
  MyService(color: Colors.yellow, text: "Soch olish"),
];

class MyServicesPage extends StatelessWidget {
  const MyServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Stack(
                  children: [
                    navigationBar(
                        context: context, title: "Mening xizmatlarim"),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(
                              "images/icon_10.png", width: 30, height: 30,)
                        )
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: Container(
                    color: const Color.fromRGBO(240, 244, 249, 1),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 30),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: ListView.builder(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            itemCount: servies.length,
                            itemBuilder: (context, index) =>
                                Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Color.fromRGBO(245, 245, 245, 1))
                                    )
                                  ),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 17,
                                      backgroundColor: servies[index].color,
                                    ),
                                    title: Text(servies[index].text,
                                      style: const TextStyle(
                                          color: Colors.grey),),
                                    trailing: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                180, 53, 53, 1),
                                            borderRadius: BorderRadius.circular(
                                                30)
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            "images/delete.png",
                                            width: 20,
                                            height: 20,
                                          ),
                                        )
                                    ),
                                  ),
                                ),
                          )
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}