import 'package:cuidapet_mobile_2/app/core/helpers/constants.dart';
import 'package:cuidapet_mobile_2/app/core/local_storage/local_storage.dart';
import 'package:cuidapet_mobile_2/app/models/user_model.dart';
import 'package:cuidapet_mobile_2/app/services/address/address_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final LocalStorage _localStorage;
  final LocalSecureStorage _localSecureStorage;
  final AddressService _addressService;

  AuthStoreBase({
    required LocalStorage localStorage,
    required LocalSecureStorage localSecureStorage,
    required AddressService addressService,
  })  : _localStorage = localStorage,
        _localSecureStorage = localSecureStorage,
        _addressService = addressService;

  @readonly
  UserModel? _userLogged;

  @action
  Future<void> loadUserLogged() async {
    // Usuário logado!!!
    final userModelJson = await _localStorage.read<String>(
      Constants.LOCAL_STORAGE_USER_LOGGED_DATA_KEY,
    );

    if (userModelJson != null) {
      _userLogged = UserModel.fromJson(userModelJson);
    } else {
      _userLogged = UserModel.empty();
    }

    FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user == null) {
        await logout();
      }
    });
  }

  @action
  Future<void> logout() async {
    await _localStorage.clear();
    await _localSecureStorage.clear();
    await _addressService.deleteAll();
    _userLogged = UserModel.empty();
  }
}
