import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  Auth._();
  static final Auth auth = Auth._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences sharedPreferences;
  GoogleSignIn googleSignIn = GoogleSignIn();

  //GoogleSignIn googleSignIn = GoogleSignIn();

  Future<SharedPreferences> initSp() async {
    try {
      if (sharedPreferences == null) {
        sharedPreferences = await SharedPreferences.getInstance();
        return sharedPreferences;
      } else {
        return sharedPreferences;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<String> createUserWithEmailAndPassword(
      String email, String pass) async {
    try {
      sharedPreferences = await initSp();
      AuthResult result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: pass);
      assert(result.user != null);
      String userId = result.user.uid;
      // sharedPreferences.setString('userId', userId);
      // sharedPreferences.setBool('isLogged', true);
      return userId;
    } catch (error) {
      throw error;
      //print(error);
    }
  }

  Future<String> signInUsingEmailAndPassword(
      String email, String password) async {
    try {
      sharedPreferences = await initSp();
      AuthResult result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      assert(result.user != null);
      String userId = result.user.uid;
      //sharedPreferences.setString('userId', userId);
      //sharedPreferences.setBool('isLogged', true);
      return userId;
    } catch (error) {
      throw error;
    }
  }

  Future<bool> loginUsingGmail() async {
    try {
      // create google Account
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      // create authentaication object to get the  access token and token id
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      // get credintials
      String accesToken = googleSignInAuthentication.accessToken;
      String tokenId = googleSignInAuthentication.idToken;
      // create credintial object
      AuthCredential authCredential = GoogleAuthProvider.getCredential(
          idToken: tokenId, accessToken: accesToken);
      // create the user using credintials
      AuthResult authResult =
          await firebaseAuth.signInWithCredential(authCredential);
      // print(authResult.user.photoUrl);
      // print(authResult.user.email);
      // print(authResult.user.displayName);
      if (authResult.user == null) {
        return false;
      } else {
        return true;
      }
    } catch (error) {
      print(error);
    }
  }

  signOut() async {
    sharedPreferences = await initSp();
    //sharedPreferences.setBool('isLogged', false);
    //sharedPreferences.setString('userId', '');
    firebaseAuth.signOut();
  }
}
