import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NumbersCard extends StatelessWidget {
  double? width;
  String text;
  NumbersCard({
    required this.text,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xff22242b),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
