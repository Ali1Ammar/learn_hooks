import 'dart:async';

import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  final Duration duration;
  final String initText;
  const HomeWidget({Key? key, required this.duration, required this.initText})
      : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
      
  late TextEditingController _controllerText;
  late AnimationController _controller;
  // late StreamSubscription streamSub;
  // late String streamValue;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controllerText = TextEditingController(text: widget.initText);
    // streamSub = Stream.periodic(const Duration(seconds: 1)).listen((event) {
    //   setState(() {
    //     streamValue = event;
    //   });
    // });
  }

  @override
  void didUpdateWidget(HomeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duration != oldWidget.duration) {
      _controller.duration = widget.duration;
    }
    if (widget.initText != oldWidget.initText) {
      _controllerText.text = widget.initText;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerText.dispose();
    // streamSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextField(
            controller: _controllerText,
          ),
          TextButton(
            child: Text('Animate'),
            onPressed: () {
              _controller.forward(from: 0);
            },
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Text(
                '${_controller.value}',
                style: Theme.of(context).textTheme.headline4,
              );
            },
          ),
        ],
      ),
    );
  }
}
