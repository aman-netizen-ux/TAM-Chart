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
                tamTextColor: Colors.white,
                samTextColor: Colors.black12,
                tmTextColor: Colors.deepPurpleAccent,
                tam: 300,
                sam: 1500,
                tm: 750,
                tamColor: Colors.yellow,
                samColor: Colors.white,
                tmColor: Colors.pink,
                tamPosition: TamPositions.bottom),
            fontSize: 10,
            size: const Size(200, 200))
        );
  }
}
