import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? reputation;
  final String? userType;
  final int? userId;
  final String? location;
  final String? profileImage;
  final String? displayName;

  const UserEntity({required this.reputation, required this.userType, required this.userId, required this.location, required this.profileImage, required this.displayName});



  @override
  List<Object?> get props => [reputation,userId,userType,location,profileImage,displayName];
}
