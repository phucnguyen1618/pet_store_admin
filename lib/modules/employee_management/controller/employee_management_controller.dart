import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/models/account.dart';
import 'package:pet_store_admin/shared/services/firebase_service.dart';

class EmployeeManagementController extends GetxController {
  final _firebaseAuth = FirebaseAuth.instance;

  RxList<Account> employees = RxList<Account>();

  @override
  void onInit() {
    getEmployeeList();
    super.onInit();
  }

  Future<void> getEmployeeList() async {
    employees.value = await FirebaseService.getEmployees();
  }

  void onCreateAccount(String email, String name) async {
    List<Account> accounts = await FirebaseService.getAccounts();
    bool isExists = accounts.where((acc) => acc.email == email).isNotEmpty;
    if (isExists) {
      Account account = accounts.where((acc) => acc.email == email).first;
      Account accountData = Account(id: account.id, email: email, name: name);
      FirebaseService.writeAccountToDb(accountData);
      employees.add(account);
      EasyLoading.showToast('Thêm nhân viên thành công');
    } else {
      _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: '12345678')
          .then((value) {
        if (value.user != null) {
          Account accountData =
              Account(id: value.user!.uid, email: email, name: name);
          FirebaseService.writeAccountToDb(accountData);
          employees.add(accountData);
          EasyLoading.showToast('Thêm nhân viên thành công');
        }
      });
    }
  }

  void onDeleteAccount(String idEmployee) async {
    employees.removeWhere((e) => e.id == idEmployee);
    FirebaseService.removeEmployeeByID(idEmployee);
  }
}
