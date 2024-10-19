import 'package:flutter/material.dart';

class ImcDisplay extends StatelessWidget {
  final double? _imc;

  const ImcDisplay(this._imc, {super.key});

  String get imcDisplayText {
    if (_imc == null) {
      return "-";
    }

    return "Seu IMC: ${_imc.toStringAsFixed(1)}";
  }

  String get imcClassificationText {
    if (_imc == null) {
      return "Informe seus dados para o calculo!";
    }

    return imcClassificator(_imc);
  }

  String imcClassificator(double imc) {
    if (imc < 18.5) {
      return "Abaixo do peso";
    } else if (imc >= 18.5 && imc < 25) {
      return "Peso ideal (parabéns)";
    } else if (imc >= 25 && imc < 30) {
      return "Leventemente acima do peso";
    } else if (imc >= 30 && imc < 35) {
      return "Obesidade grau I";
    } else if (imc >= 35 && imc < 40) {
      return "Obesidade grau II (severa)";
    } else {
      return "Obesidade grau III (mórbida)";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              imcDisplayText,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
        Center(
          child: Text(
            imcClassificationText,
            style: const TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
