import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:storage_example/data/hive/hive_database.dart';
import 'package:storage_example/data/hive/products.dart';
import 'package:storage_example/data/source/local_source.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:storage_example/data/source/storage_util.dart';
import 'package:storage_example/data/source/storage_util1.dart';

import 'page/home_page.dart';

// flutter pub run flutter_launcher_icons:main
// flutter run -d windows --no-sound-null-safety
// flutter build apk --release --no-sound-null-safety
// flutter build apk --split-per-abi --no-sound-null-safety
// flutter build appbundle --release --no-sound-null-safety
// flutter pub run build_runner watch --delete-conflicting-outputs


void main() async {
  /// initial db
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  await HiveDatabase.getInstance();

  /// local source hive
  await LocalSource.getInstance();

  /// get storage
  await GetStorage.init();
  LocalSource2.getInstance();

  /// Shared Preferences
  await LocalSource1.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
