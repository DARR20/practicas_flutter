import 'package:flutter/material.dart';

import 'package:practicas_flutter/src/utils/request_util.dart';

import 'package:practicas_flutter/src/providers/data_provider_alt.dart';

class ConsultarAltPage extends StatefulWidget {
  ConsultarAltPage() : super();

  @override
  _ConsultarAltPageState createState() => _ConsultarAltPageState();
}

class _ConsultarAltPageState extends State<ConsultarAltPage> {
  bool _carga;
  List<dynamic> reqDatos = [];

  @override
  void initState() {
    super.initState();
    _carga = true;

    DataProviderAlt.cargarData().then((respuesta) {
      setState(() {
        reqDatos = respuesta;
        _carga = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_carga ? 'Cargando. . .' : 'Consultar Empleados'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: reqDatos.length,
          itemBuilder: (context, index) {
            List<dynamic> resp = reqDatos;
            return Card(
              child: ListTile(
                title: Text(
                  '${resp[index]["name"]}',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                subtitle: Text(
                  '\n${resp[index]["position"]}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
