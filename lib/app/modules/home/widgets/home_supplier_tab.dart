part of '../home_page.dart';

class _HomeSupplierTab extends StatelessWidget {
  final HomeController homeController;

  const _HomeSupplierTab({required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HomeTabHeader(homeController: homeController),
        Observer(
          builder: (_) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: homeController.supplierPageTypeSelected ==
                      SupplierPageType.list
                  ? _HomeSupplierList()
                  : _HomeSupplierGrid(),
            );
          },
        ),
      ],
    );
  }
}

class _HomeTabHeader extends StatelessWidget {
  final HomeController homeController;

  const _HomeTabHeader({required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          const Text('Estabelecimentos'),
          const Spacer(),
          InkWell(
            onTap: () {
              homeController.changeTabSupplier(SupplierPageType.list);
            },
            child: Observer(
              builder: (_) {
                return Icon(
                  Icons.view_headline,
                  color: homeController.supplierPageTypeSelected ==
                          SupplierPageType.list
                      ? Colors.black
                      : Colors.grey,
                );
              },
            ),
          ),
          InkWell(
            onTap: () {
              homeController.changeTabSupplier(SupplierPageType.grid);
            },
            child: Observer(
              builder: (_) {
                return Icon(
                  Icons.view_comfy,
                  color: homeController.supplierPageTypeSelected ==
                          SupplierPageType.grid
                      ? Colors.black
                      : Colors.grey,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeSupplierList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Supplier List');
  }
}

class _HomeSupplierGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Supplier Grid');
  }
}
