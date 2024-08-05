import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/domain/entities/product.dart';

class DetailProductPage extends ConsumerWidget {
  const DetailProductPage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar.large(
                  expandedHeight: 400,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(product.title),
                    titlePadding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    centerTitle: false,
                    background: CachedNetworkImage(
                      imageUrl: product.images[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  actions: const [
                    // CartIcon(),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Price'),
                                Text(
                                  '${product.price.toString()} IDR',
                                  style: textTheme.headlineSmall,
                                )
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_outline),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ...List.generate(
                                5,
                                (index) => const Icon(
                                  Icons.star,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                product.price.toString(),
                                style: textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.description,
                              style: textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 24,
            ),
            decoration: const BoxDecoration(),
            child: Row(
              children: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {},
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 6),
                Text(
                  '0',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(width: 6),
                FilledButton(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${product.price} IDR',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                'Add to cart',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
