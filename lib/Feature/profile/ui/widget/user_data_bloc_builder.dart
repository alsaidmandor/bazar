import 'package:bazaar/Feature/profile/ui/logic/profile_cubit.dart';
import 'package:bazaar/Feature/profile/ui/widget/profile_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/colors.dart';
import '../../../auhtentication/data/model/user_model.dart';

class UserDataBlocBuilder extends StatelessWidget {
  const UserDataBlocBuilder({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
      current is GetDataUserLoading ||
          current is GetDataUserSuccess ||
          current is GetDataUserError,
      builder: (context, state) {
        return state.maybeWhen(
          getDataUserLoading: () {
            return setupLoading(context) ;
          },
          getDataUserSuccess: (model){
            return setupSuccess(model);
          },
          getDataUserError: (errorHandler) => setupError(),
          orElse: () => setupError(),
        );
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

  Widget setupSuccess(UserModel model) {
    return ProfileBodyWidget(model: model,);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
