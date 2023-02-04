import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mvvm_architecture/res/color.dart';

import '../../utils/utils.dart';

class MYTextField extends StatelessWidget {
  TextEditingController textcontroller;
  FocusNode? focustextfield;
  FocusNode? focustextfieldnext;
  final IconData? icon;

  MYTextField({
    super.key,
    required this.textcontroller,
    this.focustextfield,
    this.icon,
    this.focustextfieldnext,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
          controller: textcontroller,
          focusNode: focustextfield,
          cursorRadius: Radius.circular(10),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            fillColor: AppColors.backgroundColor,
            filled: true,
            prefixIcon: Icon(icon),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.backgroundColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.backgroundColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onFieldSubmitted: (value) {
            if (focustextfieldnext == null) {
              print("focus filed is null");
            } else {
              Utils.fieldFocusChanged(
                  context, focustextfield!, focustextfieldnext!);
            }

            // FocusScope.of(context).requestFocus(passwordfocus);
          },
        ),
      ),
    ]);
  }
}

class MyLable extends StatelessWidget {
  final String title;
  const MyLable({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: AppColors.textColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class MyPasswordField extends StatelessWidget {
  TextEditingController passwordcontroller;
  ValueNotifier<bool> obsecurepassword;
  FocusNode? focuspasswordtextfield;

  MyPasswordField({
    super.key,
    required this.passwordcontroller,
    required this.focuspasswordtextfield,
    required this.obsecurepassword,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: obsecurepassword,
        builder: (context, value, child) {
          return TextFormField(
            controller: passwordcontroller,
            focusNode: focuspasswordtextfield,
            obscureText: obsecurepassword.value,
            obscuringCharacter: '*',
            decoration: InputDecoration(
                // hintText: 'Password',
                // labelText: 'Password',
                prefixIcon: Icon(Icons.lock_open_outlined),
                suffixIcon: InkWell(
                    onTap: () {
                      obsecurepassword.value = !obsecurepassword.value;
                    },
                    child: Icon(obsecurepassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility))),
          );
        });
  }
}
