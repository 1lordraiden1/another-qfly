import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/about/components/about_body_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBarView(title: 'FAQs'),
          Expanded(child: AboutBodyView())
        ],
      ),
    );
  }
}
