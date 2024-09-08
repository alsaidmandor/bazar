import 'package:bazaar/Feature/auhtentication/data/model/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helper/shared_pref_helper.dart';
import '../../../../core/networking/firebase_result.dart';
import '../../../../core/utils/SharedPrefKeys.dart';
import '../data/repository/profile_repo.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {

  final ProfileRepo _profileRepo ;
  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  // Text Controller
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void getUserData() async {
    emit(const ProfileState.getDataUserLoading());
    try {
      var user = await _profileRepo.getUserData();
      user.when(success: (data) {
        debugPrint('$data');
        emit(ProfileState.getDataUserSuccess( data));
      }, failure: (errorHandler) {
        emit(ProfileState.getDataUserError(error: errorHandler));
      },);
    }catch(error, stacktrace) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
    }
  }

//   image picker
  File? imageFile;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
        imageFile = File(pickedFile.path);
    }
    emit(ProfileState.pickedImage(imageFile: imageFile!));

  }

  void logOutAuthentication()async
  {
    try {
      emit(const ProfileState.logOutLoading());
     await _profileRepo.signOut();
      removeUserUid();
      emit(const ProfileState.logOutSuccess());
    }catch(error,stacktrace ) {
      emit( ProfileState.logOutError(error: error.toString()) );
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
    }

  }
  Future<void> removeUserUid() async {
    await SharedPrefHelper.removeData(SharedPrefKeys.userUid);
  }



  Future<void> updateProfile()
  async {
    emit(const ProfileState.updateProfileLoading());

    try{
      if (imageFile != null)
      {
        // Upload image and get download URL
        String imageUrl =  await _profileRepo.uploadImage(imageFile!);
        UserModel model = UserModel(
          id: _profileRepo.currentUser!.uid,
            name: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
            imageUrl:imageUrl
        );
        print( nameController.text);
        _profileRepo.updateProfile(model);
        emit(const ProfileState.updateProfileSuccess());
      }
    }catch(error, stacktrace) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
      emit( ProfileState.updateProfileError(error: error.toString()) );
    }
  }


/*  void createUserData()
  {
    if (_imageFile != null)  async{
      // Upload image and get download URL
      String imageUrl = await _uploadImageToFirebase(_imageFile!);

      // Create UserModel instance
      UserModel user = UserModel(
        name: _nameController.text,
        email: _emailController.text,
        address: _addressController.text,
        phone: _phoneController.text,
        imageUrl: imageUrl,
      );

      // Save user data to Firestore
      await _saveUserData(user);
    }
  }*/

}
