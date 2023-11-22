import 'package:counter_app/home_page.dart';
import 'package:flutter/material.dart';

import 'inherited_counter_widget.dart';

void main() {
  runApp(
    InheritedCounterWidget(
      counter: Counter(0),
      child: const CounterApp(),
    ),
  );
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
