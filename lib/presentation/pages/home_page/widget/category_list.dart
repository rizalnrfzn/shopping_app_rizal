import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/domain/entities/product_category.dart';
import 'package:shopping_app/presentation/widgets/category_icon.dart';

List<Widget> categoryList(
  BuildContext context, {
  required AsyncValue<List<ProductCategory>> categories,
  required Function() onSeeAll,
}) =>
    [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Categories',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextButton(
            onPressed: onSeeAll,
            child: const Text('See All'),
          ),
        ],
      ),
      SizedBox(
        height: 230,
        child: categories.when(
          data: (data) => GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            childAspectRatio: 7.5 / 10,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            children: [
              ...data.map(
                (e) {
                  return CategoryIcon(
                    category: e,
                    onTap: () {},
                  );
                },
              ),
            ],
          ),
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    ];
