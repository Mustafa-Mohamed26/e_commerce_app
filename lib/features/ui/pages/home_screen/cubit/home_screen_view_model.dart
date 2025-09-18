import 'package:e_commerce_app/features/ui/pages/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/favorite_tab.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/home_tab/home_tab.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/product_tab.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/user_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel() : super(HomeScreenInitialState());
  // hold data - handle logic - emit state
  int selectedIndex = 0;
  List<Widget> bodyList = [HomeTab(), ProductTab(), FavoriteTab(), UserTab()];

  void bottomNavOnTab(int index) {
    selectedIndex = index;
    emit(ChangeSelectedIndexState());
  }
}