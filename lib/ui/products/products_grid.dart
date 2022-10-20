import 'package:flutter/material.dart';
import 'package:myshop/models/product.dart';
import 'package:provider/provider.dart';

import 'products_grid_tile.dart';
import 'products_manager.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavorites;

  const ProductGrid(this.showFavorites, {super.key});

  @override
  Widget build(BuildContext context) {
    // final productsManager = ProductsManager();
    final products = context.select<ProductsManager, List<Product>>(
        (productManager) => showFavorites
            ? productManager.favoriteItems
            : productManager.items);

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductGridTile(products[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
