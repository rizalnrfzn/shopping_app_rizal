import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/presentation/provider/product/category_data_provider.dart';
import 'package:shopping_app/presentation/widgets/category_icon.dart';

class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 6.2 / 10,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: ref.read(categoryDataProvider).value!.length,
        itemBuilder: (context, index) => CategoryIcon(
          category: ref.read(categoryDataProvider).value![index],
          onTap: () {},
        ),
      ),
    );
  }
}
