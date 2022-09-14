import 'package:cuidapet_mobile_2/app/core/database/sqlite_connection_factory.dart';
import 'package:cuidapet_mobile_2/app/core/exceptions/failure_exception.dart';
import 'package:cuidapet_mobile_2/app/core/helpers/environments.dart';
import 'package:cuidapet_mobile_2/app/entities/address_entity.dart';
import 'package:cuidapet_mobile_2/app/models/place_model.dart';
import 'package:google_place/google_place.dart';

import './address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  final SqliteConnectionFactory _sqliteConnectionFactory;

  const AddressRepositoryImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
  }) : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<List<PlaceModel>> findAddressByGooglePlaces(
    String addressPattern,
  ) async {
    final googleApiKey = Environments.param('GOOGLE_API_KEY');

    if (googleApiKey == null) {
      throw FailureException(message: 'Google API Key not found');
    }

    final googlePlace = GooglePlace(googleApiKey);
    final addressResult = await googlePlace.search.getTextSearch(
      addressPattern,
    );

    final candidates = addressResult?.results;

    if (candidates != null) {
      return candidates.map<PlaceModel>((searchResult) {
        final location = searchResult.geometry?.location;
        final address = searchResult.formattedAddress;

        return PlaceModel(
          address: address ?? '',
          lat: location?.lat ?? 0,
          lng: location?.lng ?? 0,
        );
      }).toList();
    }

    return <PlaceModel>[];
  }

  @override
  Future<List<AddressEntity>> getAddress() async {
    final sqliteConn = await _sqliteConnectionFactory.openConnection();
    final result = await sqliteConn.rawQuery('SELECT * FROM address');
    return result.map<AddressEntity>((a) => AddressEntity.fromMap(a)).toList();
  }

  @override
  Future<int> saveAddress(AddressEntity entity) async {
    final sqliteConn = await _sqliteConnectionFactory.openConnection();
    return await sqliteConn.rawInsert(
      'INSERT INTO address VALUES (?, ?, ?, ?, ?)',
      [
        null,
        entity.address,
        entity.lat,
        entity.lng,
        entity.additional,
      ],
    );
  }

  @override
  Future<void> deleteAll() async {
    final sqliteConn = await _sqliteConnectionFactory.openConnection();
    await sqliteConn.delete('address');
  }
}
