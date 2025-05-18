import 'package:flutter/material.dart';
import 'package:movigo_app/screens/signup_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Abel', // ✅ Aplica Abel globalmente
      ),
      home: const SignUpScreen(),
    ),
  );
}

class MovigoApp extends StatelessWidget {
  const MovigoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movigo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenido a Movigo 🚖')),
      body: const Center(
        child: Text(
          'Movilidad compartida, inteligente y justa 💙',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

