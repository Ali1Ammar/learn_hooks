import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learn_hooks/custom_hook/fake_repo.dart';
import 'package:learn_hooks/custom_hook/set_hook_class.dart';

class TodoPage extends HookWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkSet = useSetHook<String>();
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          CheckboxListTile(
            title: const Text('Item 1'),
            value: checkSet.contains("1"),
            onChanged: (value) {
              checkSet.toggle("1");
            },
          ),
          CheckboxListTile(
            title: const Text('Item 3'),
            value: checkSet.contains("3"),
            onChanged: (value) {
              checkSet.toggle("3");
            },
          ),
          CheckboxListTile(
            title: const Text('Item 2'),
            value: checkSet.contains("2"),
            onChanged: (value) {
              checkSet.toggle("2");
            },
          ),
        ],
      ),
    );
  }
}

class TodoPage2 extends HookWidget {
  const TodoPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkSet = useSetHook<int>();

    final repo = useMemoized(() => FakeRepo());
    final data = useFuture<List<Data>>(useMemoized(() => repo.getUsers()));
    useFuture(useMemoized(() {
      return repo.getFavoriteUsers().then((value) {
        for (var element in value) {
          checkSet.add(element.id);
        }
      });
    }));

    final isShowResultPress = useState(false);

    if (data.hasData) {
      final items = data.data!;
      return Scaffold(
        appBar: AppBar(
          title: ElevatedButton(
              onPressed: () {
                isShowResultPress.value = !isShowResultPress.value;
              },
              child: const Text("show result")),
        ),
        body: isShowResultPress.value
            ? ListView(
                children: [
                  ...checkSet.set.map((e) => Text(e.toString()))
                ],
              )
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(items[index].name),
                    value: checkSet.contains(items[index].id),
                    onChanged: (value) {
                      checkSet.toggle(items[index].id);
                    },
                  );
                },
              ),
      );
    }
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
