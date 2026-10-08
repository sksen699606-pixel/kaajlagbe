import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _db = FirebaseFirestore.instance;
  static Stream<User?> get authStateChanges => _auth.authStateChanges();
  static User? get currentUser => _auth.currentUser;

  static Future<void> sendOtp({required String phone, required void Function(String) codeSent}) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (credential) async { await _auth.signInWithCredential(credential); },
      verificationFailed: (e) => throw e,
      codeSent: (id, _) => codeSent(id),
      codeAutoRetrievalTimeout: (_) {},
    );
  }

  static Future<void> verifyOtp(String verificationId, String smsCode) async {
    final credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
    await _auth.signInWithCredential(credential);
  }

  static Future<void> saveRole(String role) async {
    final u = currentUser!;
    await _db.collection('users').doc(u.uid).set({
      'uid': u.uid, 'phone': u.phoneNumber, 'role': role,
      'createdAt': FieldValue.serverTimestamp(), 'isActive': true,
    }, SetOptions(merge: true));
  }

  static Future<String?> getRole() async {
    final u = currentUser; if (u == null) return null;
    final d = await _db.collection('users').doc(u.uid).get();
    return d.data()?['role'] as String?;
  }

  static Future<void> signOut() => _auth.signOut();
}
