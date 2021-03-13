import 'package:flutter/material.dart';
import 'package:practicas_flutter/src/providers/data_provider.dart';

class ConsultaEmpleadoPage extends StatefulWidget {
  @override
  _ConsultaEmpleadoPageState createState() => _ConsultaEmpleadoPageState();
}

class _ConsultaEmpleadoPageState extends State<ConsultaEmpleadoPage> {
  Future<List<dynamic>> empleados = dataProvider.cargarData();

  bool buscador = false, cambiarSwitch = false;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar Empleados'),
      ),
      body: Stack(children: [
        _listaEmpleados(),
        _crearInput(buscador),
      ]),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.search),
          onPressed: () {
            if (buscador == false) {
              buscador = true;
            } else {
              buscador = false;
            }

            setState(() {});
          }),
    );
  }

  Widget _listaEmpleados() {
    return FutureBuilder(
      future: empleados,
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          padding: EdgeInsets.symmetric(vertical: 60.0),
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      opt['Nuevo'] = false;
      //print(opt);
      final widgetTemp = Card(
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            ListTile(
                leading: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.blue.shade200,
                  size: 45.0,
                ),
                title: Text(
                  '\n${opt['name']}',
                  style: TextStyle(fontSize: 25.0),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.blue,
                  iconSize: 34.0,
                  onPressed: () {
                    _mostrarAlert(context, opt);
                  },
                ),
              ],
            ),
          ],
        ),
      );

      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }

  Widget _crearInput(bool buscar) {
    return Container(
      color: Colors.white,
      child: TextField(
          autofocus: buscar,
          enabled: buscar,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.white,
            enabled: buscar,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Buscar. . .',
            suffixIcon: Icon(Icons.search),
          ),
          onChanged: (text) {
            text = text.toLowerCase();
            setState(() {});
          }),
    );
  }

  void _mostrarAlert(BuildContext context, dynamic opt) {
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
                    'ID: ${opt['id']}\n\nNombre: ${opt['name']}\n\nPuesto: ${opt['position']}\n\nSalario: ${opt['wage']}\n\n${opt['Nuevo']}',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  _crearSwitch(opt),
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          );
        });
  }

  Widget _crearSwitch(dynamic opt) {
    return Container(
      child: SwitchListTile(
        title: Text('Marcar como Nuevo'),
        value: cambiarSwitch = opt['Nuevo'],
        onChanged: (_valor) {
          if (opt['Nuevo'] == false) {
            opt.update("Nuevo", (value) => value = true);
          } else {
            opt.update("Nuevo", (value) => value = false);
          }

          setState(() {
            cambiarSwitch = opt['Nuevo'];
          });
        },
      ),
    );
  }
}
