part of '../home_page.dart';

class _HomeCategoriesWidget extends StatelessWidget {
  final HomeController _controller;

  const _HomeCategoriesWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Observer(
        builder: (_) {
          return Center(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _controller.categoriesList.length,
              itemBuilder: (context, index) {
                final category = _controller.categoriesList[index];

                return _CategoryItem(category, _controller);
              },
            ),
          );
        },
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  static const categoriesIcons = {
    'P': Icons.pets,
    'V': Icons.local_hospital,
    'C': Icons.store_mall_directory,
  };

  final SupplierCategoryModel _categoryModel;
  final HomeController _controller;

  const _CategoryItem(this._categoryModel, this._controller);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _controller.filterSupplierCategory(_categoryModel);
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Observer(
              builder: (_) {
                return CircleAvatar(
                  backgroundColor:
                      _controller.supplierCategoryFilterSelected?.id ==
                              _categoryModel.id
                          ? context.primaryColor
                          : context.primaryColorLight,
                  radius: 30,
                  child: Icon(
                    categoriesIcons[_categoryModel.type],
                    size: 30,
                    color: Colors.black,
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Text(_categoryModel.name),
          ],
        ),
      ),
    );
  }
}
