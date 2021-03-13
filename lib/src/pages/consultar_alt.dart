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
  List<ReqRespuesta> reqDatos = [];

  @override
  void initState() {
    super.initState();
    _carga = true;

    DataProviderAlt.cargarData().then((respuesta) {
      setState(() {
        reqDatos = respuesta;
        print('init state respuesta:  $reqDatos');
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
          itemBuilder: (context, index) {
            ReqRespuesta resp = reqDatos[1];
            return ListTile(
              title: Text(resp.employees[index].name),
            );
          },
        ),
      ),
    );
  }
}
