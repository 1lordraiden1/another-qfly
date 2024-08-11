import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/language/screens/components/language_body_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBarView(title: 'Language'),
          Expanded(child: LanguageBodyView())

        ],
      ),
    );
  }
}
