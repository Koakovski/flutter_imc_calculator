import "dart:math";
import "package:calculadora_imc/screens/components/calculate_imc_button.dart";
import "package:calculadora_imc/screens/components/imc_display.dart";
import "package:calculadora_imc/screens/components/imc_input.dart";
import "package:calculadora_imc/screens/components/custom_title.dart";
import "package:calculadora_imc/screens/input_formatters/digits_only_input_formatter.dart";
import "package:calculadora_imc/screens/input_formatters/height_input_formatter.dart";
import "package:flutter/material.dart";

class ImcCalculatorScreen extends StatefulWidget {
  const ImcCalculatorScreen({super.key});

  @override
  State<ImcCalculatorScreen> createState() => _ImcCalculatorScreenState();
}

class _ImcCalculatorScreenState extends State<ImcCalculatorScreen> {
  final _weightController = TextEditingController();
  final _heigthController = TextEditingController();
  double? _imc;

  void calculateIMC() {
    double weight = double.parse(_weightController.text);
    double heigth = double.parse(_heigthController.text);

    setState(() {
      _imc = weight / pow(heigth, 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    ImcInput weightInput = ImcInput(
      hintText: "Informe seu peso",
      suffix: "kg",
      controller: _weightController,
      iconPath: "assets/icons/weight_scale.svg",
      textFormatters: [digitsOnlyFormatter],
    );

    ImcInput heightInput = ImcInput(
      hintText: "Informe sua altura",
      suffix: "m",
      controller: _heigthController,
      iconPath: "assets/icons/height.svg",
      textFormatters: [heightInputFormatter],
    );

    return Scaffold(
      backgroundColor: const Color(0xF2F2F2F2),
      body: Center(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              children: [
                const CustomTitle("Calculadora IMC"),
                weightInput,
                heightInput,
                CalculateImcButton(onPressed: calculateIMC),
                ImcDisplay(_imc)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
