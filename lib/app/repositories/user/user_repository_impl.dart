import 'dart:io';

import 'package:cuidapet_mobile_2/app/core/exceptions/failure_exception.dart';
import 'package:cuidapet_mobile_2/app/core/exceptions/user_exists_exception.dart';
import 'package:cuidapet_mobile_2/app/core/logger/app_logger.dart';
import 'package:cuidapet_mobile_2/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_mobile_2/app/core/rest_client/rest_client_exception.dart';
import 'package:cuidapet_mobile_2/app/models/confirm_login_model.dart';
import 'package:cuidapet_mobile_2/app/models/user_model.dart';
import 'package:cuidapet_mobile_2/app/repositories/user/user_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient _restClient;
  final AppLogger _log;

  UserRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<void> register(String email, String password) async {
    try {
      await _restClient.unauth().post('/auth/register', data: {
        'email': email,
        'password': password,
      });
    } on RestClientException catch (e, s) {
      if (e.statusCode == 400 &&
          e.response.data['message'].contains('User already registered')) {
        _log.error(e.error, e, s);
        throw UserExistsException();
      }

      _log.error('Error when registering user', e, s);
      throw FailureException(message: 'Error when registering user');
    }
  }

  @override
  Future<String> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result = await _restClient.unauth().post(
        '/auth/',
        data: {
          'login': email,
          'password': password,
          'social_login': false,
          'supplier_user': false,
        },
      );

      return result.data['access_token'];
    } on RestClientException catch (e, s) {
      if (e.statusCode == 403) {
        throw FailureException(
          message: 'Usuário inconsistente, entre em contato com o suporte!!!',
        );
      }

      _log.error('Erro ao realizar login', e, s);
      throw FailureException(
        message: 'Erro ao realizar login, tente novamente mais tarde',
      );
    }
  }

  @override
  Future<ConfirmLoginModel> confirmLogin() async {
    try {
      final deviceToken = await FirebaseMessaging.instance.getToken();

      final result = await _restClient.auth().patch(
        '/auth/confirm',
        data: {
          'ios_token': Platform.isIOS ? deviceToken : null,
          'android_token': Platform.isAndroid ? deviceToken : null,
        },
      );

      return ConfirmLoginModel.fromMap(result.data);
    } on RestClientException catch (e, s) {
      _log.error('Erro ao confirmar o login', e, s);
      throw FailureException(message: 'Erro ao confirmar o login');
    }
  }

  @override
  Future<UserModel> getUserLogged() async {
    try {
      final result = await _restClient.get('/user/');
      return UserModel.fromMap(result.data);
    } on RestClientException catch (e, s) {
      _log.error('Erro ao buscar dados do usuário logado', e, s);
      throw FailureException(message: 'Erro ao buscar dados do usuário logado');
    }
  }
}
