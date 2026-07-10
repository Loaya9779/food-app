import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/home/cubit/home_cubit.dart';
import 'package:food_app/features/home/cubit/states.dart';
import 'package:food_app/features/home/widgets/item_container.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is HomeErrorState) {
          return Center(
            child: Text(state.error),
          );
        }

        if (state is HomeSuccessState) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
            itemCount: state.meals.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return ItemContainer(
                items: state.meals[index],
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}