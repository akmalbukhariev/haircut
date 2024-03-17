
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/presentation/widgets/tap_animation_widget.dart';

import '../../../../data/models/my_service.dart';
import '../../../widgets/child_widgets.dart';
import '../../loading_overlay.dart';
import 'main_page_cubit.dart';
import 'main_page_state.dart';

class SelectServicePage extends StatefulWidget{
  @override
  State<SelectServicePage> createState()  => _SelectServicePage();
}

class _SelectServicePage extends State<SelectServicePage> {

  @override
  void initState() {
    context.read<MainPageCubit>().initServicePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        child: SafeArea(
          child: BlocBuilder<MainPageCubit, MainPageState>(
            builder: (context, state){
              return Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        navigationBar(
                            context: context,
                            title: "Mening xizmatlarim",
                          onPressedCallBack: (){
                            context.read<MainPageCubit>().buildStrService();
                          }
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
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      itemCount: state.serviceList?.length,
                                      itemBuilder: (context, index) =>
                                          Container(
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Color.fromRGBO(
                                                            245, 245, 245, 1))
                                                )
                                            ),
                                            child: TapAnimationWidget(
                                              onPressedCallBack: (){
                                                setState(() {
                                                  state.serviceList![index].isChecked =
                                                      !state.serviceList![index].isChecked;
                                                });
                                              },
                                              tabWidget: ListTile(
                                                  leading: CircleAvatar(
                                                    radius: 17,
                                                    backgroundColor: state.serviceList?[index]
                                                        .color,
                                                  ),
                                                  title: Text(state.serviceList?[index].text ?? "",
                                                    style: const TextStyle(
                                                        color: Colors.grey),),
                                                  trailing: createCheckBox(
                                                      service: state.serviceList![index])
                                              ),
                                            )
                                          )
                                  ),
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  if(state.isLoading)
                    const LoadingOverlayWidget()
                ],
              );
            }
          )
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