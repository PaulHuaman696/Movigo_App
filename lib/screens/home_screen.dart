import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? _controller;
  LatLng _ubicacionActual = LatLng(-12.046374, -77.042793); // Lima, Perú por defecto
  bool _loading = true;
  bool _permisoConcedido = false;

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  Future<void> _initLocation() async {
    await _requestPermission();
    if (_permisoConcedido) {
      await _getCurrentLocation();
    }
    setState(() {
      _loading = false;
    });
  }

  Future<void> _requestPermission() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      _permisoConcedido = true;
    } else if (status.isDenied) {
      _permisoConcedido = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Permiso de ubicación denegado.")),
      );
    } else if (status.isPermanentlyDenied) {
      _permisoConcedido = false;
      await openAppSettings();
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _ubicacionActual = LatLng(position.latitude, position.longitude);
      });
      if (_controller != null) {
        _controller!.animateCamera(
          CameraUpdate.newLatLng(_ubicacionActual),
        );
      }
    } catch (e) {
      print("Error obteniendo la ubicación: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al obtener la ubicación.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _ubicacionActual,
              zoom: 15,
            ),
            myLocationEnabled: _permisoConcedido,
            myLocationButtonEnabled: _permisoConcedido,
            onMapCreated: (controller) {
              _controller = controller;
            },
            circles: {
              Circle(
                circleId: const CircleId('circle_ubicacion'),
                center: _ubicacionActual,
                radius: 150,
                fillColor: Colors.blue.withOpacity(0.2),
                strokeColor: Colors.blue.withOpacity(0.5),
                strokeWidth: 2,
              ),
            },
            markers: {
              Marker(
                markerId: const MarkerId('marker_ubicacion'),
                position: _ubicacionActual,
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
              ),
            },
          ),
          Positioned(
            bottom: 300,
            right: 15,
            child: FloatingActionButton(
              onPressed: () {
                if (_controller != null) {
                  _controller!.animateCamera(
                    CameraUpdate.newLatLng(_ubicacionActual),
                  );
                }
              },
              backgroundColor: Colors.white,
              child: const Icon(Icons.my_location, color: Colors.black),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: const [
                          Icon(Icons.circle, size: 14, color: Colors.blue),
                          SizedBox(height: 20),
                          Icon(Icons.location_on, size: 24, color: Colors.red),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'INICIO',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Ubicación Actual',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'DESTINO',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Jr. 28 de Marzo #133',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _chipLabel('Multiservicios Lukita'),
                      _chipLabel('Discoteca Jangueo'),
                      _chipLabel('U.N.A.S.'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chipLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(fontSize: 14)),
    );
  }
}
