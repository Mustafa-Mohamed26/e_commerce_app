import 'package:e_commerce_app/api/models/request/register_request.dart';
import 'package:e_commerce_app/domain/entities/request/register_request_dto.dart';

extension RegisterRequestMapper on RegisterRequestDto {
  RegisterRequest toRegisterRequest() {
    return RegisterRequest(
      password: password,
      email: email,
      rePassword: rePassword,
      phone: phone,
      name: name,
    );
  }
}
