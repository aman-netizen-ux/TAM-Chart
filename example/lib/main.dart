import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:tam_chart/tam_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  final GlobalKey _chartKey = GlobalKey();

  Future<void> _exportChart() async {
    final Uint8List? imageBytes = await TAMChartExport.captureAsImage(_chartKey);
    if (!mounted) return;

    if (imageBytes != null) {
      final imageSaved = await TAMChartExport.saveImageToFile(imageBytes);

      if (!mounted) return;

      if (imageSaved == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Chart successfully downloaded')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to download chart.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to capture chart.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: RepaintBoundary(
          key: _chartKey,
          child: TAMChart(
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
              somPosition: SomPositions.top,
            ),
            fontSize: 10,
            size: const Size(200, 200),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _exportChart,
        icon: const Icon(Icons.download),
        label: const Text("Export"),
      ),
    );
  }
}
