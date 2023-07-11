import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  void createUser(String email, String password, String phone, String name) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (cred.user != null) {
        if(phone.isNotEmpty && name.isNotEmpty){
        await _fireStore.collection('users').doc(cred.user!.uid).set({
          'user': cred.user!.email,
          'phone': phone,
        });
        }
      }
    }
  }
  Future<void> emailOnly(String email)async{
    if(email.isNotEmpty){
    await _fireStore.collection('noUsers').doc().set({'email': email});
    }
  }
}
