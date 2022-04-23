import 'package:flutter/material.dart';
import 'package:storage_example/data/source/local_source.dart';
import 'package:storage_example/data/source/storage_util1.dart';

class LocalPage extends StatefulWidget {
  const LocalPage({Key? key}) : super(key: key);

  @override
  State<LocalPage> createState() => _LocalPageState();
}

class _LocalPageState extends State<LocalPage> {
  String _lockCode = "";
  late TextEditingController _controller;
  final LocalSource _localSource = LocalSource.instance;

  // final LocalSource1 _localSource = LocalSource1.instance;
  // final LocalSource2 _localSource = LocalSource2.instance;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _lockCode = _localSource.getLock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Source"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              _lockCode,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          TextField(
            controller: _controller,
          ),
          const Spacer(),
          const Divider(height: 1),
          InkWell(
            onTap: () async {
              await _localSource.setLock(_controller.text.toString());
              setState(() {
                _lockCode = _localSource.getLock();
              });
            },
            child: SafeArea(
              minimum: const EdgeInsets.only(top: 12),
              child: Ink(
                height: 48,
                child: const Center(child: Text("SAVE")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
