import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';


class AuthService {
  final GoogleSignIn _googleSignIn=  GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Observable<FirebaseUser> user;
  Observable<Map<String, dynamic>> profile;
  PublishSubject loading = PublishSubject();

  AuthService() {
    if(_auth.currentUser()!= null) {
      print('Please Sign in');
    } else {
      googleSignIn();
    }

  }
  Future<FirebaseUser> googleSignIn() async{
    loading.add(true);
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("User Name: ${user.displayName}");
    assert(await user.getIdToken() != null);
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
  }

  void SignOut() async{
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
  }
}

final AuthService authService = AuthService();