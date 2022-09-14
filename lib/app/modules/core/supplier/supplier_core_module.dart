import 'package:cuidapet_mobile_2/app/repositories/suppliers/supplier_repository.dart';
import 'package:cuidapet_mobile_2/app/repositories/suppliers/supplier_repository_impl.dart';
import 'package:cuidapet_mobile_2/app/services/supplier/supplier_service.dart';
import 'package:cuidapet_mobile_2/app/services/supplier/supplier_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SupplierCoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<SupplierRepository>(
          (i) => SupplierRepositoryImpl(
            restClient: i(),
            log: i(),
          ),
          export: true,
        ),
        Bind.lazySingleton<SupplierService>(
          (i) => SupplierServiceImpl(
            repository: i(),
          ),
          export: true,
        ),
      ];
}
