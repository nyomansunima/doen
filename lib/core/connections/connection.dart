import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseConnection {
  static FirebaseFirestore databaseReference = FirebaseFirestore.instance;
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static StorageReference storageReference = FirebaseStorage().ref();
}

class LocalConnection {
  static Future<SharedPreferences> getPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences;
  }
}
