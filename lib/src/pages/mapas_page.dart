import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/bloc/scans_bloc.dart';
import 'package:qrreaderapp/src/providers/db_provider.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:qrreaderapp/src/utils/utils.dart' as utils;

class MapasPage extends StatelessWidget {
  final scansBloc = new ScansBloc();

  @override

  //Este Metodo se dispara cada ves que se dibuja este widget
  Widget build(BuildContext context) {
    //cargar los registros
    scansBloc.obtenersScans();
    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scansStram,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final scans = snapshot.data;

        if (scans.length == 0) {
          return Center(
            child: Text('No hay info'),
          );
        }

        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context, i) => Dismissible(
            //UniqueKey Crear una llave unica
            key: UniqueKey(),

            background: Container(
              color: Color.fromRGBO(232, 65, 24, 1.0),
            ),
            //onDismissed metodo al lama al hacr el slder
            onDismissed: (direction) => ScansBloc().borrarScans(scans[i].id),
            child: ListTile(
              leading: Icon(
                Icons.cloud_queue,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(scans[i].valor),
              subtitle: Text('ID: ${scans[i].id}'),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.teal),
              onTap: () => utils.abrirScan(context,scans[i]),
            ),
          ),
        );
      },
    );
  }
}
