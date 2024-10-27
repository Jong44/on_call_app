import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_call_app/app/models/ResponModel.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<ResponModel> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        if (result.user!.emailVerified) {
          final ress = ResponModel(
            status: 'success',
            message: 'Login successful',
            data: result.user,
          );
          return ress;
        } else {
          final ress = ResponModel(
            status: 'failed',
            message: 'Email belum diverifikasi',
            data: result.user,
          );
          return ress;
        }
      } else {
        final ress = ResponModel(
          status: 'failed',
          message: 'Login gagal',
          data: result.user,
        );
        return ress;
      }
    } catch (e) {
      final ress = ResponModel(
        status: 'failed',
        message: e.toString(),
        data: null,
      );
      return ress;
    }
  }

  Future<ResponModel> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        final ress = ResponModel(
          status: 'success',
          message: 'Register successful',
          data: result.user,
        );
        return ress;
      } else {
        final ress = ResponModel(
          status: 'failed',
          message: 'Register failed',
          data: result.user,
        );
        return ress;
      }
    } on FirebaseAuthException catch (e) {
      var ress = ResponModel(
        status: 'failed',
        message: '',
        data: null,
      );
      switch (e.code) {
        case 'email-already-in-use':
          ress = ResponModel(
            status: 'failed',
            message: 'Email sudah digunakan',
            data: null,
          );
          break;
        case 'weak-password':
          ress = ResponModel(
            status: 'failed',
            message: 'Password terlalu lemah',
            data: null,
          );
          break;
        case 'invalid-email':
          ress = ResponModel(
            status: 'failed',
            message: 'Email tidak valid',
            data: null,
          );
          break;
        case 'operation-not-allowed':
          ress = ResponModel(
            status: 'failed',
            message: 'Operasi tidak diizinkan',
            data: null,
          );
          break;
        case 'too-many-requests':
          ress = ResponModel(
            status: 'failed',
            message: 'Terlalu banyak request',
            data: null,
          );
          break;
        case 'network-request-failed':
          ress = ResponModel(
            status: 'failed',
            message: 'Koneksi internet bermasalah',
            data: null,
          );
          break;
        default:
          ress = ResponModel(
            status: 'failed',
            message: e.toString(),
            data: null,
          );
          break;
      }
      return ress;
    }
  }

  Future emailVerification() async {
    try {
      final user = _firebaseAuth.currentUser;
      await user!.sendEmailVerification();
      final ress = ResponModel(
        status: 'success',
        message: 'Email verification sent',
        data: null,
      );
      return ress;
    } on FirebaseAuthException catch (e) {
      var ress = ResponModel(
        status: 'failed',
        message: '',
        data: null,
      );
      switch (e.code) {
        case 'user-not-found':
          ress = ResponModel(
            status: 'failed',
            message: 'User tidak ditemukan',
            data: null,
          );
          break;
        case 'firebase-auth/invalid-credential':
          ress = ResponModel(
            status: 'failed',
            message: 'User dinonaktifkan',
            data: null,
          );
          break;
        case 'user-disabled':
          ress = ResponModel(
            status: 'failed',
            message: 'User dinonaktifkan',
            data: null,
          );
          break;
        case 'too-many-requests':
          ress = ResponModel(
            status: 'failed',
            message: 'Terlalu banyak request',
            data: null,
          );
          break;
        case 'network-request-failed':
          ress = ResponModel(
            status: 'failed',
            message: 'Koneksi internet bermasalah',
            data: null,
          );
          break;
        default:
          ress = ResponModel(
            status: 'failed',
            message: e.toString(),
            data: null,
          );
          break;
      }
      return ress;
    }
  }

  Future signOut() async {
    try {
      await _firebaseAuth.signOut();
      final ress = ResponModel(
        status: 'success',
        message: 'Logout successful',
        data: null,
      );
      return ress;
    } catch (e) {
      final ress = ResponModel(
        status: 'failed',
        message: e.toString(),
        data: null,
      );
      return ress;
    }
  }
}
