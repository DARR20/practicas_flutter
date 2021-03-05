import 'package:flutter/material.dart';
import 'package:practicas_flutter/src/pages/home_page.dart';
import 'package:practicas_flutter/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consultar empleados',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: tomarRutas(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      },
    );
  }
}
