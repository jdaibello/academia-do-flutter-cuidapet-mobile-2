import 'package:cuidapet_mobile_2/app/modules/core/supplier/supplier_core_module.dart';
import 'package:cuidapet_mobile_2/app/modules/home/home_controller.dart';
import 'package:cuidapet_mobile_2/app/modules/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton(
      (i) => HomeController(
        addressService: i(),
      ),
    ),
  ];

  @override
  List<Module> get imports => [
        SupplierCoreModule(),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const HomePage(),
    ),
  ];
}
