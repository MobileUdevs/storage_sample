import 'package:hive/hive.dart';

part 'products.g.dart';

@HiveType(typeId: 1, adapterName: "ProductAdapter")
class Products extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String? name;

  Products({
    required this.id,
    this.name,
  });
}
