import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_endpoints.dart';
import 'package:e_commerce_app/api/models/request/login_request.dart';
import 'package:e_commerce_app/api/models/request/register_request.dart';
import 'package:e_commerce_app/api/models/response/auth_response.dart';
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi()
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @POST(ApiEndpoints.loginApi)
  Future<AuthResponse> login(@Body() LoginRequest loginRequest);

  @POST(ApiEndpoints.registerApi)
  Future<AuthResponse> register(@Body() RegisterRequest registerRequest);
}


