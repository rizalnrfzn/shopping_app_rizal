import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/presentation/provider/product/product_data_provider.dart';
import 'package:shopping_app/presentation/widgets/product_widget.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.62,
        children: [
          for (final product in ref.read(productDataProvider).value!)
            ProductWidget(
              product: product,
              onTap: () {},
            ),
        ],
      ),
    );
  }
}
