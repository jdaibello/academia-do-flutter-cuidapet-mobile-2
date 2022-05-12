import 'package:cuidapet_mobile_2/app/app_module.dart';
import 'package:cuidapet_mobile_2/app/app_widget.dart';
import 'package:cuidapet_mobile_2/app/core/application_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  await ApplicationConfig().configureApp();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
