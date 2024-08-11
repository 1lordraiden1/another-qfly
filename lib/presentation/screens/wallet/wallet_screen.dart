import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/wallet/components/wallet_body_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBarView(title: 'Wallet'),
          WalletBodyView()

        ],
      ),
    );
  }
}
