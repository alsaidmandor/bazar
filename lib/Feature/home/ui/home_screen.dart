import 'package:bazaar/Feature/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/icon_broken.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        int index = context.read<HomeCubit>().currentIndex;

        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: context.read<HomeCubit>().currentIndex,
              onTap: (index) {
                context.read<HomeCubit>().changeBottom(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Category),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Buy),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Profile),
                  label: 'Profile',
                ),
              ]),
          body: context.read<HomeCubit>().bottomScreens()[index],
        );
      },
    );
  }
}
