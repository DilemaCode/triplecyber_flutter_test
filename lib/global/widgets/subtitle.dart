import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
