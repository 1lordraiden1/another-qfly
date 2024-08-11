import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/presentation/screens/home/components/flight_item_view.dart';
import 'package:qfly/presentation/widgets/category_header_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopFlightsView extends StatelessWidget {
  const TopFlightsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryHeaderView(title: 'Top Flights'),
        19.verticalSpace,
        SizedBox(
          height: 310.h,
          child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            return ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return FlightItemView(
                  index: index,
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
