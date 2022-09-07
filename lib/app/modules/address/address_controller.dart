import 'package:cuidapet_mobile_2/app/core/life_cycle/controller_life_cycle.dart';
import 'package:cuidapet_mobile_2/app/core/ui/widgets/loader.dart';
import 'package:cuidapet_mobile_2/app/entities/address_entity.dart';
import 'package:cuidapet_mobile_2/app/models/place_model.dart';
import 'package:cuidapet_mobile_2/app/services/address/address_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'address_controller.g.dart';

class AddressController = AddressControllerBase with _$AddressController;

abstract class AddressControllerBase with Store, ControllerLifeCycle {
  final AddressService _addressService;

  AddressControllerBase({required AddressService addressService})
      : _addressService = addressService;

  @readonly
  var _locationServiceUnavailable = false.asObservable();

  @readonly
  Observable<LocationPermission>? _locationPermission;

  @readonly
  var _addresses = <AddressEntity>[];

  @override
  void onReady() {
    getAddresses();
  }

  @action
  Future<void> getAddresses() async {
    Loader.show();
    _addresses = await _addressService.getAddresses();
    Loader.hide();
  }

  @action
  Future<void> myLocation() async {
    final serviceEnable = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnable) {
      _locationServiceUnavailable = true.asObservable();
      return;
    }

    final locationPermission = await Geolocator.checkPermission();

    switch (locationPermission) {
      case LocationPermission.denied:
        final permssion = await Geolocator.requestPermission();

        if (permssion == LocationPermission.denied ||
            permssion == LocationPermission.deniedForever) {
          _locationPermission = Observable(permssion);
          return;
        }
        break;
      case LocationPermission.deniedForever:
        _locationPermission = Observable(locationPermission);
        return;
      case LocationPermission.whileInUse:
      case LocationPermission.always:
      case LocationPermission.unableToDetermine:
        break;
    }

    Loader.show();
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final placemark = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    final place = placemark.first;
    final address = '${place.thoroughfare} ${place.subThoroughfare}';
    final placeModel = PlaceModel(
      address: address,
      lat: position.latitude,
      lng: position.longitude,
    );

    Loader.hide();
    goToAddressDetail(placeModel);
  }

  void goToAddressDetail(PlaceModel place) {
    Modular.to.pushNamed('/address/detail/', arguments: place);
  }
}
