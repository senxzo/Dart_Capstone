import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stressed_out/models/user.dart' as MyUser;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _database = FirebaseFirestore.instance;

User? get currentUser => _auth.currentUser;
  // Sign up with email and password
  Future<String?> signUpWithEmailAndPassword(
      String email, String password, String fullName) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.updateProfile(displayName: fullName);

      // Insert user data into the database
      await _database.collection('users').doc(userCredential.user!.uid).set({
        'fullName': fullName,
        'email': email,
      });

      return null; // return null on success
    } catch (e) {
      // Handle sign-up errors
      print('Error during sign up: $e');
      return e.toString(); // Return the error message
    }
  }

  // Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      // Handle sign-in errors
      print('Error during sign in: $e');
      throw e; // Throw the exception to the calling code
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      // Handle sign-out errors
      print('Error during sign out: $e');
      throw e; // Throw the exception to the calling code
    }
  }

  // Check if a user is signed in
  bool isUserSignedIn() {
    return _auth.currentUser != null;
  }

  Future<MyUser.User> getUserDetails(String uid) async {
    // Fetch user's data from Firestore
    DocumentSnapshot userDoc =
        await _database.collection('users').doc(currentUser?.uid).get();
    /*String? userName = userDoc.get('fullName');
    String? profilePictureUrl;*/
    return MyUser.User(
      username: userDoc.get('fullName').toString(),
      email: userDoc.get('email').toString(),
      gender: userDoc.get('gender').toString(),
      imageUrl: userDoc.get('imageUrl').toString(),
      stressReports: userDoc.get('stressReports'),
      stressLevel: userDoc.get('stressLevel'),
    );
  }
}
