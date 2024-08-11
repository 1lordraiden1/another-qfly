import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/currency/components/currency_body_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBarView(title: 'Currency'),
          Expanded(child: CurrencyBodyView())

        ],
      ),
    );
  }
}
