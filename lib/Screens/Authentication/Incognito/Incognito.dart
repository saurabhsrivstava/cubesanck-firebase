
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';




Future<FacebookLoginResult> signInWithFacebook() async {
  final facebookLogin = FacebookLogin();
  final facebookLoginResult = await facebookLogin.logIn(['email']);
  return facebookLoginResult;
}

Future<GoogleSignInAuthentication> signInWithGoogle() async {
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  try {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    return googleSignInAuthentication;
  } catch (e) {
    throw Exception(e);
  }
}

Future<AuthorizationCredentialAppleID> signInWithApple() async {
  final credential = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
  );
}
