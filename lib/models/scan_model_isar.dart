import 'dart:convert';

import 'package:isar/isar.dart';

part 'scan_model_isar.g.dart';

ScanModel2 scanModelFromJson(String str) =>
    ScanModel2.fromJson(json.decode(str));

String scanModelToJson(ScanModel2 data) => json.encode(data.toJson());

@Collection()
class ScanModel2 {
  Id id = Isar.autoIncrement;
  String? tipo;
  String valor;

  ScanModel2({
    required this.id,
    this.tipo,
    required this.valor,
  }) {
    if (valor.contains('http')) {
      valor = 'http';
    } else {
      valor = 'geo';
    }
  }

  factory ScanModel2.fromJson(Map<String, dynamic> json) => ScanModel2(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
