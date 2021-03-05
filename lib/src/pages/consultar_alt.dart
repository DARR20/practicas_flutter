import 'package:flutter/material.dart';

import 'package:practicas_flutter/src/utils/request_util.dart';

import 'package:practicas_flutter/src/providers/data_provider_alt.dart';

class ConsultarAltPage extends StatefulWidget {
  ConsultarAltPage() : super();

  @override
  _ConsultarAltPageState createState() => _ConsultarAltPageState();
}

class _ConsultarAltPageState extends State<ConsultarAltPage> {
  List<ReqRespuesta> _lista;
  bool _carga;

  @override
  void initState() {
    super.initState();
    _carga = true;
    DataProviderAlt.cargarData().then((respuesta) {
      print('esta es la respuesta. $respuesta');
      _lista = respuesta;
      _carga = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_carga ? 'Cargando. . .' : 'Consultar Empleados'),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            ListView.builder(
              itemBuilder: (context, index) {
                ReqRespuesta resp = _lista[index];

                return ListTile(
                  title: Text(resp.companyName),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
