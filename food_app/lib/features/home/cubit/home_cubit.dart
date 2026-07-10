import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/data_source/firebase_data_source.dart';
import 'package:food_app/features/home/cubit/states.dart';
import 'package:food_app/features/home/model/meals.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  FirebaseDataSource firebaseDataSource = FirebaseDataSource();
  List<Meal> meals = [];
  Future<void> getMeals() async {
    emit(HomeLoadingState());
    try {
      meals = await firebaseDataSource.getData();
      emit(HomeSuccessState(meals: meals));
    } catch (e) {
      emit(HomeErrorState(error: e.toString()));
    }
  }

  void filterMeals(String query) {
    emit(HomeLoadingState());
    try {
      List<Meal> filteredMeals = meals.where((value) {
        return value.mealType == query;
      }).toList();
      emit(HomeSuccessState(meals: filteredMeals));
    } catch (e) {
      emit(HomeErrorState(error: e.toString()));
    }
  }

  void showAllMeals() {
  emit(HomeSuccessState(meals: meals));
}
}
