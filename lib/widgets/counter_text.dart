import 'package:flutter/material.dart';

class CounterText extends StatelessWidget {
  final String counterText;
  
  const CounterText({
    Key? key,
    required this.counterText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      counterText,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
