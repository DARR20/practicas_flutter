import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practicas_flutter/src/utils/request_util.dart';

class DataProviderAlt {
  static const String resp =
      ('https://raw.githubusercontent.com/sapardo10/content/master/RH.json');

//cargarData() se encarga de extraer información del URL de un json

  static Future<List<ReqRespuesta>> cargarData() async {
    try {
      final response = await http.get(resp);

      if (response.statusCode == 200) {
        final List<ReqRespuesta> respuesta =
            reqRespuestaFromJson(response.body);

        return respuesta;
      } else {
        return List<ReqRespuesta>();
      }
    } catch (e) {
      return List<ReqRespuesta>();
    }
  }
}
