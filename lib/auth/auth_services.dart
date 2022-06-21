import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthenticationService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  static Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      if (user != null) {
        return user;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
 

  static Future<String> signInWithFacebook() async {
    try {
      final _instance = FacebookAuth.instance;
      final result =
          await _instance.login(permissions: ["email", "public_profile"]);
      print(result.message);
      if (result.status == LoginStatus.success) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        await _auth.signInWithCredential(credential);
        await _instance.getUserData().then((userData) async {
          print(userData);
        });
        return "done";
      } else if (result.status == LoginStatus.cancelled) {
        return "Erro! Login cancel";
      } else {
        return "Erro! no logn";
      }
    } catch (e) {
      return e.toString();
    }
  }

 static  Future<UserCredential> signInWithApple() async {
    String generateNonce([int length = 32]) {
      const charset =
          '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
      final random = Random.secure();
      return List.generate(
          length, (_) => charset[random.nextInt(charset.length)]).join();
    }

    String sha256ofString(String input) {
      final bytes = utf8.encode(input);
      final digest = sha256.convert(bytes);
      return digest.toString();
    }

    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );
    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }
}
