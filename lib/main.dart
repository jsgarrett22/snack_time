import 'package:flutter/material.dart';

void main() {
  runApp(const SnackTime());
}

class SnackTime extends StatelessWidget {
  const SnackTime({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack Time',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 56, 142, 240)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Snack Time'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? first, second, third;
  bool notifications = false;

  void setSnack(String snack, {int slot = 0}) {
    switch (slot) {
      case 0:
        first = snack;
        break;
      case 1:
        second = snack;
        break;
      case 2:
        third = snack;
        break;
      default:
        throw UnimplementedError(
            "There are only 3 slots available to set a snack.");
    }
  }

  String toggleNotifications() {
    String msg = '';
    if (notifications) {
      notifications = false;
      msg = 'disabled';
      return msg;
    } else {
      notifications = true;
      msg = 'enabled';
      return msg;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                icon: const Icon(Icons.notifications),
                tooltip: 'Notifications',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text('Notifications: ${toggleNotifications()}')));
                }),
          )
        ],
        elevation: 1.0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: const Center(
        child: Placeholder(),
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }
}
