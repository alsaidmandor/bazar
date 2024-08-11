import 'package:bazaar/Feature/cart/ui/cart_screen.dart';
import 'package:bazaar/Feature/category/ui/category_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../feed/ui/feed_screen.dart';
import '../../profile/ui/profile_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Widget> bottomScreens() => [
        const FeedScreen(),
        const CategoryScreen(),
        const CartScreen(),
        const ProfileScreen()
      ];

  int currentIndex = 0;

  void changeBottom(int index) {
    currentIndex = index;
    emit(BottomChanged());
  }
}
