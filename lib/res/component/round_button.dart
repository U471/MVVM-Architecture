import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton(
      {super.key,
      required this.title,
      required this.loading,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;

    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: width * .9,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: loading
                ? CircularProgressIndicator(
                    color: AppColors.circolerIndicatorColor,
                  )
                : Text(
                    title,
                    style: TextStyle(color: AppColors.buttonTextColor),
                  )),
      ),
    );
  }
}
