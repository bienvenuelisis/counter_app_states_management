import 'package:counter_app/second_page.dart';
import 'package:counter_app/variables.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = counterGlobal.value;

  @override
  void initState() {
    super.initState();

    // * Add listener to counter global : triggered each time value changed.
    counterGlobal.addListener(_changed);
  }

  void _changed() {
    debugPrint("Value changed _MyHomePageState : ${counterGlobal.value}");
    setState(() {
      _counter = counterGlobal.value;
    });
  }

  @override
  void dispose() {
    counterGlobal.removeListener(_changed);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // * Use ValueListenableBuilder
            const Text(
              'You have pushed the button this many times:',
            ),
            /* ValueListenableBuilder(
              valueListenable: counterGlobal,
              builder: (context, value, child) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ), */
            Text(
              '$_counter',
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

          /* Future.delayed(const Duration(seconds: 5), () {
            setState(() {});
          }); */
        },
        tooltip: 'Navigate to Page 2',
        child: const Icon(Icons.arrow_forward_ios),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
