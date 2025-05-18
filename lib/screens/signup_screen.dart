import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // 0 = Registrarse, 1 = Login
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Parte superior azul con logo y tabs
          Container(
            width: double.infinity,
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: Color(0xFF3B82F6),
              image: DecorationImage(
                image: AssetImage('assets/images/edificios_sombra.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/images/movigo_logo.png', width: 250),
                SizedBox(height: 10),
                SizedBox(height: 30),

                // Tabs interactivos
                Container(
                  padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Registrarse',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      selectedTab == 0
                                          ? Colors.black
                                          : Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ), // Espaciado entre texto y línea
                              if (selectedTab == 0)
                                Container(
                                  width: 37,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF3B82F6),
                                    borderRadius: BorderRadius.circular(2.5),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTab = 1;
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      selectedTab == 1
                                          ? Colors.black
                                          : Colors.grey,
                                ),
                              ),
                              SizedBox(height: 6),
                              if (selectedTab == 1)
                                Container(
                                  width: 37,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF3B82F6),
                                    borderRadius: BorderRadius.circular(2.5),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Línea separadora después de los tabs
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: 3,
                  color: Color(0xFFEFEFF4),
                ),
              ],
            ),
          ),

          // Parte inferior (formulario y extras)
          Expanded(
            child: Container(
              color: Color(0xFFF8F8F8),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 280,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'correo@electronico.com',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 12,
                                ),
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
                                      Text(
                                        '+51',
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: TextField(
                                          keyboardType: TextInputType.phone,
                                          style: TextStyle(fontSize: 17),
                                          decoration: InputDecoration(
                                            hintText: 'Número telefónico',
                                            border:
                                                InputBorder
                                                    .none, // Para que no duplique bordes
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
                              style: TextStyle(
                                color: Colors.white,

                                fontSize: 19,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
