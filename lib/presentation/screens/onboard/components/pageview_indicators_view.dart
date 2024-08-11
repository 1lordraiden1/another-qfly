import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/bloc/cubit/onboard/onboard_cubit.dart';
import 'package:qfly/presentation/screens/onboard/components/indicator_view.dart';
class PageViewIndicatorsView extends StatelessWidget {
   PageViewIndicatorsView({super.key});
late OnBoardCubit _onBoardCubit;
  @override
  Widget build(BuildContext context) {
    _onBoardCubit=context.read<OnBoardCubit>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) => IndicatorView(isSelected: index==_onBoardCubit.pageIndex)),
    );
  }
}
