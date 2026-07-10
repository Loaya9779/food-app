import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/widgets/custom_text_button.dart';
import 'package:food_app/features/home/cubit/home_cubit.dart';

class TitleList extends StatelessWidget {
  const TitleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Category",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        CustomTextButton(
          title: 'see all',
          onPressed: () => context.read<HomeCubit>().showAllMeals(),
        ),
      ],
    );
  }
}
