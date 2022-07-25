import 'package:flutter/material.dart';
import 'package:learn_hooks/animation_hook/animate.dart';
import 'package:learn_hooks/basic/onee.dart';
import 'package:learn_hooks/custom_hook/nohook.dart';
import 'package:learn_hooks/custom_hook/todo_page.dart';
import 'package:learn_hooks/example/app.dart' as noHook;
import 'package:learn_hooks/example/with_hook.dart' as useHook;

import 'package:learn_hooks/basic/one.dart';
import 'package:learn_hooks/search_hook/search_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
      // Example2()
      // TODONoHook()??
      // SearchWidgetExample()??
      // TodoPage()??
      TodoPage2()??
      SplashScreen() 
      //     LearnApp() ??

        //   noHook.HomeWidget(
        //     duration: Duration(seconds: 1),
        //     initText: "ok this is the text",
        //   ) 
        // //  ??
        //   useHook.HomeWidget(
        //     duration: Duration(seconds: 1),
        //     initText: "ok this is the text",
        //   ),
    );
  }
}
