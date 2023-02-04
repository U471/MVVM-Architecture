import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/color.dart';
import 'package:mvvm_architecture/res/component/round_button.dart';
import 'package:mvvm_architecture/res/constent/app_image_path.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/utils.dart';
import 'package:mvvm_architecture/view/home_secreen.dart';
import 'package:mvvm_architecture/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../res/component/text_field.dart';

class LoginSecreen extends StatefulWidget {
  const LoginSecreen({super.key});

  @override
  State<LoginSecreen> createState() => _LoginSecreenState();
}

class _LoginSecreenState extends State<LoginSecreen> {
  ValueNotifier<bool> _obsecurepassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailfocus = FocusNode();
  FocusNode passwordfocus = FocusNode();
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _obsecurepassword.dispose();
    emailfocus.dispose();
    passwordfocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: height * 0.22,
                  width: width * 0.7,
                  //  color: AppColors.buttonColor,
                  child: Image.asset(
                    splash,
                    fit: BoxFit.cover,
                  )),

              MyLable(title: "Email"),
              SizedBox(height: height * .02),
              MYTextField(
                  textcontroller: _emailController,
                  focustextfield: emailfocus,
                  icon: Icons.alternate_email,
                  focustextfieldnext: passwordfocus),
              SizedBox(height: height * .02),

              MyLable(title: "password"),
              SizedBox(height: height * .02),
              MyPasswordField(
                  passwordcontroller: _passwordController,
                  focuspasswordtextfield: passwordfocus,
                  obsecurepassword: _obsecurepassword),
              // MYTextField(
              //   textcontroller: _passwordController,
              //   focustextfield: passwordfocus,
              //   icon: Icons.lock_open_outlined,
              // ),
              SizedBox(height: height * .02),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Remember me'),
                  InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, RoutesName.signUp);
                        print("forgot page");
                      },
                      child: Row(
                        children: const [
                          Text(
                            "Forgot Password ?",
                            style: TextStyle(
                              color: AppColors.buttonColor,
                            ),
                          )
                        ],
                      ))
                ],
              ),
              SizedBox(height: height * .1),
              RoundButton(
                title: 'Login',
                loading: authViewModel.loading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.FlushbarError(context, "Please enter a email");
                  } else if (_passwordController.text.isEmpty) {
                    Utils.FlushbarError(context, "Please entet a password");
                  } else if (_passwordController.text.length < 6) {
                    Utils.FlushbarError(
                        context, "Please entet 6 digit password");
                  } else {
                    Map data = {
                      "email": _emailController.text.toString(),
                      "password": _passwordController.text.toString(),
                    };
                    authViewModel.loginApi(data, context);
                    print('Api Hit');
                  }
                },
              ),
              SizedBox(height: height * .04),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.signUp);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      MyLable(title: "Don't have an account?"),
                      Text(
                        "Sign up",
                        style: TextStyle(
                          color: AppColors.buttonColor,
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
