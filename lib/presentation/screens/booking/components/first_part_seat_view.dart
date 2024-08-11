import 'package:flutter/material.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/presentation/screens/booking/components/seat_item_view.dart';
class FirstPartSeatView extends StatelessWidget {
  const FirstPartSeatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: List.generate(5, (index) => SeatItemView(color: primaryColor, title: 'A${index+1}')),
        ),
        Column(
          children: List.generate(5, (index) => SeatItemView(color: primaryColor, title: 'B${index+1}')),
        ),
        Column(
          children: List.generate(5, (index) => SeatItemView(color: primaryColor, title: 'C${index+1}')),
        ),

      ],
    );
  }
}
