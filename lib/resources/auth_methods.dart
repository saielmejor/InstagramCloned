import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_flutter/resources/storage_methods.dart';
import 'storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; // get instance of firebase store

  //sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occurred ";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);
        String photoUrl = await StorageMethods().uploadImageToStorage(
            'profilePics', file, false); // gets photoUrl from StorageMethod

        //add user to our database and sets the user id to firebase uid
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl,
        }); //set the data

        //await _firestore
        res = "success";
        print(res);
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
