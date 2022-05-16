import 'package:cuidapet_mobile_2/app/core/helpers/constants.dart';
import 'package:cuidapet_mobile_2/app/core/local_storage/local_storage.dart';
import 'package:cuidapet_mobile_2/app/core/logger/app_logger.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final LocalStorage _localStorage;
  final AppLogger _log;

  AuthInterceptor({
    required LocalStorage localStorage,
    required AppLogger log,
  })  : _localStorage = localStorage,
        _log = log;

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

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {}

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {}
}
