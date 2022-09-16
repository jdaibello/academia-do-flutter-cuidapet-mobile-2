import 'package:cuidapet_mobile_2/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class SupplierServiceWidget extends StatelessWidget {
  const SupplierServiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.pets),
      ),
      title: const Text('Banho'),
      subtitle: const Text(r'R$ 10,00'),
      trailing: Icon(
        Icons.add_circle,
        size: 30,
        color: context.primaryColor,
      ),
    );
  }
}
