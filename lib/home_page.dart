import 'package:counter_app/second_page.dart';
import 'package:flutter/material.dart';

import 'inherited_counter_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    InheritedCounterWidget? inherited =
        context.dependOnInheritedWidgetOfExactType<InheritedCounterWidget>();

    int counter;

    if (inherited == null) {
      counter = -1;
    } else {
      counter = inherited.counter.value;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter Page 1'),
        actions: [
          IconButton(
            onPressed: () {
              inherited?.counter.decrement();
            },
            icon: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // * Use ValueListenableBuilder
            const Text(
              'You have pushed the button this many times:',
            ),

            Text(
              counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const SecondPage();
            }),
          );
        },
        tooltip: 'Navigate to Page 2',
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
