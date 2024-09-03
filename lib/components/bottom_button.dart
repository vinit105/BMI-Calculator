import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key, required this.label, required this.onInputTap});

  final String label;
  final Function() onInputTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onInputTap,
      child: Container(
        color: Colors.purpleAccent,
        width: double.infinity,
        height: 80,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
                fontSize: 38, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
