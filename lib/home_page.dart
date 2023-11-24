import 'package:counter_app/notifier.dart';
import 'package:counter_app/second_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = counterGlobal.value;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Counter Page 1'),
          actions: [
            IconButton(
              icon: const Icon(Icons.exposure_minus_1),
              onPressed: () {
                context.read<CounterNotifier>().decrement();
              },
            ),
          ]),
      body: Center(
        child: context.watch<CounterNotifier>().loading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // * Use ValueListenableBuilder
                  const Text(
                    'You have pushed the button this many times:',
                  ),

                  Text(
                    context.watch<CounterNotifier>().value.toString(),
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
