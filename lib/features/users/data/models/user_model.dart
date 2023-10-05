import '../../domain/users_domain.dart';

class User extends UserEntity {
  const User(
      {required super.location,
      required super.reputation,
      required super.displayName,
      required super.profileImage,
      required super.userId,
      required super.userType});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      reputation: json['reputation'],
      userType: json['user_type'],
      userId: json['user_id'],
      location: json['location'],
      profileImage: json['profile_image'],
      displayName: json['display_name'],
    );
  }

  Map<String, dynamic> toJson() => {
    "user_type": userType,
    "user_id": userId,
    "location": location,
    "reputation": reputation,
    "profile_image": profileImage,
    "display_name": displayName,
  };
}
