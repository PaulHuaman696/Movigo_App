import 'package:flutter/material.dart';
import 'dart:async';
import 'package:movigo_app/screens/signup_screen.dart';

class CargaScreen extends StatefulWidget {
  const CargaScreen({super.key});

  @override
  _CargaScreenState createState() => _CargaScreenState();
}

class _CargaScreenState extends State<CargaScreen> {
  @override
  void initState() {
    super.initState();

    // Espera 3 segundos y navega a HomeScreen
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF3B82F6), // fondo azul
          image: const DecorationImage(
            image: AssetImage('assets/images/edificios_sombra.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Logo de la app
              Image.asset(
                'assets/images/movigo_logo.png',
                width: 250,
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(
                color: Colors.white, // para que se vea en fondo azul
              ),
            ],
          ),
        ),
      ),
    );
  }
}
