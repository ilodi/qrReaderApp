import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:flutter_map/flutter_map.dart';

class MapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Extrae los argumentos de la propiedad settings del ModalRoute actual y lo convierte
    // en un objeto ScreenArguments.
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cordenadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Text(scan.valor ),
      ),
    );
  }
}
