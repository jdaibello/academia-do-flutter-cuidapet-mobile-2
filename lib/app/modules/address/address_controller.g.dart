// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddressController on AddressControllerBase, Store {
  late final _$_locationServiceUnavailableAtom = Atom(
      name: 'AddressControllerBase._locationServiceUnavailable',
      context: context);

  bool get locationServiceUnavailable {
    _$_locationServiceUnavailableAtom.reportRead();
    return super._locationServiceUnavailable;
  }

  @override
  bool get _locationServiceUnavailable => locationServiceUnavailable;

  @override
  set _locationServiceUnavailable(bool value) {
    _$_locationServiceUnavailableAtom
        .reportWrite(value, super._locationServiceUnavailable, () {
      super._locationServiceUnavailable = value;
    });
  }

  late final _$_locationPermissionAtom =
      Atom(name: 'AddressControllerBase._locationPermission', context: context);

  LocationPermission? get locationPermission {
    _$_locationPermissionAtom.reportRead();
    return super._locationPermission;
  }

  @override
  LocationPermission? get _locationPermission => locationPermission;

  @override
  set _locationPermission(LocationPermission? value) {
    _$_locationPermissionAtom.reportWrite(value, super._locationPermission, () {
      super._locationPermission = value;
    });
  }

  late final _$_placeModelAtom =
      Atom(name: 'AddressControllerBase._placeModel', context: context);

  PlaceModel? get placeModel {
    _$_placeModelAtom.reportRead();
    return super._placeModel;
  }

  @override
  PlaceModel? get _placeModel => placeModel;

  @override
  set _placeModel(PlaceModel? value) {
    _$_placeModelAtom.reportWrite(value, super._placeModel, () {
      super._placeModel = value;
    });
  }

  late final _$_addressesAtom =
      Atom(name: 'AddressControllerBase._addresses', context: context);

  List<AddressEntity> get addresses {
    _$_addressesAtom.reportRead();
    return super._addresses;
  }

  @override
  List<AddressEntity> get _addresses => addresses;

  @override
  set _addresses(List<AddressEntity> value) {
    _$_addressesAtom.reportWrite(value, super._addresses, () {
      super._addresses = value;
    });
  }

  late final _$getAddressesAsyncAction =
      AsyncAction('AddressControllerBase.getAddresses', context: context);

  @override
  Future<void> getAddresses() {
    return _$getAddressesAsyncAction.run(() => super.getAddresses());
  }

  late final _$myLocationAsyncAction =
      AsyncAction('AddressControllerBase.myLocation', context: context);

  @override
  Future<void> myLocation() {
    return _$myLocationAsyncAction.run(() => super.myLocation());
  }

  late final _$goToAddressDetailAsyncAction =
      AsyncAction('AddressControllerBase.goToAddressDetail', context: context);

  @override
  Future<void> goToAddressDetail(PlaceModel place) {
    return _$goToAddressDetailAsyncAction
        .run(() => super.goToAddressDetail(place));
  }

  late final _$selectAddressAsyncAction =
      AsyncAction('AddressControllerBase.selectAddress', context: context);

  @override
  Future<void> selectAddress(AddressEntity addressEntity) {
    return _$selectAddressAsyncAction
        .run(() => super.selectAddress(addressEntity));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
