import 'package:get/get.dart';
import 'package:job_interview/modules/views/details_page.dart';

import '../modules/bindings/details_binding.dart';
import '../modules/bindings/home_binding.dart';
import '../modules/views/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.details,
      page: () => const DetailsPage(),
      binding: DetailsBinding(),
    ),
  ];
}