import 'package:cuidapet_mobile_2/app/core/logger/app_logger.dart';
import 'package:cuidapet_mobile_2/app/core/ui/widgets/loader.dart';
import 'package:cuidapet_mobile_2/app/services/user/user_service.dart';
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

  Future<void> login(String emial, String password) async {
    Loader.show();
    await Future.delayed(const Duration(seconds: 2));
    Loader.hide();
  }
}
