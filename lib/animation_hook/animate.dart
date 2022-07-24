import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learn_hooks/example/with_hook.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
        duration: const Duration(seconds: 1), initialValue: 1);

    Animation<Offset> offset = useMemoized(() =>
        Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
            .animate(controller));

    useEffect(() {
      controller.repeat(reverse: true);

      Future.delayed(const Duration(seconds: 4), () {
        print("done");
        Route route = MaterialPageRoute(
            builder: (context) => const HomeWidget(
                  duration: Duration(seconds: 1),
                  initText: "ok this is the text",
                ));
        Navigator.of(context).pushReplacement(route);
      });
    });

    return SafeArea(
        child: Scaffold(
      body: Align(
          alignment: Alignment.center,
          child: FadeTransition(
            opacity: controller,
            child: SlideTransition(
                position: offset,
                child: const FlutterLogo(
                  size: 80,
                )),
          )),
    ));
  }
}


// https://www.bacancytechnology.com/blog/flutter-hooks-tutorial