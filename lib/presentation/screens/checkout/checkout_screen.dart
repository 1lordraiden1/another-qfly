import 'package:flutter/material.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBarView(title: 'Checkout'),

        ],
      ),
    );
  }
}
