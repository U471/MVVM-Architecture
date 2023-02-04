import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/component/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpSecreen extends StatefulWidget {
  const SignUpSecreen({super.key});

  @override
  State<SignUpSecreen> createState() => _SignUpSecreenState();
}

class _SignUpSecreenState extends State<SignUpSecreen> {
  @override
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                focusNode: emailfocus,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.alternate_email)),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChanged(context, emailfocus, passwordfocus);
                  // FocusScope.of(context).requestFocus(passwordfocus);
                },
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecurepassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      focusNode: passwordfocus,
                      obscureText: _obsecurepassword.value,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_open_outlined),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecurepassword.value =
                                    !_obsecurepassword.value;
                              },
                              child: Icon(_obsecurepassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility))),
                    );
                  }),
              SizedBox(height: height * .1),
              RoundButton(
                title: 'SignUp',
                loading: authViewModel.signUpLoading,
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
                    authViewModel.SignUpApi(data, context);
                    print('Api Hit');
                  }
                },
              ),
              SizedBox(height: height * .02),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                  child: Text("You have an account? Login"))
            ],
          ),
        ));
  }
}
