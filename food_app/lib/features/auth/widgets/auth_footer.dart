import 'package:flutter/material.dart';
import 'package:food_app/core/app_color.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.facebook, color: AppColor.iconColor,size: 30,),
        Icon(Icons.apple, color: AppColor.iconColor,size: 30,),
      ],
    );
  }
}
