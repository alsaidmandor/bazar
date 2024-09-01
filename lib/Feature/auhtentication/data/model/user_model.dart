class UserModel {
  String name;
  String email;
  String address;
  String phone;
  String imageUrl;

  UserModel({
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.imageUrl,
  });

  // Add a method to convert UserModel to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
      'imageUrl': imageUrl,
    };
  }
  // Method to create a UserModel object from a Firestore document snapshot
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      address: map['address'] ?? '',
    );
  }

}