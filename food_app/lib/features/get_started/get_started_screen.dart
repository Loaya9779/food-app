import 'package:flutter/material.dart';
import 'package:food_app/core/app_color.dart';
import 'package:food_app/core/widgets/custom_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/icon/get_started.png"),
            Center(
              child: Text(
                "Help your path to health goals with happiness",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomButton(
              title: "Start",
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                "/login",
                (route) => false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
