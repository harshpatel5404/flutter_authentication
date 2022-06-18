import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

//   static Future<User?> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//           await googleSignIn.signIn();
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount!.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );

//       final UserCredential authResult =
//           await _auth.signInWithCredential(credential);
//       final User? user = authResult.user;
//       print(user);

//       if (user != null) {
//         return user;
//       }
//       return null;
//     } catch (e) {}
//   }
}
