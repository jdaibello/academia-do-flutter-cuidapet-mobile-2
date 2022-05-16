import 'package:cuidapet_mobile_2/app/core/exceptions/failure_exception.dart';
import 'package:cuidapet_mobile_2/app/core/exceptions/user_exists_exception.dart';
import 'package:cuidapet_mobile_2/app/core/exceptions/user_not_exists_exception.dart';
import 'package:cuidapet_mobile_2/app/core/helpers/constants.dart';
import 'package:cuidapet_mobile_2/app/core/local_storage/local_storage.dart';
import 'package:cuidapet_mobile_2/app/core/logger/app_logger.dart';
import 'package:cuidapet_mobile_2/app/repositories/user/user_repository.dart';
import 'package:cuidapet_mobile_2/app/services/user/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final AppLogger _log;
  final LocalStorage _localStorage;

  UserServiceImpl({
    required UserRepository userRepository,
    required AppLogger log,
    required LocalStorage localStorage,
  })  : _log = log,
        _userRepository = userRepository,
        _localStorage = localStorage;

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

        final token = await _localStorage.read<String>(
          Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY,
        );

        debugPrint('$token');
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

  Future<void> _saveAccessToken(String accessToken) => _localStorage
      .write<String>(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY, accessToken);
}
