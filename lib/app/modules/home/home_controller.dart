import 'package:cuidapet_mobile_2/app/core/life_cycle/controller_life_cycle.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store, ControllerLifeCycle {
  @override
  void onInit(Map<String, dynamic>? params) {
    debugPrint('onInit chamado');
    debugPrint('$params');
    super.onInit(params);
  }

  @override
  void onReady() {
    debugPrint('onReady chamado');
    super.onReady();
  }
}
