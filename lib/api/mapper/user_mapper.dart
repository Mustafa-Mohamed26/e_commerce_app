import 'package:e_commerce_app/api/models/response/user.dart';
import 'package:e_commerce_app/domain/entities/response/user_dto.dart';

extension UserMapper on User {
  UserDto toUserDto() {
    return UserDto(name: name, email: email);
  }
}
