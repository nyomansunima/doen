import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doen/core/models/user_account.dart';
import 'package:doen/core/service/user_account_service.dart';
import 'package:image_picker/image_picker.dart';

class UserAccountViewModel extends ChangeNotifier {
  // Define the initialize
  String emailError;
  String passwordEror;
  bool isSuccess = false;
  UserAccountService _userAccountService = UserAccountService();
  ImagePicker _imagePicker = ImagePicker();
  UserAccount userAccount;
  File imageProfile;

  Future signInWithEmailPassword(String email, String password) async {
    try {
      // sign user email password credendtial user in firebase

      await _userAccountService
          .signInWithEmailPassword(email, password)
          .then((credential) {
        // save data user local
        _userAccountService.saveUserIdLocal(credential.user.uid);
      });

      // define error and success callback
      this.emailError = null;
      this.passwordEror = null;
      this.isSuccess = true;

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        this.emailError = "Sorry, no user found for this email";
      } else {
        this.emailError = null;
      }
      if (e.code == "wrong-password") {
        this.passwordEror = "Please type the correct password";
      } else {
        this.passwordEror = null;
      }
      this.isSuccess = false;
      notifyListeners();
    }
  }

  Future signInWithGoogle() async {
    try {
      await _userAccountService.signInWithGoogle().then((googleAccount) async {
        await _userAccountService
            .signUpWithCredential(googleAccount)
            .then((credential) {
          // save data user to local
          _userAccountService.saveUserIdLocal(credential.user.uid);

          // handling callback
          this.isSuccess = true;
          notifyListeners();
        });
      }).catchError((onError) {
        this.isSuccess = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      print(e.message);
      this.isSuccess = false;
      notifyListeners();
    }
  }

  /*
   * 
   * section for signup
   */
  Future signUpWithEmailPassword(
      String email, String password, String fullName) async {
    try {
      // create user email password credendtial user in firebase
      await _userAccountService
          .signUpWithEmailPassword(email, password)
          .then((credential) async {
        try {
          // create the object account
          userAccount = UserAccount(
            email: email,
            fullName: fullName,
            password: password,
          );
          // create data to firestore
          _userAccountService.createById(userAccount, credential.user.uid);

          // save data to local
          _userAccountService.saveUserIdLocal(credential.user.uid);
        } on FirebaseAuthException catch (e) {
          print(e.message);
        }
      });

      // create error handle and success fallback
      this.emailError = null;
      this.passwordEror = null;
      this.isSuccess = true;

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        this.passwordEror = "Sorry, your provide password is too weak.";
      } else {
        this.passwordEror = null;
      }
      if (e.code == "email-already-in-use") {
        this.emailError = "This email is already used.";
      } else {
        this.emailError = null;
      }
      this.isSuccess = false;
      notifyListeners();
    }
  }

  Future signUpWithGoogle() async {
    try {
      await _userAccountService.signInWithGoogle().then((account) async {
        try {
          await _userAccountService
              .signUpWithCredential(account)
              .then((credential) {
            // create object for firestore
            userAccount = UserAccount(
              email: account.email,
              fullName: account.displayName,
              photoUrl: account.photoUrl,
            );
            // save to firestore
            _userAccountService.createById(
                this.userAccount, credential.user.uid);

            // save data suer local
            _userAccountService.saveUserIdLocal(credential.user.uid);

            // set error handle for callback
            this.isSuccess = true;
            notifyListeners();
          });
        } on FirebaseException catch (e) {
          print(e.message);
          this.isSuccess = false;
          notifyListeners();
        }
      });
    } catch (e) {
      print(e.toString());
      this.isSuccess = false;
      notifyListeners();
    }
  }

  // verification and reset
  Future<bool> forgotPassword(String email) async {
    try {
      await _userAccountService.resetPassword(email);
      this.isSuccess = true;
    } on FirebaseException catch (e) {
      print(e.message);
      this.isSuccess = false;
    }

    return this.isSuccess;
  }

  Stream<UserAccount> streamUser(id) {
    var stream = _userAccountService.stream(id);
    stream.listen(
      (data) {
        this.userAccount = data;
      },
    );
    return stream;
  }

  // upload some profile picture
  Future<File> pickImage(ImageSource imageSource) async {
    PickedFile image;
    try {
      if (imageSource == ImageSource.camera) {
        image = await _imagePicker.getImage(source: ImageSource.camera);
      } else {
        image = await _imagePicker.getImage(source: ImageSource.gallery);
      }
      this.imageProfile = File(image.path);
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
    return this.imageProfile;
  }

  Future<bool> updateProfile(UserAccount userAccount,
      UserAccount newUserAccount, String userId) async {
    try {
      // checking validation for update photo name and url

      if (this.imageProfile != null) {
        // upload new photo
        Map<String, String> data = await _userAccountService.uploadPhotoProfile(
            this.imageProfile, userId);

        newUserAccount.setPhotoName = data["fileName"];
        newUserAccount.setPhotoUrl = data["donwloadUrl"];
      } else {
        newUserAccount.setPhotoUrl = userAccount.photoUrl;
        newUserAccount.setPhotoName = userAccount.photoName;
      }

      // validate for email update
      if (userAccount.email != newUserAccount.email) {
        _userAccountService.changeEmail(newUserAccount.email);
      }

      // validate for password update
      if (userAccount.password != newUserAccount.password) {
        _userAccountService.updatePassword(newUserAccount.password);
      }
      // set photourl for new UserAccount
      await _userAccountService.update(newUserAccount, userId);

      // set sucess
      this.isSuccess = true;
      notifyListeners();
    } on FirebaseException catch (e) {
      print(e.message);

      // set unsuccess
      this.isSuccess = false;
      notifyListeners();
    }

    return this.isSuccess;
  }

  Future signOut() async {
    _userAccountService.signOut();
    _userAccountService.signOutGoogle();

    // clear local data user
    _userAccountService.deleteUserId();
  }
}
