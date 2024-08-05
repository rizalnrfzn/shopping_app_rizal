import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/core/route/custom_slide_page_route.dart';
import 'package:shopping_app/domain/entities/product.dart';
import 'package:shopping_app/presentation/pages/categories_page/categories_page.dart';
import 'package:shopping_app/presentation/pages/dashboard_page/dashboard_page.dart';
import 'package:shopping_app/presentation/pages/detail_product_page/detail_product_page.dart';
import 'package:shopping_app/presentation/pages/home_page/home_page.dart';
import 'package:shopping_app/presentation/pages/login_page/login_page.dart';
import 'package:shopping_app/presentation/pages/products_page/products_page.dart';
import 'package:shopping_app/presentation/pages/profile_page/profile_page.dart';
import 'package:shopping_app/presentation/pages/splash_page/splash_page.dart';

part 'router_provider.g.dart';

enum Routes {
  root('/'),
  splash('/splash'),

  login('/login'),

  home('/home'),
  categories('/categories'),
  products('/products'),
  detailProduct('/detail-product'),

  profile('/profile'),
  ;

  final String path;

  const Routes(this.path);
}

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
      initialLocation: Routes.splash.path,
      routes: [
        GoRoute(
          path: Routes.root.path,
          name: Routes.root.name,
          redirect: (context, state) => Routes.splash.path,
        ),
        GoRoute(
          path: Routes.splash.path,
          name: Routes.splash.name,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: Routes.login.path,
          name: Routes.login.name,
          builder: (context, state) => const LoginPage(),
        ),
        ShellRoute(
          builder: (context, state, child) => DashboardPage(
            child: child,
          ),
          routes: [
            GoRoute(
              path: Routes.home.path,
              name: Routes.home.name,
              pageBuilder: (context, state) => CustomSlidePageRoute(
                page: const HomePage(),
              ),
            ),
            GoRoute(
              path: Routes.profile.path,
              name: Routes.profile.name,
              pageBuilder: (context, state) => CustomSlidePageRoute(
                page: const ProfilePage(),
              ),
            ),
          ],
        ),
        GoRoute(
          path: Routes.categories.path,
          name: Routes.categories.name,
          pageBuilder: (context, state) => CustomSlidePageRoute(
            page: const CategoriesPage(),
          ),
        ),
        GoRoute(
          path: Routes.products.path,
          name: Routes.products.name,
          pageBuilder: (context, state) {
            final map = state.extra as Map<String, dynamic>?;
            final title = map?['title'] as String?;

            return CustomSlidePageRoute(
              page: ProductsPage(
                title: title ?? 'All Products',
              ),
            );
          },
        ),
        GoRoute(
          path: Routes.detailProduct.path,
          name: Routes.detailProduct.name,
          pageBuilder: (context, state) {
            final product = state.extra as Product;

            return CustomSlidePageRoute(
              page: DetailProductPage(
                product: product,
              ),
            );
          },
        ),
      ],
    );
