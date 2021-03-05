import 'dart:convert';

import 'package:http/http.dart' as http;

class _DataProvider {
  List<dynamic> opciones = [];

  _DataProvider() {
    //cargarData();
  }

//cargarData() se encarga de extraer información del URL de un json

  Future<List<dynamic>> cargarData() async {
    final resp =
        ('https://raw.githubusercontent.com/sapardo10/content/master/RH.json');

    await http.get(resp).then((res) {
      Map<String, dynamic> dataMap = json.decode(res.body);

      opciones = dataMap['employees'];
    });

    return opciones;
  }
}

final dataProvider = new _DataProvider();
