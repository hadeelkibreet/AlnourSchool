import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final Object e;
  final StackTrace? trace;
  const ErrorScreen({Key? key, required this.e, this.trace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DefaultTextStyle(style: TextStyle(),
              child: Text(e.toString())),
          DefaultTextStyle(style: TextStyle(),
              child: Text(trace.toString())),
        ],),
    );
  }
}
