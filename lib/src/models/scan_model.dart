import 'package:latlong/latlong.dart';


class ScanModel {
  int id;
  String tipo;
  String valor;

  ScanModel({
    this.id,
    this.tipo,
    this.valor,
  }) {
    if (this.valor.contains('http')) {
      this.tipo = 'http';
    } else {
      this.tipo = 'geo';
    }
  }
//crea una nueva instancia
  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );
//toJson retorna un objeto del mismo tipo
  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };

      //AYUDE A RETORNAR LATLONG
    LatLng  getLatLng(){
        //ignora los primeros 4 caracteres
        //Donde encuentre , creara otra lista
        final lalo = valor.substring(4).split(',');
        final lat = double.parse(lalo[0]);
        final lng = double.parse(lalo[1]);

        return LatLng(lat,lng);
      }
}
