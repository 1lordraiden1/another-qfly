import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/onboard/onboard_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/presentation/screens/onboard/components/onboard_data_view.dart';
import 'package:qfly/presentation/screens/onboard/components/onboard_image_view.dart';

class OnBoardScreen extends StatefulWidget {
  OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late OnBoardCubit _onBoardCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onBoardCubit = context.read<OnBoardCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnBoardCubit, OnBoardState>(
        bloc: OnBoardCubit(),
        builder: (builder, state) {
          return PageView.builder(
            onPageChanged: (int index) {
              _onBoardCubit.changePageIndex(index);
              setState(() {});
            },
            controller: _onBoardCubit.pageController,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Expanded(child: OnBoardImageView(pageIndex: index)),
                  Expanded(child: OnBoardDataView())
                ],
              );
            },
          );
        },
      ),
    );
  }
}
