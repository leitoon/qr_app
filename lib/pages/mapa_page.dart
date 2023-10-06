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
  MapType mapType =MapType.normal;
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    final ScanModel scan = arguments as ScanModel;

   final CameraPosition puntoInicial = CameraPosition(
    target: scan.getLatLng(),
    zoom: 17.5,
    tilt: 50
  );
    //MArcadores
    Set<Marker> markers = new Set<Marker>();
    markers.add(Marker
    (markerId: MarkerId('geo-location'),
    position: scan.getLatLng(),
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Mapa')),
        actions: 
        [
          IconButton(onPressed:
           ()
           async{
            final GoogleMapController controller = await _controller.future;
            await controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(target: scan.getLatLng(),
                zoom: 17.5,
                tilt: 50
                )
                ));
           }, 
          icon: const Icon(Icons.location_history))
        ],
        ),
      body: GoogleMap(
        zoomControlsEnabled: false,
      markers: markers,
      mapType: mapType,
      initialCameraPosition: puntoInicial,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: ()
      {
        if(mapType==MapType.normal)
        {
          mapType=MapType.satellite;
        }
        else{
          mapType= MapType.normal;
        }

        setState(() {
        });
      },
    child: Icon(Icons.layers),
    ),
    );
   
}
}