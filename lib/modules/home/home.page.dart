// ignore_for_file: void_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triplecyber_test/global/controllers/global.controller.dart';
import 'package:triplecyber_test/routes/app.routes.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff393b48),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        titleSpacing: 8,
        toolbarHeight: kToolbarHeight * 2,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Bienvenido',
              style: TextStyle(fontSize: 40),
            ),
            Text(
              'TripleCyber',
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          heightFactor: 1.07,
          child:
              // const SizedBox(height: 30),
              Wrap(
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 10,
            spacing: 10,
            children: [
              itemButtom(
                icon: Icons.repeat,
                label: 'Random Numbers',
                navigateTo: () => Get.toNamed(AppRoutes.RandomNumbers),
              ),
              itemButtom(
                icon: Icons.looks_3_outlined,
                label: 'Odd Numbers',
                navigateTo: () => Get.toNamed(AppRoutes.OddNumbersList),
              ),
              itemButtom(
                icon: Icons.attach_money,
                label: 'Atm Simulator',
                navigateTo: () => Get.toNamed(AppRoutes.AtmSimulator),
              ),
              itemButtom(
                icon: Icons.replay,
                label: 'Coincidences',
                navigateTo: () {
                  if(GlobalController.instance.randomList.isEmpty){ 
                    Get.snackbar('Inaccesible', 'Primero debe generar los numeros random', backgroundColor: Colors.black);
                    return;
                  }
                  Get.toNamed(AppRoutes.Coincidences);
                },
              ),
              itemButtom(
                icon: Icons.tv,
                label: 'Movies Api',
                navigateTo: () => Get.toNamed(AppRoutes.Movies),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemButtom({
    required IconData icon,
    required String label,
    required void Function() navigateTo,
  }) {
    return InkWell(
      onTap: navigateTo,
      child: Container(
        width: Get.width / 2.2,
        height: Get.width / 2.5,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: const Color(0xff404551),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 45),
                SizedBox(height: 20),
                Text(
                  label,
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.arrow_forward,
                  size: 18,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
