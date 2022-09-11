import 'package:cuidapet_mobile_2/app/core/life_cycle/page_life_cycle_state.dart';
import 'package:cuidapet_mobile_2/app/entities/address_entity.dart';
import 'package:cuidapet_mobile_2/app/modules/home/home_controller.dart';
import 'package:cuidapet_mobile_2/app/modules/home/widgets/home_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageLifeCycleState<HomeController, HomePage> {
  AddressEntity? addressEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: const Drawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            const HomeAppBar(),
          ];
        },
        body: Container(),
      ),
    );
  }
}
