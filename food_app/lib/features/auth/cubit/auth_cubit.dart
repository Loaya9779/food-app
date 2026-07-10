import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/data_source/firebase_data_source.dart';
import 'package:food_app/features/auth/cubit/states.dart';
import 'package:food_app/features/auth/model/user_model.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  Future<void> signUp(String userName, String email, String password) async {
    emit(AuthLoadingState());
    try {
      await firebaseDataSource.signUp(email, password, userName);
      emit(SignUpSuccessState());
    } catch (e) {
      emit(AuthErrorState(error: e.toString()));
    }
  }

  Future<void> signIn(String email, String password) async {
    emit(AuthLoadingState());
    try {

      UserModel? userModel = await firebaseDataSource.signIn(email, password);
      if (userModel != null) {
              emit(LogInSuccessState(userModel: userModel));

      }
    } catch (e) {
      emit(AuthErrorState(error: e.toString()));
      print("cubit $e");
    }
  }
}
