import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:triplecyber_test/global/widgets/numbers.card.dart';
import 'package:triplecyber_test/modules/odd_numbers/odd.controller.dart';

class OddPage extends StatelessWidget {
  const OddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OddController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Numeros Primos'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (controller.oddList.isNotEmpty)
                Expanded(
                    child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: controller.oddList
                        .map(
                          (e) => NumbersCard(
                            text: e.toString(),
                            width: (Get.width / 2) - 16,
                          ),
                        )
                        .toList(),
                  ),
                )),
              if (controller.oddList.isEmpty)
                const Expanded(
                  child: Center(
                    child: Text('Introduzca un valor'),
                  ),
                ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onFieldSubmitted: (value) =>
                          controller.getOddRandomNumber(),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^(100|[1-9][0-9]|[1-9])$')),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: controller.textController,
                      decoration: const InputDecoration(
                          label: Text('Cantidad de numeros')),
                    ),
                  ),
                  MaterialButton(
                      onPressed: controller.getOddRandomNumber,
                      child: const Icon(Icons.arrow_forward)),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
