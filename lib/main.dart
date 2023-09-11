import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/pages/home_page.dart';
import 'package:qr_app/pages/mapa_page.dart';
import 'package:qr_app/providers/uiProvider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=>new UiProvidrer())],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'QR App',
        initialRoute: 'home',
        routes: {
          'home':(_) => HomePage(),
          'mapa':(_) => Mapa_page(),
        } ,
        theme: ThemeData(
          
          floatingActionButtonTheme:FloatingActionButtonThemeData(backgroundColor: Colors.blue), 
    
        ),
      ),
    );
  }
}