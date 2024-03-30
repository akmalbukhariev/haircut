import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/child_widgets.dart';
import '../../../widgets/clean_button_textfield.dart';
import '../../loading_overlay.dart';
import '../main_page/main_page_cubit.dart';
import '../main_page/main_page_state.dart';

class MyNamePage extends StatefulWidget {
  const MyNamePage({super.key});

  @override
  State<MyNamePage> createState() => _MyNamePage();
}

class _MyNamePage extends State<MyNamePage> {

  final TextEditingController? controlTextField = TextEditingController();

  @override
  void initState() {
    controlTextField?.text = context
        .read<MainPageCubit>()
        .state
        .hairdresserDetailInfo
        ?.name ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Material(
            child: BlocBuilder<MainPageCubit, MainPageState>(
                builder: (context, state) {
                  return SafeArea(
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                navigationBar(
                                    context: context,
                                    title: "Mening Ismim",
                                    onPressedCallBack: () {

                                    }
                                ),
                                const SizedBox(height: 20,),
                                Expanded(
                                    child: Container(
                                      color: const Color.fromRGBO(240, 244, 249, 1),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 20,
                                            bottom: 30),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(
                                                  10)
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: 10),
                                                child: CleanButtonTextField(
                                                  controlTextField: controlTextField,
                                                  placeHolder: "Ismingizni kiriting",
                                                ),
                                              ),
                                              const Divider(
                                                height: 1, color: Colors.grey,),
                                              Container(
                                                  padding: const EdgeInsets.all(10),
                                                  color: const Color.fromRGBO(
                                                      249, 249, 249, 1),
                                                  child: nameNote()
                                              ),
                                              const Expanded(child: SizedBox()),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10),
                                                child: saveButton(
                                                    col: Colors.red,
                                                    onPressedCallBack: () {
                                                      context.read<MainPageCubit>().
                                                      updateDetailHairdresserInfoState(
                                                          info: state
                                                              .hairdresserDetailInfo!
                                                              .copyWith(
                                                              name: controlTextField
                                                                  ?.text
                                                          )
                                                      );
                                                      context.read<MainPageCubit>()
                                                          .updateDetailHairdresserInfo(
                                                          context: context);
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
                          ),
                          if(state.isLoading)
                            const LoadingOverlayWidget()
                        ],
                      )
                  );
                }
            )
        )
    );
  }
}

