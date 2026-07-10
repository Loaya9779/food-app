import 'package:food_app/features/home/model/meals.dart';

sealed class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final List<Meal> meals;
  HomeSuccessState({required this.meals});
}
 class HomeErrorState extends HomeStates {
  final String error;
  HomeErrorState({required this.error});
}
