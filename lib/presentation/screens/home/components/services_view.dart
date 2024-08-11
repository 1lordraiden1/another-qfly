import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/presentation/screens/home/components/service_item_view.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ServiceItemView(
            serviceIndex: 0,
            title: 'Flight',
            iconPath: ImageAssets.flightIcon,
          ),
         /*  ServiceItemView(
            serviceIndex: 1,
            title: 'Car',
            iconPath: ImageAssets.carIcon,
          ), */
          ServiceItemView(
            serviceIndex: 2,
            title: 'Hotel',
            iconPath: ImageAssets.hotelIcon,
          ),
        ],
      );
    });
  }
}
