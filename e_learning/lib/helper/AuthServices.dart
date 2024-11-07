import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
   String? fullname;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');


   Future<void> deleteUser() {
    User? user = _auth.currentUser;

    return users
        .doc(user!.uid)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }


  Future<void> updateUser(String newpassword) async {

    if (FirebaseAuth.instance.currentUser != null) {
      // User is authenticated
      final userId = _auth.currentUser!.uid;
      final userDoc = users.doc(userId);

      userDoc.get().then((doc) {
        if (doc.exists) {

          userDoc.update({'password': newpassword})
              .then((value) => print("User Updated"))
              .catchError((error) => print("Failed to update user: $error"));
        } else {
          print("No document found for this user.");
        }
      }).catchError((error) {
        print("Failed to get document: $error");
      });
    } else {
      print("User is not authenticated.");
    }

  }

  Future<void> signUp(String email, String password,String fullName) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String userId = userCredential.user!.uid;

      await users.doc(userId).set({
        'email': email,
        'password' :password,
        'Full_name' :fullName,
        'createdAt': FieldValue.serverTimestamp(),
        // Add any other fields you need
      });

      print("User document created successfully!");
    } catch (e) {
       throw e;
    }
  }

  Future<void> loginUser(String email,String password) async {

    UserCredential user = await _auth
        .signInWithEmailAndPassword(email: email, password: password);
  }


  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    UserCredential usr =
    await _auth.signInWithCredential(credential);
    return usr.user;
  }

  Future<void> getUserEmail() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    final userDoc = users.doc(userId);

    try {
      DocumentSnapshot doc = await userDoc.get();

      if (doc.exists) {

        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

        if (data != null) {
          fullname = data['Full_name'];
        } else {
          print("Document data is null.");
        }
      } else {
        print("No document found for this user.");
      }
    } catch (error) {
      print("Failed to get user email: $error");
    }
  }

   Future<void> changePassword(String newPassword) async {
     final user = FirebaseAuth.instance.currentUser!;
     await user.updatePassword(newPassword);
   }

   Future<void> sendPasswordResetEmail(String email) async {
     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
   }


}
