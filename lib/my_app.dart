import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/core/route/router_provider.dart';
import 'package:shopping_app/core/theme/style.dart';
import 'package:shopping_app/core/theme/theme_provider.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      // theme
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: ref.watch(themeProvider).themeMode,

      // route
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
    );
  }
}
