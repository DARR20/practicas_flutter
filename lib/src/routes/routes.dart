import 'package:flutter/material.dart';
import 'package:practicas_flutter/src/pages/consultar_empleado_page.dart';
//import 'package:practicas_flutter/src/pages/consultar_alt.dart';
import 'package:practicas_flutter/src/pages/home_page.dart';

Map<String, WidgetBuilder> tomarRutas() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'consulta': (BuildContext context) => ConsultaEmpleadoPage(),
    // 'subempleados': (BuildContext context) => ConsultarAltPage(),
  };
}
