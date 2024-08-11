import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/main/main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/presentation/widgets/app_bar/bottom_nav_bar_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainCubit _mainCubit;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _mainCubit = context.read<MainCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBarView(),
        body: BlocBuilder<MainCubit, MainState>(builder: (context, state) {
          return _mainCubit.navBarScreens[_mainCubit.pageIndex];
        }));
  }
}
