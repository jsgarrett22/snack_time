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
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.blueAccent.shade100),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        centerTitle: true,
        title: Text(
          widget.title,
        ),
      ),
    );
  }
}
