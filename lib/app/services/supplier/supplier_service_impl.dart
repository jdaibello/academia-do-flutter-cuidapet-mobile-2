import 'package:cuidapet_mobile_2/app/models/supplier_category_model.dart';
import 'package:cuidapet_mobile_2/app/repositories/suppliers/supplier_repository.dart';

import './supplier_service.dart';

class SupplierServiceImpl implements SupplierService {
  final SupplierRepository _repository;

  SupplierServiceImpl({required SupplierRepository repository})
      : _repository = repository;

  @override
  Future<List<SupplierCategoryModel>> getCategories() =>
      _repository.getCategories();
}
