import 'package:medgemma/models/user_type.dart';

class User {
  final String id;
  final String email;
  final String password;
  final UserType userType;
  final String fullName;
  final String phone;
  final String? profileImage;
  
  User({
    required this.id,
    required this.email,
    required this.password,
    required this.userType,
    required this.fullName,
    required this.phone,
    this.profileImage,
  });
}