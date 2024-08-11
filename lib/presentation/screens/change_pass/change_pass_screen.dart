import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/change_pass/components/change_pass_inputs_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
class ChangePassScreen extends StatelessWidget {
  const ChangePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBarView(title: 'Change Password'),
          Expanded(child: ChangePassInputsView())

        ],
      ),
    );
  }
}
