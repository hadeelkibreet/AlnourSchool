import 'package:flutter/material.dart';

import 'core/splash_page/splash.dart';

class AlnourApp extends StatelessWidget {
  const AlnourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Splashpage(),
    );
  }
}
