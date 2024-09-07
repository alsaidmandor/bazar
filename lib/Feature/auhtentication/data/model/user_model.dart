class UserModel {

  String? id;
  String? name;
  String? email;
  String? address;
  String? phone;
  String? imageUrl;

  UserModel({
     this.id,
     this.name,
     this.email,
     this.address,
     this.phone,
     this.imageUrl,
  });

  // Add a method to convert UserModel to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
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
      id: map['id']?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      address: map['address'] ?? '',
    );
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? address,
    String? phone,
    String? imageUrl,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}