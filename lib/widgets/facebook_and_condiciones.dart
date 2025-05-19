import 'package:flutter/material.dart';

// Widget formulario para Registrar con Facebook y 
// Terminos y Condiciones
class FacebookAndCondiciones extends StatelessWidget {
  const FacebookAndCondiciones({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/facebook_logo.png',
            width: 24, // Ajusta según el tamaño de tu imagen
            height: 24,
          ),
          label: Text(
            'Conectar con Facebook',
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF2672CB),
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Al hacer click, aceptas nuestros términos y condiciones',
          style: TextStyle(fontSize: 12, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
