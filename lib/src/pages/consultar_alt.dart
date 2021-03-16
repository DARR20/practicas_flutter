import 'package:flutter/material.dart';

import 'package:practicas_flutter/src/providers/data_provider_alt.dart';

class ConsultarAltPage extends StatefulWidget {
  ConsultarAltPage() : super();

  @override
  _ConsultarAltPageState createState() => _ConsultarAltPageState();
}

class _ConsultarAltPageState extends State<ConsultarAltPage> {
  bool _carga, cambiarSwitch;

  List<dynamic> reqDatos = [];
  List<dynamic> listaBusqueda = [];

  bool orden = false;
  String subEmp;

  @override
  void initState() {
    super.initState();
    _carga = true;

    DataProviderAlt.cargarData().then((respuesta) {
      setState(() {
        reqDatos = respuesta;
        listaBusqueda = reqDatos;
        _carga = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_carga ? 'Cargando. . .' : 'Consultar Empleados'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.format_list_numbered),
              onPressed: () {
                setState(() {
                  ordenarLista(listaBusqueda);
                });
              })
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 55.0, bottom: 10.0),
            child: ListView.builder(
              itemCount: listaBusqueda.length,
              itemBuilder: (context, index) {
                List<dynamic> resp = listaBusqueda;
                resp[index]["nuevo"] = false;
                return Card(
                  child: ListTile(
                      title: Text(
                        '${resp[index]["name"]}',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      subtitle: Text(
                        '\n${resp[index]["position"]} || Salario: ${resp[index]["wage"]}',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      onTap: () {
                        _mostrarInformacion(context, resp[index], index);
                      }),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: 'Buscar. . .',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (string) {
                string.toLowerCase();

                setState(() {
                  listaBusqueda = reqDatos.where((busqueda) {
                    var titulos = busqueda['name'].toLowerCase();

                    return titulos.contains(string);
                  }).toList();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void ordenarLista(List<dynamic> lista) {
    //
    lista.sort((a, b) => orden ? a.compareTo(b) : b.compareTo(a));
    orden = !orden;
  }

  void _mostrarInformacion(BuildContext context, dynamic opt, int index) {
    List<dynamic> subEmpleados = opt['employees'];
    if (subEmpleados.length != 0) {
      subEmp = '';

      for (var i = 0; i < subEmpleados.length; i++) {
        subEmp = '$subEmp${subEmpleados[i]['name']}, ';
      }
    } else {
      subEmp = 'Esta persona no tiene empleados a su cargo';
    }

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Container(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Text('Más Información'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'ID: ${opt['id']}\n\nNombre: ${opt['name']}' +
                        '\n\nPuesto: ${opt['position']}\n\nSalario: ${opt['wage']}\n\n' +
                        'Empleados: $subEmp',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          );
        });
  }
}
