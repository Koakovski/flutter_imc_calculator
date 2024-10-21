import 'package:flutter/services.dart';

class _HeightInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (digitsOnly.isEmpty) {
      return const TextEditingValue(text: '');
    }

    final intValue = int.parse(digitsOnly);

    final formattedValue = (intValue / 100).toStringAsFixed(2);

    final moveSelectionToTheEnd =
        TextSelection.collapsed(offset: formattedValue.length);

    return TextEditingValue(
      text: formattedValue,
      selection: moveSelectionToTheEnd,
    );
  }
}

var heightInputFormatter = _HeightInputFormatter();
