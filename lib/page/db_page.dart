import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:storage_example/data/app_keys.dart';
import 'package:storage_example/data/hive/hive_database.dart';
import 'package:storage_example/data/hive/products.dart';
import 'package:uuid/uuid.dart';

class DbPage extends StatefulWidget {
  const DbPage({Key? key}) : super(key: key);

  @override
  State<DbPage> createState() => _DbPageState();
}

class _DbPageState extends State<DbPage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Database"),
      ),
      body: ValueListenableBuilder<Box<Products>>(
        valueListenable: Hive.box<Products>(AppKeys.db).listenable(),
        builder: (_, box, __) {
          List<Products> ls = box.values.toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(ls[index].name ?? ""),
                        IconButton(
                          onPressed: () {
                            HiveDatabase.instance.deleteProduct(ls[index].id);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemCount: ls.length,
                ),
              ),
              SafeArea(
                minimum: const EdgeInsets.all(8),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        String name = controller.text.toString();
                        var uuid = const Uuid();
                        HiveDatabase.instance.addProduct(
                          Products(id: uuid.v4(), name: name),
                        );
                        setState(() {
                          controller.clear();
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
