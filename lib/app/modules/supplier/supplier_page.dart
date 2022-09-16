import 'package:cuidapet_mobile_2/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet_mobile_2/app/modules/supplier/widgets/supplier_detail.dart';
import 'package:cuidapet_mobile_2/app/modules/supplier/widgets/supplier_service_widget.dart';
import 'package:flutter/material.dart';

class SupplierPage extends StatefulWidget {
  const SupplierPage({Key? key}) : super(key: key);

  @override
  State<SupplierPage> createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {
  late ScrollController _scrollController;
  final sliverCollapsedVN = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset > 178 &&
          !_scrollController.position.outOfRange) {
        sliverCollapsedVN.value = true;
      } else if (_scrollController.offset <= 178 &&
          !_scrollController.position.outOfRange) {
        sliverCollapsedVN.value = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Fazer Agendamento'),
        icon: const Icon(Icons.schedule),
        backgroundColor: context.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            title: ValueListenableBuilder<bool>(
              valueListenable: sliverCollapsedVN,
              builder: (_, sliverCollapsedValue, child) {
                return Visibility(
                  visible: sliverCollapsedValue,
                  child: const Text(
                    'Clínica Central ABC',
                  ),
                );
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              background: Image.network(
                'https://static1.patasdacasa.com.br/articles/5/16/5/@/376-saiba-tudo-sobre-uma-das-racas-de-cachor-articles_media_mobile-1.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SupplierDetail(),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Serviços (0 selecionados)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 100,
              (context, index) {
                return const SupplierServiceWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
