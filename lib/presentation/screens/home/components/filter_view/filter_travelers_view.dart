import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/presentation/screens/flight/flight_list_screen.dart';
import 'package:qfly/presentation/screens/home/components/filter_view/filter_option_view.dart';
import 'package:qfly/presentation/screens/home/components/filter_view/header_filter_view.dart';
import 'package:qfly/presentation/widgets/radio_group_view.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_value_view.dart';

class FilterTravelersView extends StatelessWidget {
  const FilterTravelersView({super.key, required this.homeCubit});
  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: homeCubit,
      listener: (context, state) {},
      builder: (context, snapshot) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeaderFilterView(),
            FilterOptionView(
              title: homeCubit.adults > 1 ? 'Adults' : 'Adult',
              limit: ' 12 years >',
              homeCubit: homeCubit,
            ),
            FilterOptionView(
              title: homeCubit.children > 1 ? 'Children' : 'Child',
              limit: ' 12 years > 2 years',
              homeCubit: homeCubit,
            ),
            FilterOptionView(
              title: homeCubit.infant > 1 ? 'Infants' : 'Infant',
              limit: ' > 2 years',
              homeCubit: homeCubit,
            ),
            RadioGroupView(
              homeCubit: homeCubit,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextWithValueView(
                text: 'Direct Flight',
                value: 'value',
                widget: Switch(
                  value: homeCubit.isDirect,
                  onChanged: (value) => homeCubit.handleDirectFlightChanging(
                    value,
                  ),
                ),
              ),
            ),
            30.verticalSpace,
            RoundedBtn(
              title: 'Search',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FlightListScreen(
                    homeCubit: homeCubit,
                  ),
                ),
              ),
            ),
            20.verticalSpace
          ],
        );
      },
    );
  }
}
