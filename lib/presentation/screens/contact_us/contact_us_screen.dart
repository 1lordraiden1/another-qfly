import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/contact_us/components/contact_us_body_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBarView(title: 'Contact Us'),
          Expanded(child: ContactUsBodyView())
        ],
      ),
    );
  }
}
