import 'package:hive/hive.dart';
import 'package:storage_example/data/app_keys.dart';

import 'products.dart';

class HiveDatabase {
  static Box<Products>? _boxFavourite;
  static HiveDatabase instance = HiveDatabase._();

  HiveDatabase._();

  static Future<HiveDatabase> getInstance() async {
    _boxFavourite ??= await Hive.openBox<Products>(AppKeys.db);
    return instance;
  }

  List<Products> products() {
    return (_boxFavourite?.values ?? []).toList();
  }

  Future<void> addProduct(Products product) async {
    await _boxFavourite?.put(product.id, product);
  }

  Future<void> addProduct1(Products product) async {
    await _boxFavourite?.add(product);
  }

  Future<void> deleteProduct(String id) async {
    await _boxFavourite?.delete(id);
  }

  Future<void> clearProduct() async {
    await _boxFavourite?.clear();
  }
}
