import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImcInput extends StatelessWidget {
  final TextEditingController controller;
  final String iconPath;
  final String hintText;
  final String suffix;

  const ImcInput({
    super.key,
    required this.controller,
    required this.iconPath,
    required this.hintText,
    required this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            height: 24,
            width: 24,
            margin: const EdgeInsets.only(right: 15),
            child: SvgPicture.asset(
              iconPath,
              color: const Color(0xFF32bc9b),
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              controller: controller,
              decoration: InputDecoration(
                suffix: Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(suffix),
                ),
                contentPadding: const EdgeInsets.only(left: 20),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Color(0xFF979797),
                    width: 1,
                  ),
                ),
                hintText: "$hintText ($suffix)",
                hintStyle: const TextStyle(
                  color: Color(0xFF979797),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
