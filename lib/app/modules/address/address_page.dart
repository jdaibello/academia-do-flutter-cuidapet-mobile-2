import 'dart:async';

import 'package:cuidapet_mobile_2/app/core/life_cycle/page_life_cycle_state.dart';
import 'package:cuidapet_mobile_2/app/core/mixins/location_mixin.dart';
import 'package:cuidapet_mobile_2/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet_mobile_2/app/models/place_model.dart';
import 'package:cuidapet_mobile_2/app/modules/address/address_controller.dart';
import 'package:cuidapet_mobile_2/app/modules/address/widgets/address_search_widget/address_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'widgets/address_item.dart';
part 'widgets/address_search_widget/address_search_widget.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState
    extends PageLifeCycleState<AddressController, AddressPage>
    with LocationMixin {
  final reactionDisposers = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
    final reactionService = reaction<bool>(
      (_) => controller.locationServiceUnavailable,
      (locationServiceUnavailable) {
        if (locationServiceUnavailable) {
          showDialogLocationServiceUnavailable();
        }
      },
    );

    final reactionLocationPermission = reaction<LocationPermission?>(
      (_) => controller.locationPermission,
      (locationPermission) {
        if (locationPermission != null &&
            locationPermission == LocationPermission.denied) {
          showDialogLocationDenied(tryAgain: () => controller.myLocation());
        } else if (locationPermission != null &&
            locationPermission == LocationPermission.deniedForever) {
          showDialogLocationDeniedForever();
        }
      },
    );

    reactionDisposers.addAll([reactionService, reactionLocationPermission]);
  }

  @override
  void dispose() {
    for (var reaction in reactionDisposers) {
      reaction();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.addressWasSelected(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: context.primaryColorDark),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              children: [
                Text(
                  'Adicione ou escolha um endereço',
                  style: context.textTheme.headline4?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Observer(
                  builder: (_) {
                    return _AddressSearchWidget(
                      key: UniqueKey(),
                      addressSelectedCallback: (place) {
                        controller.goToAddressDetail(place);
                      },
                      place: controller.placeModel,
                    );
                  },
                ),
                const SizedBox(height: 30),
                ListTile(
                  onTap: () => controller.myLocation(),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 30,
                    child: Icon(
                      Icons.near_me,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    'Localização Atual',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                const SizedBox(height: 20),
                Observer(
                  builder: (_) {
                    return Column(
                      children: controller.addresses
                          .map((a) => _AddressItem(
                                onTap: () {
                                  controller.selectAddress(a);
                                },
                                address: a.address,
                                additional: a.additional,
                              ))
                          .toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
