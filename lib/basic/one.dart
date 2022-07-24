import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LearnApp extends HookWidget {
  const LearnApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    // final fakeFuture = useFuture(
      
    //       Future.delayed(const Duration(seconds: 1), () => counter.value),
    // );

    // final stream = useMemoized<Stream<int>>(() {
    //   return Stream.periodic(
    //       const Duration(seconds: 1), (data) => counter.value + data);
    // });

    // final streamValue = useStream(
    //   stream,
    // );

    // final valueNotifier = useValueNotifier(5);
    // useEffect(() {
    //   listener() {
    //     print('valueNotifier changed ${valueNotifier.value}');
    //   }

    //   valueNotifier.addListener(listener);
    //   return () => valueNotifier.removeListener(listener);
    // });

    return Scaffold(
      body: ListView(
        children: [
          TextButton(
            child: Text('add state ${counter.value}'),
            onPressed: () {
              counter.value++;
            },
          ),
          // Divider(),
          // TextButton(
          //   child: Text('add valueNotifier ${valueNotifier.value}'),
          //   onPressed: () {
          //     valueNotifier.value++;
          //   },
          // ),
          // Divider(),
          // if (fakeFuture.connectionState == ConnectionState.waiting)
          //   const Text('loading')
          // else if (fakeFuture.hasData)
          //   Text(fakeFuture.data.toString())
          // else if (fakeFuture.hasError)
          //   Text(fakeFuture.error.toString()),
          // Divider(),
          // if (streamValue.hasData) Text(streamValue.data.toString()),
          // if (streamValue.hasError) Text(streamValue.error.toString()),
          // if (streamValue.connectionState == ConnectionState.waiting)
          //   const Text('loading'),
        ],
      ),
    );
  }
}
