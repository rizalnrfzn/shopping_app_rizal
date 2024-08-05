import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/core/hive/hive_provider.dart';

part 'theme_provider.g.dart';

enum Themes {
  system(themeMode: ThemeMode.system, code: 'system'),
  light(themeMode: ThemeMode.light, code: 'light'),
  dark(themeMode: ThemeMode.dark, code: 'dark'),
  ;

  final ThemeMode themeMode;
  final String code;

  const Themes({required this.themeMode, required this.code});
}

@riverpod
class Theme extends _$Theme {
  @override
  Themes build() {
    final theme = getTheme();

    return theme;
  }

  Themes getTheme() {
    final box = ref.read(hiveProvider);

    final String themeCode = box.get('theme') ?? Themes.system.code;

    final theme = Themes.values.firstWhere(
      (element) => element.code == themeCode,
      orElse: () => Themes.system,
    );

    return theme;
  }

  void setTheme(Themes theme) {
    final box = ref.read(hiveProvider);

    box.put('theme', theme.code);

    state = theme;
  }
}
