import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthService{
 static Future signInWithGoogle()async{


    try{
      final GoogleSignInAccount? googleUser= await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gAuth=await googleUser!.authentication;
      final credential= GoogleAuthProvider.credential(
        accessToken:gAuth.accessToken ,
        idToken:gAuth.idToken,
      );
    return await FirebaseAuth.instance.signInWithCredential(credential);
    }catch (onError){
      print('----------------');
      print(onError.toString());
      print('----------------');


    }
  }
}