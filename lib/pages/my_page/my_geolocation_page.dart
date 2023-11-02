
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'content_views/child_widgets.dart';
import 'content_views/clean_button_textfield.dart';

class GeoLocationPage extends StatelessWidget {
  const GeoLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          navigationBar(context: context,title: "Geojoylashuv"),
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: const CleanButtonTextField(),
                        ),
                        const Divider(height: 1, color: Colors.grey,),
                        Container(
                            padding: const EdgeInsets.all(10),
                            color: const Color.fromRGBO(249, 249, 249, 1),
                            child: geolocationNote()
                        ),
                        Expanded(child: SizedBox()),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: saveButton(),
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}
