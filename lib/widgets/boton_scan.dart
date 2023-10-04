import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/scan_list_provider.dart';
import 'package:qr_app/utils/utils.dart';

class BotonScan extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed:  () 
    async {
      // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      //                                               '#3D8BEF', 
      //                                               'Cancelar', 
      //                                               false, 
      //                                               ScanMode.QR);
      //final barcodeScanRes='geo:45.280089,-75.9222405';
      final barcodeScanRes='http://fernando.com';
      if (barcodeScanRes==-1)
      {
        return;
      }
     final scanListProvider= Provider.of<ScanListProvider>(context,listen: false);
      final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
      //scanListProvider.nuevoScan('geo:15.33,15.66');
      launchInBrowser(context,nuevoScan);
    },
    child: Icon(Icons.filter_center_focus),);
  }
}