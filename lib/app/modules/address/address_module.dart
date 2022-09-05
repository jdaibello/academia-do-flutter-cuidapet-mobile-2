import 'package:cuidapet_mobile_2/app/modules/address/address_page.dart';
import 'package:cuidapet_mobile_2/app/modules/address/widgets/address_search_widget/address_search_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddressModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AddressSearchController>(
      (i) => AddressSearchController(
        addressService: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const AddressPage(),
    ),
  ];
}
