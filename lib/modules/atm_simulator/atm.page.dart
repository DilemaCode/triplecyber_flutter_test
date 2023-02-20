import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:triplecyber_test/global/widgets/numbers.card.dart';
import 'package:triplecyber_test/modules/atm_simulator/atm.controller.dart';

class AtmPage extends StatelessWidget {
  const AtmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AtmController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cajero Automatico'),
          ),
          body: controller.isLoading
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Retire su efectivo'),
                      SizedBox(height: 20),
                      CircularProgressIndicator.adaptive(),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (controller.bills.isNotEmpty) ...[
                        const Text('¿Cómo desea recibir su efectivo?'),
                        const SizedBox(height: 20),
                        Expanded(
                          child: Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: controller.bills
                                .map(
                                  (e) => InkWell(
                                    onTap: controller.callLoading,
                                    child: NumbersCard(
                                      text: e,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                      if (controller.bills.isEmpty)
                        const Expanded(
                          child: Center(
                            child: Text('Introduzca un valor'),
                          ),
                        ),
                      SizedBox(height: 20),
                      if (controller.bills.isEmpty)
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                onFieldSubmitted: (value) =>
                                    controller.calculateBills(),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.deny(
                                      RegExp('^0+')),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                controller: controller.textController,
                                decoration: const InputDecoration(
                                    label: Text('Cantidad a retirar'),
                                    prefix: Text('RD\$')),
                              ),
                            ),
                            MaterialButton(
                                onPressed: controller.calculateBills,
                                child: const Icon(Icons.arrow_forward)),
                          ],
                        ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
