import 'package:flutter/material.dart';

class TODONoHook extends StatefulWidget {
  const TODONoHook({Key? key}) : super(key: key);

  @override
  State<TODONoHook> createState() => _TODONoHookState();
}

class _TODONoHookState extends State<TODONoHook> {
  Set set = {};

  add(val) {
    set.add(val);
  }

  toggle(val) {
    setState(() {
      if (contains(val)) {
        remove(val);
      } else {
        add(val);
      }
    });
  }

  remove(val) {
    set.remove(val);
  }

  bool contains(val) => set.contains(val);

  List getChecked() => set.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          CheckboxListTile(
            title: const Text('Item 1'),
            value: contains("1"),
            onChanged: (value) {
              toggle("1");
            },
          ),
          CheckboxListTile(
            title: const Text('Item 3'),
            value: contains("3"),
            onChanged: (value) {
              toggle("3");
            },
          ),
          CheckboxListTile(
            title: const Text('Item 2'),
            value: contains("2"),
            onChanged: (value) {
              toggle("2");
            },
          ),
        ],
      ),
    );
  }
}
