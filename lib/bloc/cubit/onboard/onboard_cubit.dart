import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';



part 'onboard_state.dart';

class OnBoardCubit extends Cubit<OnBoardState> {
  OnBoardCubit() : super(OnBoardInitial());
int _pageIndex=0;
  final PageController pageController=PageController();
  final List<String>onboardTitles=['Discover the best property','Ready to move','Let\'s get order'];

  int get pageIndex=>_pageIndex;
    changePageIndex(int index) {
    _pageIndex=index;
      emit(OnBoardPageChanged(index));
  }



}
