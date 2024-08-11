import 'package:flutter/material.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/presentation/screens/booking/components/seat_item_view.dart';
class SecondPartSeatView extends StatelessWidget {
  const SecondPartSeatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: List.generate(5, (index) => SeatItemView(color: primaryColor, title: 'D${index+1}')),
        ),
        Column(
          children: List.generate(5, (index) => SeatItemView(color: primaryColor, title: 'E${index+1}')),
        ),
        Column(
          children: List.generate(5, (index) => SeatItemView(color: primaryColor, title: 'F${index+1}')),
        ),

      ],
    );
  }
}
