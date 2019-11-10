import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
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
      body: _crearFLutterMap(scan),
    );
  }

  Widget _crearFLutterMap(ScanModel scan) {
    return new FlutterMap(
      options: MapOptions(center: scan.getLatLng(),
      zoom: 10,
  
      ),
  layers: [
    _crearMapa(),
  ],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
       urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1IjoiaWxvZGliaXRzIiwiYSI6ImNrMnNpdXFpYzBqcDMzbW54eWJhNDJ0aXkifQ.w82msNeduaUYHKEsCSfE0Q',
        'id': 'mapbox.Streets',
      }

    );
  }
}
