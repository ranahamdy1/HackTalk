import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hack_talk/core/helpers/spacing.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/widgets/button_second_widget.dart';
import 'package:hack_talk/core/widgets/button_widget.dart';
import 'package:hack_talk/core/widgets/custom_text_form_feild.dart';
import 'package:hack_talk/features/auth/logic/forget_password/forget_password_cubit/forget_password_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is PasswordSuccessState) {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => VerficationScreen()));
          } else if (state is PasswordFailedState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(state.msg,
                    style: const TextStyle(
                      color: Colors.white,
                    )),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            const CircularProgressIndicator();
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                leading: const BackButton(),
                title: const Text('logo'),
              ),
              body: SafeArea(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextFormFeild(
                          controller: currentPasswordController,
                          hintText: 'Current Password',
                          kbType: TextInputType.visiblePassword,
                          lableText: 'Enter current Password',
                          onChanged: (value) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Current Password must not be empty";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10.h),
                        CustomTextFormFeild(
                          controller: newPasswordController,
                          hintText: 'New Password',
                          kbType: TextInputType.visiblePassword,
                          lableText: 'Enter Your New Password',
                          onChanged: (value) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "New Password must not be empty";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10.h),
                        CustomTextFormFeild(
                          controller: confirmNewPasswordController,
                          hintText: 'Confirm Password',
                          kbType: TextInputType.visiblePassword,
                          lableText: 'Confirm Your Password',
                          onChanged: (value) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Confirm Password must not be empty";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10.h),
                        ButtonWidget(
                          'update password',
                          color: Colors.white,
                          onPressed: () {
                            // AppRoutes.routeTo(context, const LoadScreen());
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<ForgetPasswordCubit>(context)
                                  .changePassword(
                                current_password:
                                    currentPasswordController.text,
                                new_password: newPasswordController.text,
                                new_password_confirmation:
                                    confirmNewPasswordController.text,
                              );
                            }
                          },
                        ),
                        verticalSpace(10.h),
                        ButtonSec(
                          text: AppStrings.cancel,
                          color: AppColors.mainBlueColor,
                          onPressed: () {
                            //AppRoutes.routeTo(context, const VerficationScreen());
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )));
        },
      ),
    );
  }
}