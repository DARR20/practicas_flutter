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
  ReqRespuesta reqDatos;

  @override
  void initState() {
    super.initState();
    _carga = true;
    reqDatos = ReqRespuesta();
    print('init state respuesta:  ${reqDatos.employees}');
    DataProviderAlt.cargarData().then((respuesta) {
      setState(() {
        reqDatos = respuesta;
        _carga = false;
      });
    });
  }

  Widget listaDatos() {
    print('lista datos respuesta:  ${reqDatos.employees}');
    return Expanded(
      child: ListView.builder(
        itemCount: reqDatos.employees == null ? 0 : reqDatos.employees.length,
        itemBuilder: (BuildContext context, int index) {
          return listaTerminada(index);
        },
      ),
    );
  }

  Widget listaTerminada(int index) {
    print('consulta alt reqDatos: ${reqDatos.employees}');

    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              reqDatos.employees[index].name,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              reqDatos.employees[index].position.toLowerCase(),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_carga ? 'Cargando. . .' : 'Consultar Empleados'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            listaDatos(),
          ],
        ),
      ),
    );
  }
}
