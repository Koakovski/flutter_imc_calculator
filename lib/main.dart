import 'package:calculadora_imc/screens/imc_calculator_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
    ),
    home: const ImcCalculatorScreen(),
  ));
}
