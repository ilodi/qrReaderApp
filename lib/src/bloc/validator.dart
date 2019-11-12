import 'dart:async';

import 'package:qrreaderapp/src/models/scan_model.dart';
//MIXINS strams

class Validator {
  //va a entrar cierta informaicon y va a salir otra diferente
  //entra una lista y sale una misma
  final validarGeo = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
      handleData: (scans, sink) {
    //que tipo de transformacion es
    final geoScans = scans.where((s) => s.tipo == 'geo').toList();
    //Agregar al sink 
    sink.add(geoScans);
  });

    final validarHttp = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
      handleData: (scans, sink) {
    //que tipo de transformacion es
    final geoScans = scans.where((s) => s.tipo == 'http').toList();
    //Agregar al sink 
    sink.add(geoScans);
  });
}
