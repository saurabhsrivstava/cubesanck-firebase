import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialAuthenticator {
  signInFacebook() async {
    try {
      final facebookLogin = FacebookLogin();
      final facebookLoginResult = await facebookLogin.logIn(['email']);
      return facebookLoginResult;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<GoogleSignInAuthentication> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: ['email'],
    );
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      return googleSignInAuthentication;
    } catch (e) {
      appPrint(e);
      throw Exception(e);
    }
  }

  // signInGoogle() async {
  //   final googleSignInAuthentication = await signInWithGoogle();
  //   final credentials = new Credentials(
  //     identityyPoolId,
  //     userPoolId,
  //     clientId,
  //     googleSignInAuthentication.idToken,
  //     'accounts.google.com',
  //   );

  //   final api = Api(apiEndpointUrl, '/flutter', 'us-east-2', credentials);

  //   try {
  //     final result = await api.post({});
  //     print(result.body);
  //     return result;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
}
