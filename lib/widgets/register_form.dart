import 'package:flutter/material.dart';

// Widget formulario para Registrarse
class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: 'correo@electronico.com',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                  bottom: BorderSide(color: Colors.grey),
                  left: BorderSide(color: Colors.grey),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/flag_pe.png',
                    width: 24,
                    height: 28,
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/arrow-down-b.png',
                    width: 24,
                    height: 28,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text('+51', style: TextStyle(fontSize: 17)),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        style: TextStyle(fontSize: 17),
                        decoration: InputDecoration(
                          hintText: 'Número telefónico',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF409CFF),
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Registrarse',
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
        ),
      ],
    );
  }
}
