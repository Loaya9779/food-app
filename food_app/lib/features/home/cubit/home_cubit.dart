import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/home/cubit/states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
}
