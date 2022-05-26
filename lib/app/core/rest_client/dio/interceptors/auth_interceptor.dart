import 'package:cuidapet_mobile_2/app/core/helpers/constants.dart';
import 'package:cuidapet_mobile_2/app/core/local_storage/local_storage.dart';
import 'package:cuidapet_mobile_2/app/modules/core/auth/auth_store.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final LocalStorage _localStorage;
  final AuthStore _authStore;

  AuthInterceptor({
    required LocalStorage localStorage,
    required AuthStore authStore,
  })  : _localStorage = localStorage,
        _authStore = authStore;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authRequired =
        options.extra[Constants.REST_CLIENT_AUTH_REQUIRED] ?? false;

    if (authRequired) {
      final accessToken = await _localStorage.read<String>(
        Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY,
      );

      if (accessToken == null) {
        _authStore.logout();

        return handler.reject(
          DioError(
            requestOptions: options,
            error: 'Expired Token',
            type: DioErrorType.cancel,
          ),
        );
      }

      options.headers['Authorization'] = accessToken;
    } else {
      options.headers.remove('Authorization');
    }

    handler.next(options);
  }
}
