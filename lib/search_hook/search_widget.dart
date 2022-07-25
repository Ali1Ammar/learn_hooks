import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learn_hooks/search_hook/fake_repo.dart';

class SearchWidgetExample extends HookWidget {
  const SearchWidgetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repo = useMemoized(() => FakeRepo());
    final data = useMemoized(() => repo.getData());
    final controller = useTextEditingController();
    useListenable(controller);
    final focusNode = useFocusNode();
    final searchEnable = useState(false);
    useEffect(() {
      onChange() {
        if (searchEnable.value) {
          focusNode.requestFocus();
        } else {
          focusNode.unfocus();
        }
      }

      searchEnable.addListener(onChange);
      return () => searchEnable.removeListener(onChange);
    }, const []);
  
    final searchResult =
        useMemoized(() => repo.search(controller.text), [controller.text]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Hook'),
        actions: [
          IconButton(
              onPressed: () {
                searchEnable.value = !searchEnable.value;
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Column(
        children: [
          Visibility(
            visible: searchEnable.value,
            child: TextField(
              controller: controller,
              focusNode: focusNode,
            ),
          ),
          if (searchEnable.value)
            Expanded(
              child: ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchResult[index]),
                  );
                },
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index]),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
