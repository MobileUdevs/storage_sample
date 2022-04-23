import 'package:flutter/material.dart';
import 'package:storage_example/page/db_page.dart';
import 'package:storage_example/page/local_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Storage"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Divider(height: 1),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const LocalPage(),
                ),
              );
            },
            child: Ink(
              height: 48,
              child: const Center(child: Text("Local Source")),
            ),
          ),
          const Divider(height: 1),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const DbPage(),
                ),
              );
            },
            child: Ink(
              height: 48,
              child: const Center(child: Text("Database")),
            ),
          ),
          const Divider(height: 1),
        ],
      ),
    );
  }
}
