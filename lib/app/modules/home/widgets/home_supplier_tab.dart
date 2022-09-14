part of '../home_page.dart';

class _HomeSupplierTab extends StatelessWidget {
  final HomeController homeController;

  const _HomeSupplierTab({required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HomeTabHeader(homeController: homeController),
        Expanded(
          child: Observer(
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
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 10,
            (context, index) {
              return _HomeSupplierListItemWidget();
            },
          ),
        ),
      ],
    );
  }
}

class _HomeSupplierListItemWidget extends StatelessWidget {
  const _HomeSupplierListItemWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            width: 1.sw,
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Clínica Central ABC',
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: const [
                            Icon(
                              Icons.location_on,
                              size: 16,
                            ),
                            Text('1.54 Km de distância'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundColor: context.primaryColor,
                    maxRadius: 15,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[100]!,
                  width: 5,
                ),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://static1.patasdacasa.com.br/articles/5/16/5/@/376-saiba-tudo-sobre-uma-das-racas-de-cachor-articles_media_mobile-1.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeSupplierGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Supplier Grid');
  }
}
