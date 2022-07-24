import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeWidget extends HookWidget {
  final Duration duration;
  final String initText;
  const HomeWidget({Key? key, required this.duration, required this.initText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: duration);
    final controllerText = useTextEditingController(text: initText);
  
    return Scaffold(
      body: ListView(
        children: [
          TextField(
            controller: controllerText,
          ),
          TextButton(
            child: const Text('Animate'),
            onPressed: () {
              controller.forward(from: 0);
            },
          ),
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Text(
                '${controller.value}',
                style: Theme.of(context).textTheme.headline4,
              );
            },
          ),
        ],
      ),
    );
  }
}
