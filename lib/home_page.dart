import 'package:counter_app/notifiable_variables.dart';
import 'package:counter_app/second_page.dart';
import 'package:flutter/material.dart';

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

    // * Add listener to counter global : triggered each time value changed.
    counterNotifiableGlobal.addListener(_listenToChange);
  }

  void _listenToChange() {
    debugPrint(
      "Value has changed _MyHomePageState : ${counterNotifiableGlobal.value}",
    );
    setState(() {});
  }

  /* void _changed() {
    debugPrint("Value changed _MyHomePageState : ${counterGlobal.value}");
    setState(() {
      _counter = counterGlobal.value;
    });
  } */

  /* @override
  void dispose() {
    counterGlobal.removeListener(_changed);
    super.dispose();
  }
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter Page 1'),
        actions: [
          IconButton(
            onPressed: () {
              counterNotifiableGlobal.value--;
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
              '${counterNotifiableGlobal.value}',
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
