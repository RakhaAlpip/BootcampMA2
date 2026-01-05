import 'package:flutter/material.dart';
// Pastikan nama file ini sesuai dengan yang kamu buat
import 'implicit.dart'; 
import 'explicit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Kita jadikan MyHomePage sebagai menu utama
      home: const MyHomePage(title: 'Menu Animasi Flutter'),
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.play_circle_fill, size: 80, color: Colors.deepPurple),
            const SizedBox(height: 20),
            const Text(
              'Pilih Jenis Animasi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            
            // TOMBOL MENU 1: IMPLICIT
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ImplicitPage()),
                  );
                },
                icon: const Icon(Icons.flash_on),
                label: const Text('Implicit Animation'),
              ),
            ),
            
            const SizedBox(height: 15),

            // TOMBOL MENU 2: EXPLICIT
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExplicitPage()),
                  );
                },
                icon: const Icon(Icons.settings_input_component),
                label: const Text('Explicit Animation'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}