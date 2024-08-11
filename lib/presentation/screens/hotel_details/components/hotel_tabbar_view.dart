import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_details_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_review/hotel_reviews_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/hotel_room_details_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
class HotelTabbarView extends StatefulWidget {
  const HotelTabbarView({super.key});

  @override
  State<HotelTabbarView> createState() => _HotelTabbarViewState();
}

class _HotelTabbarViewState extends State<HotelTabbarView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[  TabBar(
        isScrollable: true,
        unselectedLabelColor: grey,
        labelColor: primaryColor,
        tabs: [
          FittedBox(
            child: Tab(
             child: TextWithIconView(iconPath: ImageAssets.detailsIcon,text: 'Details',),

            ),
          ),
          FittedBox(
            child: Tab(
              child: TextWithIconView(iconPath: ImageAssets.roomIcon,text: 'Rooms',),

            ),
          ),
          FittedBox(
            child: Tab(

              child: TextWithIconView(iconPath: ImageAssets.reviewIcon,text: 'Reviews',),

            ),
          ),
        ],
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
        Expanded(
          child: TabBarView(
            children: [
              HotelDetailsView(),
         HotelRoomDetailsView(),
              HotelReviewsView(),
            ],
            controller: _tabController,
          ),
        ),

    ]  );

  }
}
