import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/core/route/router_provider.dart';
import 'package:shopping_app/domain/entities/product.dart';
import 'package:shopping_app/presentation/widgets/product_widget.dart';

List<Widget> recomendedProductList(
  BuildContext context,
  WidgetRef ref, {
  required AsyncValue<List<Product>> products,
  required Function() onSeeAll,
}) =>
    [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Recomended Products',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextButton(
            onPressed: onSeeAll,
            child: const Text('See All'),
          ),
        ],
      ),
      SizedBox(
        child: products.when(
          data: (data) => GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.62,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for (final product in data)
                ProductWidget(
                  product: product,
                  onTap: () {
                    ref
                        .read(routerProvider)
                        .push(Routes.detailProduct.path, extra: product);
                  },
                ),
            ],
          ),
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    ];
