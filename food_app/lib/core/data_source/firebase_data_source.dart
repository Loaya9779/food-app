import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/features/auth/model/user_model.dart';

class FirebaseDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUp(String email, String password, String username) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel userModel = UserModel(
        email: email,
        name: username,
        id: userCredential.user!.uid,
        favorites: [],
      );

      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userModel.toJson());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<UserModel?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print(userCredential.user!.uid);

      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      print(snapshot.exists);
      print(snapshot.data());

      return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
    } catch (e) {
      print("firebase: $e");
    }
  }
}
