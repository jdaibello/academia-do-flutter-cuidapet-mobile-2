import 'package:cuidapet_mobile_2/app/models/supplier_category_model.dart';

abstract class SupplierRepository {
  Future<List<SupplierCategoryModel>> getCategories();
}
