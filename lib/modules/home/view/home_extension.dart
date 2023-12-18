part of 'home_page.dart';

extension HomeExtension on HomePage {
  Widget _buildBaseMethodUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Các chức năng quản lý',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12.0),
          Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            elevation: 0.0,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              onTap: () {
                Get.toNamed(AppRoutes.productManagementPage);
              },
              leading: const Icon(Icons.badge_outlined),
              title: const Text(
                'Quản lý sản phẩm',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.productManagementPage);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            elevation: 0.0,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              onTap: () {
                Get.toNamed(AppRoutes.doctorManagementPage);
              },
              leading: const Icon(Icons.health_and_safety_outlined),
              title: const Text(
                'Quản lý bác sĩ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.doctorManagementPage);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            elevation: 0.0,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              onTap: () {
                Get.toNamed(AppRoutes.serviceManagementPage);
              },
              leading: const Icon(Icons.medical_services_outlined),
              title: const Text(
                'Quản lý dịch vụ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.serviceManagementPage);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            elevation: 0.0,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              onTap: () {
                Get.toNamed(AppRoutes.bookingManagmentPage);
              },
              leading: const Icon(Icons.event),
              title: const Text(
                'Quản lý đặt lịch',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.bookingManagmentPage);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            elevation: 0.0,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              onTap: () {
                Get.toNamed(AppRoutes.orderManagementPage);
              },
              leading: const Icon(Icons.local_mall_outlined),
              title: const Text(
                'Quản lý mua hàng',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.orderManagementPage);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            elevation: 0.0,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              onTap: () {
                Get.toNamed(AppRoutes.employeeManagementPage);
              },
              leading: const Icon(Icons.person_add_alt_1_outlined),
              title: const Text(
                'Quản lý nhân viên',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.employeeManagementPage);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            elevation: 0.0,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              onTap: () {
                Get.toNamed(AppRoutes.revenueStatisticsPage);
              },
              leading: const Icon(Icons.money),
              title: const Text(
                'Thống kế doanh thu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.revenueStatisticsPage);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
