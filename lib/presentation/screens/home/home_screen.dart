import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/data/services/auth_services.dart';
import 'package:qfly/presentation/screens/home/components/home_header_view.dart';
import 'package:qfly/presentation/screens/home/components/hotel_search/hotel_search_view.dart';
import 'package:qfly/presentation/screens/home/components/latest_offers_view.dart';
import 'package:qfly/presentation/screens/home/components/services_view.dart';
import 'package:qfly/presentation/screens/home/components/top_flights_view.dart';
import 'package:qfly/presentation/screens/home/components/trip_details.dart';
import 'package:qfly/utils/media_query_values.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit _homeCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //AuthService().authMe();
    AuthService().getOurAuth();
    _homeCubit = context.read<HomeCubit>();
  }

  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              children: [
                HomeHeaderView(),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ServicesView(),
                      _homeCubit.serviceIndex == 0
                          ? TripDetailsView(
                              homeCubit: _homeCubit,
                            )
                          : HotelSearchView(
                              homeCubit: _homeCubit,
                            ),
                      20.verticalSpace,
                      30.verticalSpace,
                      TopFlightsView(),
                      20.verticalSpace,
                      LatestOfferView(),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
