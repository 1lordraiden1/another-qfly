import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/flight/components/destination_item_view.dart';
import 'package:qfly/presentation/screens/flight/components/flight_trip_destination_view.dart';

class FlightDestinationView extends StatelessWidget {
  const FlightDestinationView({super.key, required this.homeCubit});

  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: homeCubit,
      listener: (context, state) {},
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 60.w),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageAssets.flightBgImg,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DestinationItemView(
                destination: homeCubit.airportFrom.name.substring(
                  homeCubit.airportFrom.name.indexOf('-') + 1,
                  homeCubit.airportFrom.name.lastIndexOf('-'),
                ),
                airport: homeCubit.airportFrom.code,
                date: homeCubit.flightDate.toString().substring(0, 10),
                time: homeCubit.flightDate.toString().substring(10, 19),
              ),
              FlightTripDestinationView(
                homeCubit: homeCubit,
              ),
              DestinationItemView(
                destination: homeCubit.airportTo.name.substring(
                  homeCubit.airportTo.name.indexOf('-') + 1,
                  homeCubit.airportTo.name.lastIndexOf('-'),
                ),
                airport: homeCubit.airportTo.code,
              ),
            ],
          ),
        );
      },
    );
  }
}
