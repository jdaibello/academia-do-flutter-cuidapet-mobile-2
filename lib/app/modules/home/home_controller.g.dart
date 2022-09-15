// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$_addressEntityAtom =
      Atom(name: 'HomeControllerBase._addressEntity', context: context);

  AddressEntity? get addressEntity {
    _$_addressEntityAtom.reportRead();
    return super._addressEntity;
  }

  @override
  AddressEntity? get _addressEntity => addressEntity;

  @override
  set _addressEntity(AddressEntity? value) {
    _$_addressEntityAtom.reportWrite(value, super._addressEntity, () {
      super._addressEntity = value;
    });
  }

  late final _$_categoriesListAtom =
      Atom(name: 'HomeControllerBase._categoriesList', context: context);

  List<SupplierCategoryModel> get categoriesList {
    _$_categoriesListAtom.reportRead();
    return super._categoriesList;
  }

  @override
  List<SupplierCategoryModel> get _categoriesList => categoriesList;

  @override
  set _categoriesList(List<SupplierCategoryModel> value) {
    _$_categoriesListAtom.reportWrite(value, super._categoriesList, () {
      super._categoriesList = value;
    });
  }

  late final _$_supplierPageTypeSelectedAtom = Atom(
      name: 'HomeControllerBase._supplierPageTypeSelected', context: context);

  SupplierPageType get supplierPageTypeSelected {
    _$_supplierPageTypeSelectedAtom.reportRead();
    return super._supplierPageTypeSelected;
  }

  @override
  SupplierPageType get _supplierPageTypeSelected => supplierPageTypeSelected;

  @override
  set _supplierPageTypeSelected(SupplierPageType value) {
    _$_supplierPageTypeSelectedAtom
        .reportWrite(value, super._supplierPageTypeSelected, () {
      super._supplierPageTypeSelected = value;
    });
  }

  late final _$_suppliersByAddressListAtom = Atom(
      name: 'HomeControllerBase._suppliersByAddressList', context: context);

  List<SupplierNearByMeModel> get suppliersByAddressList {
    _$_suppliersByAddressListAtom.reportRead();
    return super._suppliersByAddressList;
  }

  @override
  List<SupplierNearByMeModel> get _suppliersByAddressList =>
      suppliersByAddressList;

  @override
  set _suppliersByAddressList(List<SupplierNearByMeModel> value) {
    _$_suppliersByAddressListAtom
        .reportWrite(value, super._suppliersByAddressList, () {
      super._suppliersByAddressList = value;
    });
  }

  late final _$_supplierCategoryFilterSelectedAtom = Atom(
      name: 'HomeControllerBase._supplierCategoryFilterSelected',
      context: context);

  SupplierCategoryModel? get supplierCategoryFilterSelected {
    _$_supplierCategoryFilterSelectedAtom.reportRead();
    return super._supplierCategoryFilterSelected;
  }

  @override
  SupplierCategoryModel? get _supplierCategoryFilterSelected =>
      supplierCategoryFilterSelected;

  @override
  set _supplierCategoryFilterSelected(SupplierCategoryModel? value) {
    _$_supplierCategoryFilterSelectedAtom
        .reportWrite(value, super._supplierCategoryFilterSelected, () {
      super._supplierCategoryFilterSelected = value;
    });
  }

  late final _$getAddressSelectedAsyncAction =
      AsyncAction('HomeControllerBase.getAddressSelected', context: context);

  @override
  Future<void> getAddressSelected() {
    return _$getAddressSelectedAsyncAction
        .run(() => super.getAddressSelected());
  }

  late final _$goToAddressPageAsyncAction =
      AsyncAction('HomeControllerBase.goToAddressPage', context: context);

  @override
  Future<void> goToAddressPage() {
    return _$goToAddressPageAsyncAction.run(() => super.goToAddressPage());
  }

  late final _$_getCategoriesAsyncAction =
      AsyncAction('HomeControllerBase._getCategories', context: context);

  @override
  Future<void> _getCategories() {
    return _$_getCategoriesAsyncAction.run(() => super._getCategories());
  }

  late final _$findSuppliersByAddressAsyncAction = AsyncAction(
      'HomeControllerBase.findSuppliersByAddress',
      context: context);

  @override
  Future<void> findSuppliersByAddress() {
    return _$findSuppliersByAddressAsyncAction
        .run(() => super.findSuppliersByAddress());
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void changeTabSupplier(SupplierPageType supplierPageType) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.changeTabSupplier');
    try {
      return super.changeTabSupplier(supplierPageType);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterSupplierCategory(SupplierCategoryModel category) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.filterSupplierCategory');
    try {
      return super.filterSupplierCategory(category);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterSupplier() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.filterSupplier');
    try {
      return super.filterSupplier();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
