import 'package:cuidapet_mobile_2/app/core/exceptions/failure_exception.dart';
import 'package:cuidapet_mobile_2/app/core/exceptions/user_not_exists_exception.dart';
import 'package:cuidapet_mobile_2/app/core/logger/app_logger.dart';
import 'package:cuidapet_mobile_2/app/core/ui/widgets/loader.dart';
import 'package:cuidapet_mobile_2/app/core/ui/widgets/messages.dart';
import 'package:cuidapet_mobile_2/app/services/user/user_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final UserService _userService;
  final AppLogger _log;

  LoginControllerBase({
    required UserService userService,
    required AppLogger log,
  })  : _userService = userService,
        _log = log;

  Future<void> login(String email, String password) async {
    try {
      Loader.show();
      await _userService.loginWithEmailAndPassword(email, password);
      Loader.hide();
      Modular.to.navigate('/auth/');
    } on FailureException catch (e, s) {
      final errorMessage = e.message ?? 'Erro ao realizar login';

      _log.error(errorMessage, e, s);
      Loader.hide();
      Messages.alert(errorMessage);
    } on UserNotExistsException catch (e, s) {
      const errorMessage = 'Usuário não cadastrado';

      _log.error(errorMessage, e, s);
      Loader.hide();
      Messages.alert(errorMessage);
    }
  }
}
