import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton(
      {super.key, required this.iconLabel, required this.onInputPress});

  final IconData iconLabel;
  final Function() onInputPress;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onInputPress,
      icon: Icon(
        iconLabel,
        size: 50.0,
        color: Colors.white,
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const CircleBorder(),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.black12),
      ),
    );
  }
}
