import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/terms/components/terms_data_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomAppBarView(title: 'Terms and Conditions'),
        Expanded(child: TermsDataView())
        
      ],),
    );
  }
}
