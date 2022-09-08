import 'package:cuidapet_mobile_2/app/entities/address_entity.dart';
import 'package:cuidapet_mobile_2/app/models/place_model.dart';

abstract class AddressService {
  Future<List<PlaceModel>> findAddressByGooglePlaces(String addressPattern);
  Future<List<AddressEntity>> getAddresses();
  Future<AddressEntity> saveAddress(PlaceModel placeModel, String additional);
  Future<void> deleteAll();
  Future<void> selectAddress(AddressEntity addressEntity);
  Future<AddressEntity?> getAddressSelected();
}
