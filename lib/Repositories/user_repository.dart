import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dfvue/models/userModel.dart';

class UserProfileService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUserProfile(UserProfile userProfile) async {
    return await _usersCollection.doc(userProfile.uid).set(userProfile.toMap());
  }

  Future<void> updateUserProfile(UserProfile userProfile) async {
    return await _usersCollection
        .doc(userProfile.uid)
        .update(userProfile.toMap());
  }

  Future<UserProfile?> getUserProfile(String uid) async {
    DocumentSnapshot doc = await _usersCollection.doc(uid).get();
    if (doc.exists) {
      return UserProfile.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }
}
