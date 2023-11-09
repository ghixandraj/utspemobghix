import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;

  CalcButton({
    required this.color,
    required this.textColor,
    required this.buttonText,
    required this.buttonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipOval(
          child: Material(
            color: color,
            child: InkWell(
              onTap: buttonTapped,
              borderRadius: BorderRadius.circular(50), // Menentukan radius lingkaran
              child: SizedBox(
                width: 70, // Sesuaikan dengan ukuran yang diinginkan
                height: 70, // Sesuaikan dengan ukuran yang diinginkan
                child: Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
