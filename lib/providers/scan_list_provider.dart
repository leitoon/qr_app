
import 'package:flutter/material.dart';
import 'package:qr_app/providers/dbProvider.dart';


class ScanListProvider extends ChangeNotifier
{
  List<ScanModel> scans =[];
  String tiposeleccionado='http';

  nuevoScan(String valor) async 
  {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    //asignar el ID de la base de datos al modelo
    nuevoScan.id=id;
    if(tiposeleccionado==nuevoScan.valor)
    {
      scans.add(nuevoScan);
      notifyListeners();
    }
  }
  cargarScans() async
  {
    final scans = await DBProvider.db.getTodosScans();
    this.scans=[...?scans];
    notifyListeners();
  }
  cargarScanPorTipo(String tipo) async
  {
    final scans = await DBProvider.db.getScansPortipo(tipo);
    this.scans=[...?scans];
    tiposeleccionado=tipo;
    notifyListeners();
  }
  borrarTodos () async
  {
    await DBProvider.db.deleteAllScan();
    scans=[];
    notifyListeners();
  }
  borrarScanPorId(int id) async
  {
    await DBProvider.db.deleteScan(id);
    cargarScanPorTipo(tiposeleccionado);
  }
  
}