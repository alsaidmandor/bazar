import 'package:bazaar/Feature/cart/ui/cart_screen.dart';
import 'package:bazaar/Feature/category/ui/category_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/dio_factory.dart';
import '../../category/logic/category_cubit.dart';
import '../../feed/data/apis/feed_api_service.dart';
import '../../feed/data/repo/feed_repo.dart';
import '../../feed/ui/feed_screen.dart';
import '../../profile/ui/profile_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  Dio dio = DioFactory.getDio();

  List<Widget> bottomScreens() => [
        const FeedScreen(),
        BlocProvider(
            create: (context) => CategoryCubit(
                  FeedRepo(
                    FeedApiService(dio),
                  ),
                ),
            child: const CategoryScreen()),
        const CartScreen(),
        const ProfileScreen()
      ];

  int currentIndex = 0;

  void changeBottom(int index) {
    currentIndex = index;
    emit(BottomChanged());
  }
}
