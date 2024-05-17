import 'package:flutter/material.dart';

class HalamanCoba extends StatefulWidget {
  const HalamanCoba({super.key});

  @override
  State<HalamanCoba> createState() => _HalamanCobaState();
}

class _HalamanCobaState extends State<HalamanCoba> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: InteractiveViewer(
        scaleEnabled: true,
        panEnabled: true,
        constrained: false,
        minScale: 0.5,
        maxScale: 2.0,
        child: Image.asset(
          'assets/image/interactifmap1.png',
          fit: BoxFit.contain, // Mengisi layar
        ),
      ),
      ),
    );
  }
}
