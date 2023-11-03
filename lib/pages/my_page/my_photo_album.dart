import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'content_views/child_widgets.dart';

class MyPhotoAlbumPage extends StatelessWidget {
  const MyPhotoAlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Material(
            child: SafeArea(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      navigationBar(context: context, title: "FotoSuratlar"),
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
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 10),
                                      child: photoGrid(),
                                    ),
                                    const Divider(
                                      height: 1, color: Colors.grey,),
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        color: const Color.fromRGBO(
                                            249, 249, 249, 1),
                                        child: photoNote()
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: saveButton(
                                          col: Colors.red,
                                          onPressedCallBack: (){
                                            Navigator.pop(context);
                                          }
                                      ),
                                    ),
                                    const SizedBox(height: 20,)
                                  ],
                                ),
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                )
            )
        )
    );
  }

  Widget photoGrid(){
    return Column(
      children: [
        rowGrid(),
        const SizedBox(height: 5,),
        rowGrid(),
        const SizedBox(height: 5,),
        rowGridLast()
      ],
    );
  }

  Widget rowGrid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        createRowContainer(),
        const SizedBox(width: 5,),
        createRowContainer(),
        const SizedBox(width: 5,),
        createRowContainer(),
      ],
    );
  }

  Widget rowGridLast() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        createRowContainer(),
        const SizedBox(width: 5,),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(241, 241, 241, 1),
              border: Border.all(color: Colors.grey, width: 1.5),
              borderRadius: BorderRadius.circular(5)
          ),
          width: 100,
          height: 100,
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset("images/upload.png")
          ),
        ),
        const SizedBox(width: 5,),
        Container(
          decoration: BoxDecoration(
              color: Colors.transparent
          ),
          width: 100,
          height: 100,
        )
      ],
    );
  }

  Widget createRowContainer() {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(137, 155, 203, 1),
          border: Border.all(color: Colors.grey, width: 1.5)
      ),
      width: 100,
      height: 100,
    );
  }
}