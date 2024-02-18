
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/my_service.dart';
import '../../widgets/child_widgets.dart';

final servies = [
  MyService(color: Colors.red, text: "Ukladka(50 000 so'm"),
  MyService(color: Colors.pink, text: "Soch bo'yash"),
  MyService(color: Colors.yellow, text: "Soch olish"),
];

class SelectServicePage extends StatefulWidget{
  @override
  State<SelectServicePage> createState()  => _SelectServicePage();
}

class _SelectServicePage extends State<SelectServicePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                navigationBar(context: context, title: "Mening xizmatlarim"),
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
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10),
                              itemCount: servies.length,
                              itemBuilder: (context, index) =>
                                  Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color.fromRGBO(
                                                    245, 245, 245, 1))
                                        )
                                    ),
                                    child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 17,
                                          backgroundColor: servies[index]
                                              .color,
                                        ),
                                        title: Text(servies[index].text,
                                          style: const TextStyle(
                                              color: Colors.grey),),
                                        trailing: createCheckBox(
                                            service: servies[index])
                                    ),
                                  )
                          ),
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createCheckBox({required MyService service}){
    return Checkbox(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.5)
      ),
      side: MaterialStateBorderSide.resolveWith(
              (states) => const BorderSide(width: 2.0, color: Color.fromRGBO(17, 138, 178, 1))
      ),
      checkColor: Colors.white,
      value: service.isChecked ?? false,
      activeColor: const Color.fromRGBO(17, 138, 178, 1),
      onChanged: (bool? value) {
        setState(() {
          service.isChecked = value! ?? false;
        });
      },
    );
  }
}