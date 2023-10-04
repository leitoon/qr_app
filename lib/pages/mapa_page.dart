import 'package:flutter/material.dart';
import 'package:qr_app/providers/dbProvider.dart';

class Mapa_page extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
     final arguments = ModalRoute.of(context)!.settings.arguments;
 
    if (arguments != null) {
      final ScanModel scan = arguments as ScanModel;
 
      return Scaffold(
        appBar: AppBar(title: const Text('Mapa')),
        body: Center(
          child: Text(scan.valor),
        ),
      );
    }
 
    return Scaffold(
      appBar: AppBar(title: const Text('NO DATA')),
    );
}
}