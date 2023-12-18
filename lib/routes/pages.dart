import 'package:get/get.dart';
import 'package:pet_store_admin/modules/add_doctor/binding/add_doctor_binding.dart';
import 'package:pet_store_admin/modules/add_doctor/view/add_doctor_page.dart';
import 'package:pet_store_admin/modules/add_product/binding/add_product_binding.dart';
import 'package:pet_store_admin/modules/add_product/view/add_product_page.dart';
import 'package:pet_store_admin/modules/add_service/binding/add_service_binding.dart';
import 'package:pet_store_admin/modules/add_service/view/add_service_page.dart';
import 'package:pet_store_admin/modules/booking_management/binding/booking_managment_binding.dart';
import 'package:pet_store_admin/modules/booking_management/view/booking_management_page.dart';
import 'package:pet_store_admin/modules/confirm_service_order/binding/confirm_service_order_binding.dart';
import 'package:pet_store_admin/modules/confirm_service_order/view/confirm_service_order_page.dart';
import 'package:pet_store_admin/modules/doctor_management/binding/doctor_management_binding.dart';
import 'package:pet_store_admin/modules/doctor_management/view/doctor_management_page.dart';
import 'package:pet_store_admin/modules/employee_management/binding/employee_management_binding.dart';
import 'package:pet_store_admin/modules/employee_management/view/employee_management_page.dart';
import 'package:pet_store_admin/modules/home/binding/home_binding.dart';
import 'package:pet_store_admin/modules/home/view/home_page.dart';
import 'package:pet_store_admin/modules/order_management/binding/order_management_binding.dart';
import 'package:pet_store_admin/modules/order_management/view/order_management_page.dart';
import 'package:pet_store_admin/modules/product_management/binding/product_management_binding.dart';
import 'package:pet_store_admin/modules/product_management/view/product_management_page.dart';
import 'package:pet_store_admin/modules/revenue_statistics/binding/revenue_statistics_binding.dart';
import 'package:pet_store_admin/modules/revenue_statistics/view/revenue_statistics_page.dart';
import 'package:pet_store_admin/modules/service_management/binding/service_management_binding.dart';
import 'package:pet_store_admin/modules/service_management/view/service_management_page.dart';
import 'package:pet_store_admin/modules/sign_in/binding/sign_in_binding.dart';
import 'package:pet_store_admin/modules/sign_in/view/sign_in_page.dart';
import 'package:pet_store_admin/modules/splash/binding/splash_binding.dart';
import 'package:pet_store_admin/modules/splash/view/splash_page.dart';

import 'app_routes.dart';

final pages = [
  GetPage(
    name: AppRoutes.splashPage,
    page: () => const SplashPage(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: AppRoutes.signInPage,
    page: () => const SignInPage(),
    binding: SignInBinding(),
  ),
  GetPage(
    name: AppRoutes.homePage,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: AppRoutes.productManagementPage,
    page: () => const ProductManagementPage(),
    binding: ProductManagementBinding(),
  ),
  GetPage(
    name: AppRoutes.serviceManagementPage,
    page: () => const ServiceManagementPage(),
    binding: ServiceManagementBinding(),
  ),
  GetPage(
    name: AppRoutes.addProductPage,
    page: () => const AddProductPage(),
    binding: AddProductBinding(),
  ),
  GetPage(
    name: AppRoutes.addServicePage,
    page: () => const AddServicePage(),
    binding: AddServiceBinding(),
  ),
  GetPage(
    name: AppRoutes.doctorManagementPage,
    page: () => const DoctorManagementPage(),
    binding: DoctorManagementBinding(),
  ),
  GetPage(
    name: AppRoutes.orderManagementPage,
    page: () => const OrderManagementPage(),
    binding: OrderManagementBinding(),
  ),
  GetPage(
    name: AppRoutes.bookingManagmentPage,
    page: () => const BookingManagementPage(),
    binding: BookingManagmentBinding(),
  ),
  GetPage(
    name: AppRoutes.employeeManagementPage,
    page: () => const EmployeeManagementPage(),
    binding: EmployeeManagementBinding(),
  ),
  GetPage(
    name: AppRoutes.revenueStatisticsPage,
    page: () => const RevenueStatisticsPage(),
    binding: RevenueStatisticsBinding(),
  ),
  GetPage(
    name: AppRoutes.addDoctorPage,
    page: () => const AddDoctorPage(),
    binding: AddDoctorBinding(),
  ),
  GetPage(
    name: AppRoutes.confirmServiceOrderPage,
    page: () => const ConfirmServiceOrderPage(),
    binding: ConfirmServiceOrderBinding(),
  ),
];
