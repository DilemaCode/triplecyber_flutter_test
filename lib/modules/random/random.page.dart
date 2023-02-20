import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:triplecyber_test/modules/random/random.controller.dart';

class RandomPage extends StatelessWidget {
  const RandomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RandomController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Numeros Aleatorios'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (controller.randomList.isNotEmpty)
                Expanded(
                    child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                      controller.randomList.length,
                      (i) => Container(
                        width: (Get.width / 2) - 16,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xff22242b),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${controller.randomList[i]}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                )),
              if (controller.randomList.isEmpty)
                const Expanded(
                  child: Center(
                    child: Text('Introduzca un valor'),
                  ),
                ),
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        onFieldSubmitted: (value) => controller.getRandomNumber,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^(20|[1-9]|1[0-9])$')),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        controller: controller.textController,
                        decoration: const InputDecoration(
                            label: Text('Cantidad de numeros')),
                      ),
                    ),
                    IconButton(
                      onPressed: controller.getRandomNumber,
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
