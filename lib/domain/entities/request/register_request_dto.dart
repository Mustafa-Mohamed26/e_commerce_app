class RegisterRequestDto {
  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  RegisterRequestDto({
    this.name,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });
}
