import 'package:bazaar/Feature/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../auhtentication/data/model/user_model.dart';
import '../../logic/profile_cubit.dart';
import 'my_account_body_widget.dart';

class UpdateProfileBlocListener extends StatelessWidget {
  const UpdateProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
      current is UpdateProfileLoading ||
          current is UpdateProfileSuccess ||
          current is UpdateProfileError,
      builder: (context, state) {
        return state.maybeWhen(
          updateProfileLoading: () => setupLoading(context),
          updateProfileSuccess: () => setupSuccess(),
          updateProfileError:(error) => setupError() ,
          orElse: () => setupError(),);
      },
    );
  }
  setupLoading(context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.primary500,
      ),
    );
  }

  Widget setupSuccess() {
    return const ProfileScreen();
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
