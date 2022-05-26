import 'package:cuidapet_mobile_2/app/models/confirm_login_model.dart';
import 'package:cuidapet_mobile_2/app/models/social_network_model.dart';
import 'package:cuidapet_mobile_2/app/models/user_model.dart';

abstract class UserRepository {
  Future<void> register(String email, String password);
  Future<String> loginWithEmailAndPassword(String email, String password);
  Future<ConfirmLoginModel> confirmLogin();
  Future<UserModel> getUserLogged();
  Future<String> loginSocial(SocialNetworkModel model);
}
