import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/config/routes/app_routes.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/data/model/global/country_model.dart';
import 'package:qfly/presentation/screens/home/components/countries_screen.dart';
import 'package:qfly/presentation/screens/home/components/filter_view/filter_travelers_view.dart';
import 'package:qfly/presentation/screens/home/components/hotel_search/checkin_view.dart';
import 'package:qfly/presentation/screens/home/components/hotel_search/location_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/home/components/hotel_search/rooms_search_view.dart';
import 'package:qfly/presentation/screens/home/components/hotel_search/users_num_view.dart';
import 'package:qfly/presentation/screens/home/components/where_to_trip_view.dart';
import 'package:qfly/presentation/screens/hotels/select_hotels_screen.dart';
import 'package:qfly/presentation/widgets/bottom_sheet.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';

import '../../../../../constant/assets_manager.dart';

class HotelSearchView extends StatefulWidget {
  final HomeCubit homeCubit;
  const HotelSearchView({super.key, required this.homeCubit});

  @override
  State<HotelSearchView> createState() => _HotelSearchViewState();
}

class _HotelSearchViewState extends State<HotelSearchView> {
  final _formHKey = GlobalKey<FormBuilderState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.homeCubit.searchCountryHandler();
  }

  @override
  Widget build(BuildContext context) {
    ExpansionTileController expansionTileController = ExpansionTileController();

    //double height = isExpanded ? 150 : 100;
    return Column(
      //mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start, //
      children: [
        15.verticalSpace,
        LocationView(),
        widget.homeCubit.isSearchDataLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GestureDetector(
                child: WhereToTripView(
                  homeCubit: widget.homeCubit,
                  text: widget.homeCubit.country.countryName!.isEmpty
                      ? 'Select Country'
                      : widget.homeCubit.country.countryName!,
                ),
                onTap: () => BottomSheetShape(
                  CountriesScreen(
                    homeCubit: widget.homeCubit,
                    isWhereFrom: false,
                  ),
                ).build(context),
              ),
        15.verticalSpace,
        widget.homeCubit.country.countryName!.isNotEmpty &&
                widget.homeCubit.cities.isNotEmpty
            ? widget.homeCubit.isSearchDataLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GestureDetector(
                    child: WhereToTripView(
                      homeCubit: widget.homeCubit,
                      text: widget.homeCubit.city.countryName!.isEmpty
                          ? 'Select City'
                          : widget.homeCubit.city.countryName!,
                    ),
                    onTap: () => BottomSheetShape(
                      CountriesScreen(
                        homeCubit: widget.homeCubit,
                        isWhereFrom: false,
                        isCities: true,
                      ),
                    ).build(context),
                  )
            : GestureDetector(
                child: WhereToTripView(
                  homeCubit: widget.homeCubit,
                  text: widget.homeCubit.city.countryName!.isEmpty
                      ? 'Select City'
                      : widget.homeCubit.city.countryName!,
                ),
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter country first'),
                  ),
                ),
              ),
        14.verticalSpace,
        CheckInView(
          homeCubit: widget.homeCubit,
        ),
        14.verticalSpace,
        RoomsSearchView(
          homeCubit: widget.homeCubit,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // no scrolling
          itemBuilder: (context, index) {
            return ExpansionTile(
              shape: BeveledRectangleBorder(),

              tilePadding: EdgeInsets.all(0),
              childrenPadding: EdgeInsets.all(0),
              initiallyExpanded: true,
              controller: expansionTileController,
              title: Text(
                'Room ${index + 1} -  ${widget.homeCubit.hotelRooms[index].adults}  ${widget.homeCubit.hotelRooms[index].adults == 1 ? 'Adult' : 'Adults'}, ${widget.homeCubit.hotelRooms[index].children} ${widget.homeCubit.hotelRooms[index].children <= 1 ? 'Child' : 'Children'}',
                overflow: TextOverflow.ellipsis,
                style: TextStylesManager.mediumStyle(fontSize: 16.sp),
              ), // expanded ? Text('Room 1') : Text('Room 1 - Adults ${widget.homeCubit.hotelRooms[0].adults}')
              children: [
                SizedBox(
                  height: 150,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.homeCubit.hotelRooms[index].adults > 1
                              ? 'Adults'
                              : 'Adult'),
                          30.horizontalSpace,
                          SizedBox(
                            width: 150,
                            child: Flexible(
                              child: UsersNumPeopleView(
                                room: widget.homeCubit.hotelRooms[index],
                                homeCubit: widget.homeCubit,
                                title: 'Adult',
                                iconPath: ImageAssets.userGroupIcon,
                              ),
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.homeCubit.hotelRooms[index].children > 1
                              ? 'Children'
                              : 'Child'),
                          30.horizontalSpace,
                          SizedBox(
                            width: 150,
                            child: Flexible(
                              child: UsersNumPeopleView(
                                room: widget.homeCubit.hotelRooms[index],
                                homeCubit: widget.homeCubit,
                                title: 'Children',
                                iconPath: ImageAssets.userIcon,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => 1.verticalSpace, //10
          itemCount: widget.homeCubit.rooms,
        ),
        14.verticalSpace,
        RoundedBtn(
          title: 'Search and book!',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectHotelScreen(
                homeCubit: widget.homeCubit,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
