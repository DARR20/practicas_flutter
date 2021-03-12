import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practicas_flutter/src/utils/request_util.dart';

class DataProviderAlt {
  static const String resp =
      ('https://raw.githubusercontent.com/sapardo10/content/master/RH.json');

//cargarData() se encarga de extraer información del URL de un json

  static Future<ReqRespuesta> cargarData() async {
    try {
      final response = await http.get(resp);

      return parseData(response.body);

      //return respuesta;

    } catch (e) {
      print('Error: ${e.toString()}');

      return ReqRespuesta();
    }
  }

  static ReqRespuesta parseData(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<ReqRespuestaEmployee> datos = parsed
        .map<ReqRespuesta>((json) => ReqRespuesta.fromJson(json))
        .toList();

    ReqRespuesta reqDatos = ReqRespuesta();
    reqDatos.employees = datos;
    return reqDatos;
  }
}
