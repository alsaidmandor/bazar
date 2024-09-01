import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.initial());


//   image picker
 /* File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void createUserData()
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
