import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doen/core/connections/endpoint.dart';
import 'package:doen/core/connections/connection.dart';
import 'package:doen/core/data/all_key.dart';
import 'package:doen/core/models/user_account.dart';
import 'package:doen/core/service/base_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAccountService implements BaseService<UserAccount> {
  CollectionReference _collectionReference;
  Future<SharedPreferences> _sharedPreferences;
  GoogleSignIn _googleSignIn;
  GoogleSignInAuthentication _authentication;
  AuthCredential _credential;
  StorageReference _storageReference;

  UserAccountService() {
    this._collectionReference =
        FirebaseConnection.databaseReference.collection(Endpoint.userAccount);
    this._sharedPreferences = LocalConnection.getPrefs();
    _googleSignIn = GoogleSignIn();
    _storageReference =
        FirebaseConnection.storageReference.child(StorageEndpoint.userAccount);
  }

  @override
  Future<DocumentReference> create(UserAccount entity) async {
    return _collectionReference.add(entity.toJson());
  }

  @override
  Future<void> delete(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() {
    throw UnimplementedError();
  }

  @override
  Future<UserAccount> read(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<UserAccount>> readAll() {
    throw UnimplementedError();
  }

  @override
  Stream<List<UserAccount>> streamAll() {
    throw UnimplementedError();
  }

  Future<void> createById(UserAccount entity, String id) async {
    return _collectionReference.doc(id).set(entity.toJson());
  }

  @override
  Future<void> update(UserAccount entity, String id) async {
    _collectionReference.doc(id).update(entity.toJson());
  }

  Future<void> saveUserIdLocal(String userId) async {
    this._sharedPreferences.then((prefs) {
      prefs.setString(UserKey.userId, userId);
    });
  }

  Future<String> getUserIdLocal() async {
    var _prefs = await _sharedPreferences;
    return _prefs.getString(UserKey.userId);
  }

  Future<void> deleteUserId() async {
    var _prefs = await _sharedPreferences;
    _prefs.setString(UserKey.userId, null);
  }

  @override
  Stream<UserAccount> stream(String id) {
    var _streamController = StreamController<UserAccount>();
    try {
      this
          ._collectionReference
          .doc(id)
          .snapshots(includeMetadataChanges: true)
          .listen((document) {
        _streamController.add(
          UserAccount.fromJson(document.data()),
        );
      });
    } catch (e) {}
    return _streamController.stream.asBroadcastStream();
  }

  // change email and password here
  Future changeEmail(String email) async {
    return FirebaseConnection.firebaseAuth.currentUser.updateEmail(email);
  }

  Future updatePassword(String password) {
    return FirebaseConnection.firebaseAuth.currentUser.updatePassword(password);
  }

  // sign method here
  // signin
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    return FirebaseConnection.firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<GoogleSignInAccount> signInWithGoogle() {
    return _googleSignIn.signIn();
  }

  Future<GoogleSignInAccount> signInGoogleSilently() {
    return _googleSignIn.signInSilently();
  }

  //signup
  Future<UserCredential> signUpWithEmailPassword(
      String email, String password) {
    return FirebaseConnection.firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signUpWithCredential(
      GoogleSignInAccount account) async {
    var userCredential;
    try {
      _authentication = await account.authentication;
      _credential = GoogleAuthProvider.credential(
        accessToken: _authentication.accessToken,
        idToken: _authentication.idToken,
      );

      userCredential = await FirebaseConnection.firebaseAuth
          .signInWithCredential(_credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
    return userCredential;
  }

  // sign out here
  Future signOut() async {
    try {
      FirebaseConnection.firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future signOutGoogle() async {
    try {
      _googleSignIn.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  // verification and reset
  Future<void> resetPassword(String email) {
    return FirebaseConnection.firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // upload & delete photo profile
  Future<Map<String, String>> uploadPhotoProfile(
      File photoFile, String fileName) async {
    // define callback data
    Map<String, String> data = Map<String, String>();

    try {
      final uploadTask = _storageReference
          .child(StorageEndpoint.profile)
          .child(fileName)
          .putFile(photoFile);
      final storageSnapshot = await uploadTask.onComplete;

      String downloadUrl = await storageSnapshot.ref.getDownloadURL();
      String photoName = await storageSnapshot.ref.getName();

      data.putIfAbsent("donwloadUrl", () => downloadUrl);
      data.putIfAbsent("fileName", () => photoName);
    } on FirebaseException catch (e) {
      print(e.message);
    }
    return data;
  }

  Future removePhotoProfile(String fileName) async {
    try {
      _storageReference.child(StorageEndpoint.profile).child(fileName).delete();
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }
}
