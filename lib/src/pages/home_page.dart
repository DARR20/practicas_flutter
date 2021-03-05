import 'package:flutter/material.dart';
import 'package:practicas_flutter/src/providers/menu_provider.dart';
import 'package:practicas_flutter/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Los yoyos'),
      ),
      body: _lista(),
    );
  }

//_lista() usa una estancia de menuProvider para extraer informaciòn del json local
//genera los parametros para ejecutar _listaItems()

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

//el metodo _listaItems() genera y da formato a los items de la lista con la información de archivo json
//al agregar un navigator en el onTap() podemos usar los items para movernos por la app

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
          title: Text(opt['texto']),
          leading: getIcon(opt['icon']),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {
            Navigator.pushNamed(context, opt['ruta']);
          });

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
