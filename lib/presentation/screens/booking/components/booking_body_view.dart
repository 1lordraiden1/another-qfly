import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/booking/components/availabilty_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/booking/components/confirm_seats_btn_view.dart';
import 'package:qfly/presentation/screens/booking/components/seats_view.dart';
class BookingBodyView extends StatelessWidget {
  const BookingBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AvailabilityView(),
        18.verticalSpace,
        SeatsView(),
        30.verticalSpace,
        ConfirmSeatsBtnView()
      ],
    );
  }
}
