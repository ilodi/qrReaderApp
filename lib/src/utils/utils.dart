import 'package:flutter/material.dart';

import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

abrirScan(BuildContext context, ScanModel scan) async {
  if (scan.tipo == 'http') {
    if (await canLaunch(scan.valor)) {
      await launch(scan.valor);
    } else {
      throw 'Could not launch ${scan.valor}';
    }
  } else {
      // y proporciona los argumentos con un parámetro opcional.
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
