import 'dart:async';
import 'dart:developer' as developer;
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Authentication/Incognito/SocialAuthenticator.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:cubesnack/Utils/TokenManager.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class LoginEvent {
  Stream<LoginState> applyAsync({LoginState currentState, LoginBloc bloc});
}

class UnLoginEvent extends LoginEvent {
  @override
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc}) async* {
    yield UnLoginState();
  }
}

class SocialLoginEvent extends LoginEvent {
  final SocialType type;
  SocialLoginEvent({this.type});

  @override
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc}) async* {
    try {
      yield LoginLoadingState();
      switch (type) {
        case SocialType.apple:
        case SocialType.facebook:
          {
            final SocialAuthenticator validator = SocialAuthenticator();
            final FacebookLoginResult result = await validator.signInFacebook();
            appPrint(result.accessToken.token);
            final ApiResponse apiResult = await AppApi()
                .facebookLogin({"token": result.accessToken.token});
            if (apiResult.status == APIStatus.COMPLETED) {
              await TokenManager.setToken(
                  token: apiResult.data["access_token"]);
              yield LoginDoneState();
            } else {
              yield ErrorLoginState(apiResult.message);
            }
            break;
          }

        case SocialType.gmail:
          {
            final SocialAuthenticator validator = SocialAuthenticator();
            final result = await validator.signInWithGoogle();
            appPrint(result.idToken);
            final ApiResponse apiResult =
                await AppApi().googleSignIn({"token": result.idToken});
            if (apiResult.status == APIStatus.COMPLETED) {
              await TokenManager.setToken(
                  token: apiResult.data["access_token"]);
              yield LoginDoneState();
            } else {
              yield ErrorLoginState(apiResult.message);
            }
          }
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
      yield ErrorLoginState(_?.toString());
    }
  }
}

class EmailLoginEvent extends LoginEvent {
  final String email;
  final String password;
  EmailLoginEvent({this.email, this.password});

  @override
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc}) async* {
    try {
      yield LoginLoadingState();
      final ApiResponse response =
          await AppApi().sendLogin({"username": email, "password": password});
      if (response.status == APIStatus.COMPLETED) {
        await TokenManager.setToken(token: response.data["access_token"]);
        if (response.data.containsKey("seller_id") &&
            response.data["seller_id"] != null) {
          await TokenManager.saveSellerId(sellerId: response.data["seller_id"]);
        }
        yield LoginDoneState();
      } else {
        yield ErrorLoginState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
      yield ErrorLoginState(_?.toString());
    }
  }
}

class SignupEvent extends LoginEvent {
  final String email;
  final String password;
  final String fullName;

  SignupEvent({this.email, this.password, this.fullName});

  @override
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc}) async* {
    try {
      yield LoginLoadingState();
      final ApiResponse response = await AppApi()
          .signup({"email": email, "password": password, "fullname": fullName});
      if (response.status == APIStatus.COMPLETED) {
        // UserSession.shared.setToken(response.data["access_token"]);
        yield LoginDoneState();
      } else {
        yield ErrorLoginState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
      yield ErrorLoginState(_?.toString());
    }
  }
}

class EmailSentEvent extends LoginEvent {
  final String email;

  EmailSentEvent({this.email});

  @override
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc}) async* {
    try {
      yield LoginLoadingState();
      final ApiResponse response = await AppApi().signup({
        "email": email,
      });
      if (response.status == APIStatus.COMPLETED) {
        // UserSession.shared.setToken(response.data["access_token"]);
        yield LoginDoneState();
      } else {
        yield ErrorLoginState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
      yield ErrorLoginState(_?.toString());
    }
  }
}

class ValidateOTPEvent extends LoginEvent {
  final String otp;

  ValidateOTPEvent({this.otp});

  @override
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc}) async* {
    try {
      yield LoginLoadingState();
      final ApiResponse response = await AppApi().verifyOtp(body: {
        "otp": otp,
      });
      if (response.status == APIStatus.COMPLETED) {
        TokenManager.setToken(token: response.data["access_token"]);
        UserSession.shared.setToken(response.data["access_token"]);
        yield LoginDoneState();
      } else {
        yield ErrorLoginState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
      yield ErrorLoginState(_?.toString());
    }
  }
}
