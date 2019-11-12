import 'dart:async';

import 'package:qrreaderapp/src/bloc/validator.dart';
import 'package:qrreaderapp/src/providers/db_provider.dart';

//MIXINS
class ScansBloc with Validator {
  //patron singleton

  static final ScansBloc _singleton = new ScansBloc._internal();

//Factori retorna una nueva instancia o otra cosa
  factory ScansBloc() {
    return _singleton;
  }

//cuando se crea una nues instancia
  ScansBloc._internal() {
    //Obtener Scans de la base de datos

    //CUANDO SE EJECUTA LA PRIMERA VES obtenersScan

    obtenersScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

//EScuchar data
  Stream<List<ScanModel>> get scansStram => _scansController.stream.transform(validarGeo);
  //streamTransformerts
  Stream<List<ScanModel>> get scansStramHttp => _scansController.stream.transform(validarHttp);

  //CERAR INSTANCIAS CON EL MOTODOS
  dispose() {
    return _scansController?.close();
  }

//OBTENER TODOA La Informacion de los SCANS

  obtenersScans() async {
    //AGREGAR INFO
    _scansController.sink.add(await DBProvider.db.getTodosScans());
  }

  gregarScan(ScanModel scan) async {
    await DBProvider.db.nuevoScan(scan);
    //DESPUES DE BORRAR TODOS SE TRAEN LOS QUE SOBRARON
    obtenersScans();
  }

  borrarScans(int id) async {
    await DBProvider.db.delateScan(id);
    //DESPUES DE BORRAR TODOS SE TRAEN LOS QUE SOBRARON
    obtenersScans();
  }

  borrarcanTODOS() async {
    await DBProvider.db.delateAll();
    //LIMPIR DATOS
    obtenersScans();
  }
}
