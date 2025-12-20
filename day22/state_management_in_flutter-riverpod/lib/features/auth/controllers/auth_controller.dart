import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<AsyncValue<void>> {
  AuthController() : super(const AsyncValue.data(null));

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      state = const AsyncValue.data(null);
    } on FirebaseAuthException catch (e) {
      state = AsyncValue.error(_formatFirebaseError(e), StackTrace.current);
    } catch (e) {
      state = AsyncValue.error("Terjadi kesalahan sistem", StackTrace.current);
    }
  }

  // Sign Up dengan Firebase
  Future<void> signUp(String name, String email, String password) async {
    state = const AsyncValue.loading();
    try {
      // Membuat user baru di Firebase
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      
      // Update nama tampilan user
      await userCredential.user?.updateDisplayName(name);
      
      state = const AsyncValue.data(null);
    } on FirebaseAuthException catch (e) {
      state = AsyncValue.error(_formatFirebaseError(e), StackTrace.current);
    } catch (e) {
      state = AsyncValue.error("Gagal mendaftar", StackTrace.current);
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  String _formatFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'Format email tidak valid.';
      case 'user-disabled':
        return 'Pengguna ini telah dinonaktifkan.';
      case 'user-not-found':
        return 'Pengguna tidak ditemukan.';
      case 'wrong-password':
        return 'Password salah.';
      case 'email-already-in-use':
        return 'Email sudah terdaftar.';
      case 'weak-password':
        return 'Password terlalu lemah.';
      case 'invalid-credential':
         return 'Email atau password salah.';
      default:
        return e.message ?? 'Terjadi kesalahan autentikasi.';
    }
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
  return AuthController();
});