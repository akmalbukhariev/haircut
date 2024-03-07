import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/language.dart';
import 'child_widgets.dart';

class LanguageWidget extends StatefulWidget{
   LanguageWidget({
    super.key,
    required this.onPressedCallBack,
    this.selectlanguage = Language.Uzbek
  });

  final void Function(Language) onPressedCallBack;
  Language? selectlanguage;

  @override
  State<LanguageWidget> createState() => _LanguageWidget();
}

class _LanguageWidget extends State<LanguageWidget>{
  bool _languageVisible = false;

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
                    height: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _languageVisible = !_languageVisible;
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
                          child: Text("Tilni tanlang",
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
                            languageItem(name: "Uzbek",
                                languageId: Language.Uzbek),
                            languageItem(name: "Узбекча",
                                languageId: Language.Uzbek_cyrillic),
                            languageItem(name: "Ruski",
                                languageId: Language.Russian),
                            languageItem(name: "English",
                                languageId: Language.English),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child:
                            Center(
                                child: saveButton(
                                    onPressedCallBack: () {
                                      widget.onPressedCallBack.call(widget.selectlanguage!);
                                    }
                                )
                            )
                        ),
                      ],
                    ),
                  )
              ),
              const SizedBox(height: 20,)
            ]
        )
    );
  }

  Widget languageItem({String name = "", required Language languageId}) {
    return Column(
      children: [
        RadioListTile<Language>(
          activeColor: const Color.fromRGBO(17, 138, 178, 1),
          title: Text(name, style: const TextStyle(
              fontSize: 18, color: Color.fromRGBO(102, 102, 102, 1)),),
          value: languageId,
          groupValue: widget.selectlanguage,
          onChanged: (Language? value) {
            setState(() {
              widget.selectlanguage = value;
            });
          },
        ),
        if(languageId != Language.English)
          const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Divider(
                height: 2, color: Color.fromRGBO(220, 220, 220, 1),)
          )
      ],
    );
  }
}