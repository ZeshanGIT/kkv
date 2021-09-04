import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'student_user_service.dart';
import 'teacher_user_service.dart';
import '../common/constants.dart';

class MyAuth {
  static UserCredential? _userCredential;

  static Future<UserCredential?> signInWithGoogle(String selectedRole) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    _userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    if (selectedRole == UserRole.TEACHER)
      TeacherUserService.handleTeacherAuth(_userCredential);
    else
      StudentUserService.handleStudentAuth(_userCredential);

    return _userCredential;
  }

  static void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<GoogleSignInAccount?> signInSilently() async {
    return await GoogleSignIn().signInSilently();
  }
}
