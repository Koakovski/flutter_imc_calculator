import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String _title;

  const CustomTitle(this._title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Text(
        _title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
      ),
    );
  }
}
