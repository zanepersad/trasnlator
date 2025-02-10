import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:trasnlator/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            color: Colors.black,
            title: 'Flutter Demo',
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: const Welcome());
      },
    );
  }
}
