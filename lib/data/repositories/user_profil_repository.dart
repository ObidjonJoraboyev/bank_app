
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../model/network_respons.dart';
import '../model/user_model.dart';

class UserProfileRepository {
  Future<NetworkResponse> addUser(UserModel userModel) async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('users').get();

      List<UserModel> users = querySnapshot.docs
          .map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      bool isExist = false;
      for (var user in users) {
        if (user.email == userModel.email) {
          isExist = true;
        }
      }
      if (isExist == false) {
        await FirebaseFirestore.instance
            .collection('users')
            .add(userModel.toJson())
            .then((docRef) {
          docRef.update({"userId": docRef.id});
        });
        // await FirebaseFirestore.instance
        //     .collection('users')
        //     .doc(documentReference.id)
        //     .update({"userId": documentReference.id});
      }
      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      debugPrint("USER ADD ERROR: $error");
      return NetworkResponse(errorCode: error.code);
    }
  }

  Future<NetworkResponse> updateUser(UserModel userModel) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userModel.userId)
          .update(userModel.toJsonUpdate());

      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorCode: error.code);
    }
  }

  Future<NetworkResponse> deleteUser(String docId) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(docId).delete();

      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorCode: error.code);
    }
  }

  Future<NetworkResponse> getUserByDocId(String docId) async {
    try {
      DocumentSnapshot documentSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(docId).get();

      return NetworkResponse(
        data: UserModel.fromJson(
          documentSnapshot.data() as Map<String, dynamic>,
        ),
      );
    } on FirebaseException catch (error) {
      return NetworkResponse(errorCode: error.code);
    }
  }

  Future<NetworkResponse> getUserByUid(String uid) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where("authUid", isEqualTo: uid)
          .get();

      List<UserModel> users = querySnapshot.docs
          .map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      return NetworkResponse(
          data: users.isEmpty ? UserModel.initial() : users.first);
    } on FirebaseException catch (error) {
      return NetworkResponse(errorCode: error.code);
    }
  }
}
