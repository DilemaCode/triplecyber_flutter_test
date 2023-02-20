import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triplecyber_test/global/widgets/numbers.card.dart';
import 'package:triplecyber_test/global/widgets/subtitle.dart';
import 'package:triplecyber_test/modules/coincidences/coincidences.controller.dart';

class CoincidencesPage extends StatelessWidget {
  const CoincidencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoincidencesController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Coincidencias'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubTilte(text: 'Numeros Primos'),
                      SubTilte(text: controller.oddList.length.toString()),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: controller.oddList
                        .map(
                          (e) => NumbersCard(
                            text: e.toString(),
                            width: (Get.width / 4) - 16,
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubTilte(text: 'Numeros Fibonacci'),
                      SubTilte(text: controller.fibonacci.length.toString()),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: controller.fibonacci
                            .map(
                              (e) => NumbersCard(
                                text: e.toString(),
                                width: (Get.width / 2) - 16,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
