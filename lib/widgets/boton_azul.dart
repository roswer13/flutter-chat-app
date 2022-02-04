import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final Function? onPressed;
  final String text;

  const BotonAzul({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: onPressed == null ? Colors.grey[600] : Colors.blue,
      elevation: 2,
      highlightElevation: 5,
      shape: const StadiumBorder(),
      child: SizedBox(
        height: 55,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
      onPressed: onPressed == null ? null : () => onPressed!(),
    );
  }
}
