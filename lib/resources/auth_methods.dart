import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart' as model;
import 'package:instagram_flutter/resources/storage_methods.dart';
import 'storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; // get instance of firebase store

//get the data from mobile screen
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!; // gets user from firebase
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap); // gets the snapshop from models.user
  }

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

//add user to our database this is a model
        model.User user = model.User(
          bio: bio,
          username: username,
          uid: cred.user!.uid,
          email: email,
          followers: [],
          following: [],
          photoUrl: photoUrl,
        );
        //add user to our database and sets the user id to firebase uid
        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.toJson(),
            ); //set the data

        //await _firestore
        res = "success";
        print(res);
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error ocurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter correct login information";
      }
      // } on FirebaseAuthException catch (err) {
      //   // if (err.code == ' wrong password') {
      //   //   res = "please enter correct password";
      //   // }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
