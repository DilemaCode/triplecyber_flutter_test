import 'package:flutter/material.dart';

class SubTilte extends StatelessWidget {
  String text;
  SubTilte({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis),
    );
  }
}
