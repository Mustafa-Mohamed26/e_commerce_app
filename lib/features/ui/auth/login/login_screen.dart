import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/validators.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController(
    text: "adasdfvv@fds.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "18061717@A",
  );
  var formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false; // ✅ للتحكم في إظهار/إخفاء الباسورد

  void login() {
    if (formKey.currentState!.validate()) {
      //todo: login logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 91.h,
                  bottom: 87.h,
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
                    AutoSizeText(
                      'Welcome Back To Route',
                      style: AppStyles.semi24White,
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      'Please sign in with your mail',
                      style: AppStyles.light16White,
                      maxLines: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("User Name", style: AppStyles.medium18White),
                            SizedBox(height: 10.h),
                            CustomTextFormField(
                              keyboardType: TextInputType.text,
                              hintText: "enter your name",
                              hintStyle: AppStyles.light18HintText,
                              controller: userNameController,
                              validate: AppValidators.validateEmail,
                            ),
                            SizedBox(height: 20.h),
                            Text("Password", style: AppStyles.medium18White),
                            SizedBox(height: 10.h),
                            CustomTextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              hintText: "enter your password",
                              hintStyle: AppStyles.light18HintText,
                              controller: passwordController,
                              validate: AppValidators.validatePassword,
                              obscureText: !isPasswordVisible, // ✅ ربط الفلاج
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
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Forgot Password',
                                style: AppStyles.regular18White,
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 35.h),
                              child: CustomElevatedButton(
                                backgroundColor: AppColors.whiteColor,
                                textStyle: AppStyles.semi20Primary,
                                text: "Login",
                                onPressed: () {
                                  login();
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30.h),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRoutes.registerRoute,
                                  );
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Don’t have an account? Create Account',
                                        style: AppStyles.medium18White,
                                        textAlign: TextAlign.center,
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
      ),
    );
  }
}
