import 'package:flutter/material.dart';
import 'pasos.dart';
import 'mapa.dart';

final controller = PageController(
  initialPage: 0);

final pageView = PageView(

  controller:controller,
  children: [
    Pasos()
  ]

);