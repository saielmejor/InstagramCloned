import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_flutter/models/post.dart';
import 'package:instagram_flutter/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String username,
    String profImage,
  ) async {
    String res = ' some error occurred';

    try {
      //return a future string
      String photoUrl =
          await StorageMethods().uploadImageToStorage('post', file, true);
      String postId = const Uuid().v1();
//model for post
      Post post = Post(
          description: description,
          uid: uid,
          postId: postId,
          username: username,
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          profImage: profImage,
          likes: []);
      // you need to to map it to json to store it firebase
      _firestore.collection('post').doc(postId).set(
            post.toJson(),
          );
      res = "sucess";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

// this will control the number of like post
  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      //if likes contains uid
      if (likes.contains(uid)) {
        await _firestore.collection('post').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        }); //remove the uid

      } else {
        await _firestore.collection('post').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        }); //adds uids
      }
    } catch (err) {
      print(
        err.toString(),
      );
    }
  }
}
