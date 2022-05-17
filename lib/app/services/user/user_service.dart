import 'package:cuidapet_mobile_2/app/models/social_login_type.dart';

abstract class UserService {
  Future<void> register(String email, String password);
  Future<void> loginWithEmailAndPassword(String email, String password);
  Future<void> socialLogin(SocialLoginType socialLoginType);
}
