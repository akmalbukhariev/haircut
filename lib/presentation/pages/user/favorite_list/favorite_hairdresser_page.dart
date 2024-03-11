
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/presentation/pages/user/favorite_list/favorite_hairdresser_cubit.dart';
import 'package:haircut/presentation/pages/user/favorite_list/favorite_hairdresser_state.dart';

import '../../../../data/models/hairdresser_info.dart';
import '../../loading_overlay.dart';
import '../hairdresser_list/hairdresser_list_cubit.dart';
import '../hairdresser_list/hairdresser_list_state.dart';

class FavoriteHairdresserPage extends StatefulWidget{
  const FavoriteHairdresserPage({super.key});

  @override
  State<FavoriteHairdresserPage> createState() => _FavoriteHairdresserPage();
}

class _FavoriteHairdresserPage extends State<FavoriteHairdresserPage> {

  @override
  void initState() {
    context.read<FavoriteHairdresserCubit>().initFavoriteList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: BlocBuilder<FavoriteHairdresserCubit, FavoriteHairdresserState>(
          builder: (context,state) {
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
                                          color: const Color.fromRGBO(240, 244, 249, 1),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 20, right: 20),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius
                                                    .circular(10)
                                            ),
                                            child: RefreshIndicator(
                                                onRefresh: context
                                                    .read<FavoriteHairdresserCubit>()
                                                    .refreshFavoriteList,
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    padding: const EdgeInsets
                                                        .all(6),
                                                    itemCount: state.hairdresserInfoList
                                                        .length,
                                                    itemBuilder: (context,
                                                        index) {
                                                      return createItem(
                                                          info: state.hairdresserInfoList[index]);
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
                          ],
                        )
                    )
                )
            );
          },
        )
    );
  }

  Widget createHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 15, top: 10, bottom: 10),
      child: Text("Menga ma'qul bo'lganlar", style: const TextStyle(
          color: Color.fromRGBO(51, 51, 51, 1), fontSize: 20),)
    );
  }

  Widget createItem({required HairdresserInfoForUser info}) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, top: 7, bottom: 7),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.asset(info.image ?? '', width: 50, height: 50,),
          ),
          const SizedBox(width: 10,),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(info.name ?? '', style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),),
                      Image.asset("images/heart.png", width: 20, height: 20,),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Text(info.profession ?? '', style: const TextStyle(
                      color: Color.fromRGBO(121, 121, 121, 1),
                      fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  Container(
                    height: 2,
                    color: Color.fromRGBO(241, 241, 241, 1),
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}