import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../presentation/screens/home/home_screen.dart';
import '../../../presentation/screens/notification/notification_screen.dart';
import '../../../presentation/screens/profile/profile_screen.dart';
import '../home/home_cubit.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  final List<Widget> navBarScreens = [
    BlocProvider(create: (_) => HomeCubit(), child: HomeScreen()),
    NotificationScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];
  int pageIndex = 0;
  int childId = 0;
  changePage(int index) {
    pageIndex = index;
    emit(PageIsChanged(index));
  }
}
