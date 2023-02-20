import 'package:get/get.dart';
import 'package:triplecyber_test/modules/atm_simulator/atm.controller.dart';
import 'package:triplecyber_test/modules/atm_simulator/atm.page.dart';
import 'package:triplecyber_test/modules/coincidences/coincidences.controller.dart';
import 'package:triplecyber_test/modules/coincidences/coincidences.page.dart';
import 'package:triplecyber_test/modules/home/home.page.dart';
import 'package:triplecyber_test/modules/movies/controller/movies.controller.dart';
import 'package:triplecyber_test/modules/movies/pages/movies.page.dart';
import 'package:triplecyber_test/modules/movies/pages/movie.detail.dart';
import 'package:triplecyber_test/modules/odd_numbers/odd.controller.dart';
import 'package:triplecyber_test/modules/odd_numbers/odd.page.dart';
import 'package:triplecyber_test/modules/random/random.controller.dart';
import 'package:triplecyber_test/modules/random/random.page.dart';
import 'package:triplecyber_test/routes/app.routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.Home,
      page: () => const HomeWidget(),
    ),
    GetPage(
      name: AppRoutes.RandomNumbers,
      page: () => const RandomPage(),
      binding: BindingsBuilder(
        () => Get.put<RandomController>(RandomController()),
      ),
    ),
    GetPage(
      name: AppRoutes.OddNumbersList,
      page: () => const OddPage(),
      binding: BindingsBuilder(
        () => Get.put<OddController>(OddController()),
      ),
    ),
    GetPage(
      name: AppRoutes.AtmSimulator,
      page: () => const AtmPage(),
      binding: BindingsBuilder(
        () => Get.put<AtmController>(AtmController()),
      ),
    ),
    GetPage(
      name: AppRoutes.Coincidences,
      page: () => const CoincidencesPage(),
      binding: BindingsBuilder(
        () => Get.put<CoincidencesController>(CoincidencesController()),
      ),
    ),
    GetPage(
      name: AppRoutes.Movies,
      page: () => const MoviesPage(),
      binding: BindingsBuilder(
        () => Get.put<MoviesController>(MoviesController()),
      ),
    ),
    GetPage(
      name: AppRoutes.MoviesDetail,
      page: () =>  const MoviesDetailPage(),
    ),
  ];
}

  
    
    
    
    