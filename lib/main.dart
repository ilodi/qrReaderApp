import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/pages/home_pages.dart';
import 'package:qrreaderapp/src/pages/map_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRRader',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'mapa': (BuildContext context) => MapaPage(),

      },
      //THEMAS GLOBAL
      theme: ThemeData(
        primaryColor: Color.fromRGBO(61, 61, 61, 1.0),
        brightness: Brightness.dark,
      ),
    );
  }
}
