import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/booking/components/booking_body_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBarView(title: 'Book a Seat',),
          BookingBodyView()

        ],
      ),
    );
  }
}
