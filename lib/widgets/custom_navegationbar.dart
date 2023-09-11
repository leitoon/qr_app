
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/uiProvider.dart';

class Customnavegationbar extends StatelessWidget {
   

  @override
  Widget build(BuildContext context) {
    final uiprovider=Provider.of<UiProvidrer>(context);
  final currentIndex=uiprovider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (int i) => uiprovider.selectedMenuOpt=i,
      currentIndex: currentIndex,
      items: 
    [
      BottomNavigationBarItem(icon: Icon(Icons.map),label: 'Mapa'),
       BottomNavigationBarItem(icon: Icon(Icons.compass_calibration),label: 'Direcciones')
    ]);
  }
}