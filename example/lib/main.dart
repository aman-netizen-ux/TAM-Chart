import 'package:flutter/material.dart';
import 'package:tam_chart/tam_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAM Chart Implementation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TAM Chart Implementation'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("TAM Chart"),
        ),
        body: TAMChart(
            tamChartData: TAMChartData(
                duration: 16,
                tamTextColor: Colors.black,
                samTextColor: Colors.white,
                somTextColor: Colors.black,
                tam: 300,
                sam: 1500,
                som: 750,
                tamColor: Colors.blue.shade100,
                samColor: Colors.blue.shade300,
                somColor: Colors.blue,
                somPosition: SomPositions.top),
            fontSize: 10,
            size: const Size(200, 200)));
  }
}
