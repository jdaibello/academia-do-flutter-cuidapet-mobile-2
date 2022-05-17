import 'package:cuidapet_mobile_2/app/core/exceptions/failure_exception.dart';
import 'package:cuidapet_mobile_2/app/core/exceptions/user_exists_exception.dart';
import 'package:cuidapet_mobile_2/app/core/exceptions/user_not_exists_exception.dart';
import 'package:cuidapet_mobile_2/app/core/helpers/constants.dart';
import 'package:cuidapet_mobile_2/app/core/local_storage/local_storage.dart';
import 'package:cuidapet_mobile_2/app/core/logger/app_logger.dart';
import 'package:cuidapet_mobile_2/app/models/social_login_type.dart';
import 'package:cuidapet_mobile_2/app/models/social_network_model.dart';
import 'package:cuidapet_mobile_2/app/repositories/social/social_repository.dart';
import 'package:cuidapet_mobile_2/app/repositories/user/user_repository.dart';
import 'package:cuidapet_mobile_2/app/services/user/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final AppLogger _log;
  final LocalStorage _localStorage;
  final LocalSecureStorage _localSecureStorage;
  final SocialRepository _socialRepository;

  UserServiceImpl({
    required UserRepository userRepository,
    required AppLogger log,
    required LocalStorage localStorage,
    required LocalSecureStorage localSecureStorage,
    required SocialRepository socialRepository,
  })  : _log = log,
        _userRepository = userRepository,
        _localStorage = localStorage,
        _localSecureStorage = localSecureStorage,
        _socialRepository = socialRepository;

  @override
  Future<void> register(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final userMethods = await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (userMethods.isNotEmpty) {
        throw UserExistsException();
      }

      await _userRepository.register(email, password);

      final userRegisterCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userRegisterCredential.user?.sendEmailVerification();
    } on FirebaseException catch (e, s) {
      _log.error('Error when registering user in Firebase', e, s);
      throw FailureException(message: 'Error when registering user');
    }
  }

  @override
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final loginMethods = await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (loginMethods.isEmpty) {
        throw UserNotExistsException();
      }

      if (loginMethods.contains('password')) {
        final userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        final userVerified = userCredential.user?.emailVerified ?? false;

        if (!userVerified) {
          userCredential.user?.sendEmailVerification();
          throw FailureException(
              message:
                  'E-mail não confirmado, por favor verifique sua caixa de e-mail');
        }

        debugPrint('E-mail verificado');

        final accessToken = await _userRepository.loginWithEmailAndPassword(
          email,
          password,
        );

        await _saveAccessToken(accessToken);
        await _confirmLogin();
        await _getUserData();
      } else {
        throw FailureException(
            message:
                'Login não pode ser feito com e-mail e senha, por favor utilize outro método');
      }
    } on FirebaseAuthException catch (e, s) {
      _log.error(
        'E-mail ou senha inválidos - FirebaseAuthError[${e.code}]',
        e,
        s,
      );
      throw FailureException(message: 'E-mail ou senha inválidos!!!');
    }
  }

  @override
  Future<void> socialLogin(SocialLoginType socialLoginType) async {
    final SocialNetworkModel socialModel;
    final AuthCredential authCredential;
    final firebaseAuth = FirebaseAuth.instance;

    switch (socialLoginType) {
      case SocialLoginType.facebook:
        throw FailureException(message: 'Facebook não implementado');
      // break;
      case SocialLoginType.google:
        socialModel = await _socialRepository.googleLogin();

        authCredential = GoogleAuthProvider.credential(
          accessToken: socialModel.accessToken,
          idToken: socialModel.id,
        );

        break;
    }

    final loginMethods =
        await firebaseAuth.fetchSignInMethodsForEmail(socialModel.email);

    final methodCheck = _getMethodToSocialLoginType(socialLoginType);

    if (loginMethods.isNotEmpty && !loginMethods.contains(methodCheck)) {
      throw FailureException(
          message:
              'Login não pode ser feito com $methodCheck, por favor utilize outro método');
    }

    await firebaseAuth.signInWithCredential(authCredential);
  }

  Future<void> _saveAccessToken(String accessToken) => _localStorage
      .write<String>(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY, accessToken);

  Future<void> _confirmLogin() async {
    final confirmLoginModel = await _userRepository.confirmLogin();
    await _saveAccessToken(confirmLoginModel.accessToken);

    await _localSecureStorage.write(
      Constants.LOCAL_STORAGE_REFRESH_TOKEN_KEY,
      confirmLoginModel.refreshToken,
    );
  }

  Future<void> _getUserData() async {
    final userModel = await _userRepository.getUserLogged();

    await _localStorage.write<String>(
      Constants.LOCAL_STORAGE_USER_LOGGED_DATA_KEY,
      userModel.toJson(),
    );
  }

  String _getMethodToSocialLoginType(SocialLoginType socialLoginType) {
    switch (socialLoginType) {
      case SocialLoginType.facebook:
        return 'facebook.com';
      case SocialLoginType.google:
        return 'google.com';
    }
  }
}
