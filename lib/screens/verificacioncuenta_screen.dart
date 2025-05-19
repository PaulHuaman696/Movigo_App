import 'package:flutter/material.dart';
import 'package:movigo_app/screens/home_screen.dart';

class VerificacionCuentaScreen extends StatefulWidget {
  const VerificacionCuentaScreen({super.key});

  @override
  State<VerificacionCuentaScreen> createState() =>
      _VerificacionCuentaScreenState();
}

class _VerificacionCuentaScreenState extends State<VerificacionCuentaScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var c in _controllers) c.dispose();
    for (var f in _focusNodes) f.dispose();
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.length == 1 && index < 3) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  void _verificar() {
    String codigo = _controllers.map((c) => c.text).join();
    if (codigo.length == 4) {
      // Navegar a home (MapaScreen)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingresa los 4 dígitos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final azul = const Color(0xFF3B82F6);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: azul,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/icon_back_white.png',
            width: 24,
            height: 24,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: null,
      ),
      body: Column(
        children: [
          // Parte azul con título y subtítulo
          Container(
            width: double.infinity,
            color: azul,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Verificación de Teléfono',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Ingresa tu código de verificación',
                  style: TextStyle(color: Colors.white70, fontSize: 17),
                ),
              ],
            ),
          ),

          // Parte blanca con campos y botón
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return SizedBox(
                        width: 50,
                        child: TextField(
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          autofocus: index == 0,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: const TextStyle(fontSize: 24),
                          decoration: const InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) => _onChanged(index, value),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: _verificar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: azul,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Verificar',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
