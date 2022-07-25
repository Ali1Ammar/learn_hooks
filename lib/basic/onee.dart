import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Example2 extends HookWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    final future = useMemoized(
        () => Future.delayed(Duration(seconds: 2), () => counter.value * 2),
        [counter.value]);
    final snap = useFuture(future);
    final stream = useMemoized(
        () => Stream.periodic(
            Duration(seconds: 1), (data) => counter.value + data),
        [counter.value]);
    final streamValue = useStream(stream);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text('${snap.data} ${snap.connectionState} '),
          Text('${streamValue.data} ${streamValue.connectionState} '),
          TextButton(
            child: Text('add state ${counter.value}'),
            onPressed: () {
              counter.value++;
            },
          ),
          TextButton(
            child: Text('-- state ${counter.value}'),
            onPressed: () {
              counter.value--;
            },
          ),
        ],
      ),
    );
  }
}
