import 'package:cuidapet_mobile_2/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:cuidapet_mobile_2/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_mobile_2/app/modules/core/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => AuthStore(),
      export: true,
    ),
    Bind.lazySingleton<RestClient>(
      (i) => DioRestClient(),
      export: true,
    ),
  ];
}
