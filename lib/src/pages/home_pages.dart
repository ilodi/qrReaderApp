import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/bloc/scans_bloc.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:qrreaderapp/src/pages/direciones_page.dart';
import 'package:qrreaderapp/src/pages/mapas_page.dart';
import 'package:qrreaderapp/src/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Aqui van las variables

  final scansBloc = new ScansBloc();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qr'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              scansBloc.borrarcanTODOS();
            },
            icon: Icon(Icons.delete_forever),
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigatorBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => _scanQR(context),
      ),
    );
  }

  _scanQR(BuildContext context) async {
//https://www.udemy.com/
//geo:40.71304393430148,-74.04679670771486
    String furueString = 'https://www.udemy.com/';
/* 
    try {
      furueString = await new QRCodeReader().scan();
    } catch (e) {
      furueString = e.toString();
    }

    print('Future: $furueString');
*/
    if (furueString != null) {
      final scan = ScanModel(valor: furueString);
      scansBloc.gregarScan(scan);

      final scan2 =
          ScanModel(valor: 'geo:40.71304393430148,-74.04679670771486');
      scansBloc.gregarScan(scan2);

//ESPERAR EN IOS UNA FUNCION
      if (Platform.isIOS) {
        Future.delayed(Duration(milliseconds: 750), () {
          utils.abrirScan(context, scan);
        });
      } else {
        utils.abrirScan(context, scan);
      }
    }
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }

  Widget _crearBottomNavigatorBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Maps')),
        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5), title: Text('Dirreciones'))
      ],
    );
  }
}
