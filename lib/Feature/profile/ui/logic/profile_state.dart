part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  ///  Get Data User to show in Profile Screen
  const factory ProfileState.getDataUserLoading() = GetDataUserLoading;
  const factory ProfileState.getDataUserSuccess(UserModel model) = GetDataUserSuccess;
  const factory ProfileState.getDataUserError({required String error}) =GetDataUserError;

  ///  Update Profile
  const factory ProfileState.updateProfileLoading() = UpdateProfileLoading;
  const factory ProfileState.updateProfileSuccess() = UpdateProfileSuccess;
  const factory ProfileState.updateProfileError({required String error}) = UpdateProfileError;

  ///  UpLoad Image
  const factory ProfileState.uploadImageLoading() = UploadImageLoading;
  const factory ProfileState.uploadImageSuccess(String url) = UploadImageSuccess;
  const factory ProfileState.uploadImageError({required String error}) = UploadImageError;

///   logOut
  const factory ProfileState.logOutLoading() = LogOutLoading;
  const factory ProfileState.logOutSuccess() = LogOutSuccess;
  const factory ProfileState.logOutError({required String error}) = LogOutError;



//   picked image file
  const factory ProfileState.pickedImage({required File imageFile}) = PickedImage;
}


