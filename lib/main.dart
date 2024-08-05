import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_app/core/hive/hive_provider.dart';
import 'package:shopping_app/domain/entities/token.dart';
import 'package:shopping_app/domain/entities/user.dart';
import 'package:shopping_app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();

  await Hive.initFlutter(appDocumentDir.path);

  Hive
    ..registerAdapter(TokenImplAdapter())
    ..registerAdapter(UserImplAdapter());

  final box = await Hive.openBox('shopping_app');

  runApp(
    ProviderScope(
      overrides: [
        hiveProvider.overrideWithValue(box),
      ],
      child: const MyApp(),
    ),
  );
}
