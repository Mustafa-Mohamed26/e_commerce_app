import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/validators.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController(
    text: "ali dekheel",
  );
  TextEditingController phoneController = TextEditingController(
    text: "01100860890",
  );
  TextEditingController mailController = TextEditingController(
    text: "adasdf@fds.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "15261548@A",
  );
  TextEditingController rePasswordController = TextEditingController(
    text: "15261548@A",
  );
  var formKey = GlobalKey<FormState>();

  /// ✅ flags for showing/hiding passwords
  bool isPasswordVisible = false;
  bool isRePasswordVisible = false;

  void register() async {
    if (formKey.currentState!.validate()) {
      //todo: signup
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 91.h,
                bottom: 10.h,
                left: 97.w,
                right: 97.w,
              ),
              child: Image.asset(AppAssets.appBarLeading),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Full Name", style: AppStyles.medium18White),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            keyboardType: TextInputType.name,
                            hintText: "enter your full name",
                            hintStyle: AppStyles.light18HintText,
                            controller: fullNameController,
                            validate: AppValidators.validateFullName,
                          ),
                          SizedBox(height: 10.h),
                          Text("Mobile Number", style: AppStyles.medium18White),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            keyboardType: TextInputType.phone,
                            hintText: "enter your mobile number",
                            hintStyle: AppStyles.light18HintText,
                            controller: phoneController,
                            validate: AppValidators.validatePhoneNumber,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "E-mail address",
                            style: AppStyles.medium18White,
                          ),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            hintText: "enter your email address",
                            hintStyle: AppStyles.light18HintText,
                            controller: mailController,
                            validate: AppValidators.validateEmail,
                          ),
                          SizedBox(height: 10.h),
                          Text("Password", style: AppStyles.medium18White),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            hintText: "enter your password",
                            hintStyle: AppStyles.light18HintText,
                            controller: passwordController,
                            validate: AppValidators.validatePassword,
                            obscureText: !isPasswordVisible, // ✅
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text("RePassword", style: AppStyles.medium18White),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            hintText: "enter your password again",
                            hintStyle: AppStyles.light18HintText,
                            controller: rePasswordController,
                            validate: (value) {
                              return AppValidators.validateConfirmPassword(
                                value,
                                passwordController.text,
                              );
                            },
                            obscureText: !isRePasswordVisible, // ✅
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isRePasswordVisible = !isRePasswordVisible;
                                });
                              },
                              icon: Icon(
                                isRePasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 35.h),
                            child: CustomElevatedButton(
                              backgroundColor: AppColors.whiteColor,
                              textStyle: AppStyles.semi20Primary,
                              text: "Sign up",
                              onPressed: () {
                                register();
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoutes.loginRoute,
                                );
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      'Already have an account? login',
                                      style: AppStyles.medium18White,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
