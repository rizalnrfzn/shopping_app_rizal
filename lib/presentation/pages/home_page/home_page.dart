import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/core/route/router_provider.dart';
import 'package:shopping_app/presentation/pages/home_page/widget/category_list.dart';
import 'package:shopping_app/presentation/pages/home_page/widget/recomended_product_list.dart';
import 'package:shopping_app/presentation/provider/product/category_data_provider.dart';
import 'package:shopping_app/presentation/provider/product/product_data_provider.dart';
import 'package:shopping_app/presentation/provider/user_data/user_data_provider.dart';
import 'package:shopping_app/utils/extensions/context_extension.dart';
import 'package:shopping_app/utils/methods/methods.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (previous != null && next is AsyncData && next.value == null) {
          ref.read(routerProvider).go(Routes.login.path);
        } else if (next is AsyncError) {
          context.showSnackBar(next.error.toString());
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(userDataProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          ...categoryList(
            context,
            categories: ref.watch(categoryDataProvider),
            onSeeAll: () {
              ref.read(routerProvider).push(Routes.categories.path);
            },
          ),
          verticalSpace(12),
          ...recomendedProductList(
            context,
            ref,
            products: ref.watch(productDataProvider),
            onSeeAll: () {
              ref.read(routerProvider).push(Routes.products.path);
            },
          ),
        ],
      ),
    );
  }
}
