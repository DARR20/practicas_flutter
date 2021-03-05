import 'package:flutter/material.dart';

//este archivo define los iconos de las listas

final _icons = <String, IconData>{
  'account_circle': Icons.account_circle,
  'reduce_capacity_outlined': Icons.reduce_capacity_outlined,
};

Icon getIcon(String nombreIcono) {
  return Icon(
    _icons[nombreIcono],
    color: Colors.pink,
    size: 40.0,
  );
}
