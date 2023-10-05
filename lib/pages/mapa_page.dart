import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_app/providers/dbProvider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa_page extends StatefulWidget {
  
  @override
  State<Mapa_page> createState() => _Mapa_pageState();
}

class _Mapa_pageState extends State<Mapa_page> {
  Completer<GoogleMapController> _controller=Completer();
  
  @override
  Widget build(BuildContext context) {

   final CameraPosition puntoInicial = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
     final arguments = ModalRoute.of(context)!.settings.arguments;
 
    if (arguments != null) {
      final ScanModel scan = arguments as ScanModel;
 
      return Scaffold(
        appBar: AppBar(title: const Text('Mapa')),
        body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      );
    }
 
    return Scaffold(
      appBar: AppBar(title: const Text('NO DATA')),
    );
}
}