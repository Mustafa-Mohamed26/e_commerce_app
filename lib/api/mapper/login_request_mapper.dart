import 'package:e_commerce_app/api/models/request/login_request.dart';
import 'package:e_commerce_app/domain/entities/request/login_request_dto.dart';

extension LoginRequestMapper on LoginRequestDto {
  LoginRequest toLoginRequest(){
    return LoginRequest(email: email, password: password);
  }
}