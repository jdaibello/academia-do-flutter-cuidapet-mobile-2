import 'package:cuidapet_mobile_2/app/core/exceptions/failure_exception.dart';
import 'package:cuidapet_mobile_2/app/core/exceptions/user_exists_exception.dart';
import 'package:cuidapet_mobile_2/app/core/logger/app_logger.dart';
import 'package:cuidapet_mobile_2/app/repositories/user/user_repository.dart';
import 'package:cuidapet_mobile_2/app/services/user/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final AppLogger _log;

  UserServiceImpl({
    required UserRepository userRepository,
    required AppLogger log,
  })  : _log = log,
        _userRepository = userRepository;

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
}
