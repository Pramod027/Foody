////import 'package:firebase_auth/firebase_auth.dart';
////import 'package:flutter/cupertino.dart';
////import 'package:google_sign_in/google_sign_in.dart';
////import 'package:workshop/models/user.dart';
////
////class AuthService {
////  static final FirebaseAuth _auth = FirebaseAuth.instance;
////
////  //create user object based on firebase user
////  TheUser _userFromFirebaseUser(User user) {
////    return user != null ? TheUser(uid: user.uid) : null;
////  }
////
////  //auth change user streams
////  //every time user signIn or SignOut we get response every time
////  Stream<TheUser> get user {
////    return _auth.authStateChanges().map(_userFromFirebaseUser);
////  }
////
////  Future SignInAnon() async {
////    try {
////      UserCredential result = await _auth.signInAnonymously();
////      User user = result.user;
////      return _userFromFirebaseUser(user);
////      //custom user object instance is returned
////    } catch (e) {
////      print(e.toString());
////      return null;
////    }
////  }
////
////  Future signOut() async {
////    try {
////      return await _auth.signOut();
////    } catch (e) {
////      print(e.toString());
////      return null;
////    }
////  }
////
////  //Register with email and password
////  Future registerWithEmailAndPassword(String email, String password) async {
////    try {
////      UserCredential result = await _auth.createUserWithEmailAndPassword(
////          email: email, password: password);
////      User user = result.user;
////      return _userFromFirebaseUser(user);
////    } catch (e) {
////      print(e.toString());
////      return null;
////    }
////  }
////
//////signin with email and password
////  Future signInWithEmailAndPassword(String email, String password) async {
////    try {
////      UserCredential result = await _auth.signInWithEmailAndPassword(
////          email: email, password: password);
////      User user = result.user;
////      return _userFromFirebaseUser(user);
////    } catch (e) {
////      print(e.toString());
////      return null;
////    }
////  }
////}
//
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//
//class AuthService {
//  static final FirebaseAuth _auth = FirebaseAuth.instance;
//  static Future<User> signInWithEmailAndPassword(
//      String email, String password) async {
//    try {
//      final res = await _auth.signInWithEmailAndPassword(
//          email: email, password: password);
//      return res.user;
//    } catch (e) {
//      print(e.message);
//      return null;
//    }
//  }
//
//  static Future<User> signUpWithEmailAndPassword(
//      String email, String password) async {
//    try {
//      final res = await _auth.createUserWithEmailAndPassword(
//          email: email, password: password);
//      return res.user;
//    } catch (e) {
//      print(e.message);
//      return null;
//    }
//  }
//
//  static Future<User> signInWithGoogle() async {
//    try {
//      GoogleSignIn googleSignIn = GoogleSignIn();
//      final googleUser = await googleSignIn.signIn();
//      final googleAuth = await googleUser.authentication;
//      final credential = GoogleAuthProvider.credential(
//          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
//      final res = await _auth.signInWithCredential(credential);
//      return res.user;
//    } catch (e) {
//      print(e.message);
//      return null;
//    }
//  }
//
//  static Future signOut() async {
//    try {
//      return await _auth.signOut();
//    } catch (e) {
//      print(e.toString());
//      return null;
//    }
//  }
//}
