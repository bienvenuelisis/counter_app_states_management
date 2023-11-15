import 'package:counter_app/notifiable_variables.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  void _incrementCounter() {
    setState(() {
      counterNotifiableGlobal.value++;
    });
  }

  @override
  void initState() {
    super.initState();

    // * Add listener to counter global : triggered each time value changed.
    counterNotifiableGlobal.addListener(_listenToChange);
  }

  void _listenToChange() {
    debugPrint(
      "Value has changed _SecondPageState : ${counterNotifiableGlobal.value}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counterNotifiableGlobal.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
