import 'package:cuidapet_mobile_2/app/core/life_cycle/controller_life_cycle.dart';
import 'package:cuidapet_mobile_2/app/core/ui/widgets/loader.dart';
import 'package:cuidapet_mobile_2/app/entities/address_entity.dart';
import 'package:cuidapet_mobile_2/app/services/address/address_service.dart';
import 'package:mobx/mobx.dart';

part 'address_controller.g.dart';

class AddressController = AddressControllerBase with _$AddressController;

abstract class AddressControllerBase with Store, ControllerLifeCycle {
  final AddressService _addressService;

  AddressControllerBase({required AddressService addressService})
      : _addressService = addressService;

  @override
  void onReady() {
    getAddresses();
  }

  @readonly
  List<AddressEntity> _addresses = [];

  @action
  Future<void> getAddresses() async {
    Loader.show();
    _addresses = await _addressService.getAddresses();
    Loader.hide();
  }
}
