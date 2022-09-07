import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

typedef TryAgain = void Function();

mixin LocationMixin<E extends StatefulWidget> on State<E> {
  void showDialogLocationServiceUnavailable() {
    showDialog(
      context: context,
      builder: (contextDialog) {
        return AlertDialog(
          title: const Text('Precisamos da sua localização'),
          content: const Text(
            'Para realizar a busca da sua localização, precisamos que você ative o GPS.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(contextDialog);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(contextDialog);
                Geolocator.openLocationSettings();
              },
              child: const Text('Abrir Configurações'),
            ),
          ],
        );
      },
    );
  }

  void showDialogLocationDenied({TryAgain? tryAgain}) {
    showDialog(
      context: context,
      builder: (contextDialog) {
        return AlertDialog(
          title: const Text('Precisamos da sua autorização'),
          content: const Text(
            'Para realizar a busca da sua localização, precisamos que você autorize a localização.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(contextDialog);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(contextDialog);
                if (tryAgain != null) {
                  tryAgain();
                }
              },
              child: const Text('Tentar Novamente'),
            ),
          ],
        );
      },
    );
  }

  void showDialogLocationDeniedForever() {
    showDialog(
      context: context,
      builder: (contextDialog) {
        return AlertDialog(
          title: const Text('Precisamos da sua autorização'),
          content: const Text(
            'Para realizar a busca da sua localização, precisamos que você autorize a utilização. Clique no botão Abrir Configurações e autorize a permissão de localização e clique novamente em Localização Atual.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(contextDialog);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(contextDialog);
                Geolocator.openAppSettings();
              },
              child: const Text('Abrir Configurações'),
            ),
          ],
        );
      },
    );
  }
}
