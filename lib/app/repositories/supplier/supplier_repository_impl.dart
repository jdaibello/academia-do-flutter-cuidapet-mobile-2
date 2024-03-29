import 'package:cuidapet_mobile_2/app/core/exceptions/failure_exception.dart';
import 'package:cuidapet_mobile_2/app/core/logger/app_logger.dart';
import 'package:cuidapet_mobile_2/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_mobile_2/app/core/rest_client/rest_client_exception.dart';
import 'package:cuidapet_mobile_2/app/entities/address_entity.dart';
import 'package:cuidapet_mobile_2/app/models/supplier_category_model.dart';
import 'package:cuidapet_mobile_2/app/models/supplier_near_by_me_model.dart';

import './supplier_repository.dart';

class SupplierRepositoryImpl implements SupplierRepository {
  final RestClient _restClient;
  final AppLogger _log;

  SupplierRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<List<SupplierCategoryModel>> getCategories() async {
    try {
      final result = await _restClient.auth().get('/categories/');

      return result.data
          ?.map<SupplierCategoryModel>(
            (categoryResponse) =>
                SupplierCategoryModel.fromMap(categoryResponse),
          )
          .toList();
    } on RestClientException catch (e, s) {
      _log.error('Erro ao buscar categorias dos fornecedores', e, s);
      throw FailureException(
        message: 'Erro ao buscar categorias dos fornecedores',
      );
    }
  }

  @override
  Future<List<SupplierNearByMeModel>> findNearBy(AddressEntity address) async {
    try {
      final result = await _restClient.auth().get(
        '/suppliers/',
        queryParameters: {
          'lat': address.lat,
          'lng': address.lng,
        },
      );

      return result.data
          ?.map<SupplierNearByMeModel>((supplierResponse) =>
              SupplierNearByMeModel.fromMap(supplierResponse))
          .toList();
    } on RestClientException catch (e, s) {
      _log.error('Erro ao buscar fornecedores perto de mim', e, s);
      throw FailureException(
        message: 'Erro ao buscar fornecedores perto de mim',
      );
    }
  }
}
