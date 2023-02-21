
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';


class LocalAuthHelper {
  static final _auth = LocalAuthentication();
  static bool isAuthenticated = false;
  static Future<bool> canAuthenticate() async {
    return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
  }

  static Future<bool> authenticate() async {
    try {
      if (!await canAuthenticate()) return false;
      return await _auth.authenticate(
          localizedReason: 'Use Finger print to authenticate',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
            biometricOnly: true,
          ),
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
              signInTitle: 'Biometric authentication required!',
              cancelButton: 'Use Pin',
            ),
            IOSAuthMessages(
              cancelButton: 'No thanks',
            ),
          ]);
    } catch (e) {
      debugPrint('error $e');
      return false;
    }
  }
}
