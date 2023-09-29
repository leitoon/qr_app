import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/pages/direcciones.dart';
import 'package:qr_app/pages/mapas_page.dart';
import 'package:qr_app/providers/scan_list_provider.dart';
import 'package:qr_app/providers/uiProvider.dart';
import 'package:qr_app/widgets/boton_scan.dart';
import 'package:qr_app/widgets/custom_navegationbar.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(title: Text('Historial'),
      actions: [IconButton(onPressed: (){}, 
      icon: Icon(Icons.delete_forever_outlined))],), 
      
       body: _HomePageBody(),
        bottomNavigationBar: Customnavegationbar(),
        floatingActionButton: BotonScan(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    //obtener el current
    final uiprovider=Provider.of<UiProvidrer>(context);
    final currentindex=uiprovider.selectedMenuOpt;
   //final tempScan= ScanModel(valor: 'http://google.com');
    //DBProvider.db.nuevoScan(tempScan);
    //DBProvider.db.getTodosScans().then((scan) => print);
    //DBProvider.db.deleteAllScan().then(print);
// Usar el ScanListProvider
final scanListProvider=Provider.of<ScanListProvider>(context,listen: false);

    switch(currentindex)
    {
      case 0:
      scanListProvider.cargarScanPorTipo('geo');
        return MapasPage();
      case 1:
      scanListProvider.cargarScanPorTipo('http');
        return DireccionesPage();  
      default:
      return MapasPage();
    }
  }
}