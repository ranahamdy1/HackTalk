import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hack_talk/core/helpers/spacing.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/utils/textstyle.dart';
import 'package:hack_talk/core/widgets/button_widget.dart';
import 'package:hack_talk/core/widgets/custom_text_form_feild.dart';
import 'package:hack_talk/features/auth/forgot/forgot_password.dart';
import 'package:hack_talk/features/auth/sign_up/sign_up_screen.dart';
import 'package:hack_talk/features/auth/widgets/divider.dart';
import 'package:hack_talk/features/auth/widgets/rich_text.dart';
import 'package:hack_talk/features/auth/widgets/social_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  bool isObsecuretext = true;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 10.0.h),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset('assets/images/Group 237.png')),
                verticalSpace(16.h),
                Text(
                  AppStrings.welcomBack,
                  style: TextStyles.font24mainBlueColor,
                ),
                Text(AppStrings.please, style: TextStyles.font11black),
                verticalSpace(16.h),
                CustomTextFormFeild(
                  lableText: ' email ',
                  hintText: AppStrings.email,
                  kbType: TextInputType.emailAddress,
                  controller: TextEditingController(),
                  onChanged: (value) {},
                ),
                verticalSpace(16.h),
                CustomTextFormFeild(
                  isObscureText: isObsecuretext,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObsecuretext = !isObsecuretext;
                      });
                    },
                    child: Icon(
                      isObsecuretext ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                  lableText: 'password',
                  hintText: AppStrings.password,
                  kbType: TextInputType.visiblePassword,
                  onChanged: (value) {},
                  controller: TextEditingController(),
                ),
                Row(
                  children: [
                    FlutterSwitch(
                      height: 20.0,
                      width: 40.0,
                      padding: 4.0,
                      toggleSize: 15.0,
                      borderRadius: 10.0,
                      activeColor: AppColors.mainBlueColor,
                      value: isSwitched,
                      onToggle: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                    Text(AppStrings.rememberMe, style: TextStyles.font11black),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        AppRoutes.routeTo(context, const ForgotPassword());
                      },
                      child: Text(
                        AppStrings.forgotPassword,
                        style: TextStyles.font11black,
                      ),
                    ),
                  ],
                ),
                verticalSpace(10.h),
                ButtonWidget(
                  AppStrings.login,
                  color: Colors.white,
                  onPressed: () {},
                ),
                verticalSpace(10.h),
                 Center(child: NewToHachTalk(textOne: AppStrings.donothaveanAccount,onTap: (){
                   AppRoutes.routeTo(context, const SignUpScreen());
                 },textTwo: AppStrings.signUp,)),
                verticalSpace(10.h),
                const Div(),
                verticalSpace(10.h),
                const Social_icon()
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
