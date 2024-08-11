import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/favorite/components/favorite_body_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBarView(title: 'Favorite'),
          Expanded(child: FavoriteBodyView())


        ],
      ),
    );
  }
}
