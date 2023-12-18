import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pet_store_admin/models/account.dart';
import 'package:pet_store_admin/models/booking.dart';
import 'package:pet_store_admin/models/doctor.dart';
import 'package:pet_store_admin/models/service.dart';

import '../../models/order.dart';
import '../../models/product.dart';
import '../constants/app_constants.dart';

class FirebaseService {
  static final _auth = FirebaseAuth.instance;
  static final _database = FirebaseDatabase.instance;
  static final _storage = FirebaseStorage.instance;

  //Auth
  static Future<void> signIn(
    String email,
    String password,
    Function(User) onSuccess,
    Function(String) onError,
  ) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (value.user != null) {
          onSuccess(value.user!);
        }
      });
    } on FirebaseAuthException catch (error) {
      log('Log: ${error.code} - ${error.message}');
      String message;
      switch (error.code) {
        case 'invalid-email':
          message = 'Email không hợp lệ';
          break;
        case 'user-not-found':
          message = 'Tài khoản không tồn tại';
          break;
        case 'wrong-password':
          message = 'Mật khẩu không đúng';
          break;
        case 'invalid-credential':
          message = 'Tài khoản không tồn tại';
          break;
        default:
          message = 'Đã có lỗi xảy ra. Vui lòng đăng nhập lại';
          break;
      }
      onError(message);
    }
  }

  static void signOut(
    Function() onSuccess,
    Function(String) onError,
  ) {
    _auth
        .signOut()
        .then((value) => onSuccess())
        .onError((error, stackTrace) => onError(error.toString()));
  }

  static User? getCurrentUser() {
    return _auth.currentUser;
  }

  //Products
  static Future<List<Product>> getProducts() async {
    List<Product> dataList = [];
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    final snapshot = await dbRef.child('Products').get();
    for (DataSnapshot dataSnapshot in snapshot.children) {
      final dataMap =
          jsonDecode(jsonEncode(dataSnapshot.value)) as Map<String, dynamic>;
      Product product = Product.fromJson(dataMap);
      dataList.add(product);
    }
    return dataList;
  }

  static void writeProductToDb(Product product) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Products').child(product.idProduct).set(product.toJson());
  }

  static void updateProduct(String id, Map<String, dynamic> data) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Products').child(id).update(data);
  }

  static void removeProductFromDb(String idProduct) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Products').child(idProduct).remove();
  }

  static void uploadImageProduct(
    String id,
    File file,
    Function(String) onSuccess,
    Function(String) onError,
  ) {
    EasyLoading.show(status: 'Đang upload hình ảnh');
    final storageRef = _storage.refFromURL(AppConstants.storageUrl);
    storageRef
        .child('/products')
        .child(id)
        .putFile(file)
        .then((taskSnapshot) async {
      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      if (imageUrl.isNotEmpty) {
        EasyLoading.dismiss();
        onSuccess(imageUrl);
      }
    }).onError((error, stackTrace) => onError(error.toString()));
  }

  //Services
  static Future<List<Service>> getServices() async {
    List<Service> services = [];
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    final snapshot = await dbRef.child('Services').get();
    for (DataSnapshot dataSnapshot in snapshot.children) {
      final dataMap =
          jsonDecode(jsonEncode(dataSnapshot.value)) as Map<String, dynamic>;
      final Service service = Service.fromJson(dataMap);
      services.add(service);
    }
    return services;
  }

  static void writeServiceToDb(Service service) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Services').child(service.idService).set(service.toJson());
  }

  static void removeServiceFromDb(String idService) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Services').child(idService).remove();
  }

  static void updateService(String id, Map<String, dynamic> data) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Services').child(id).update(data);
  }

  static void getServiceByID(String idService, Function(Service) onComplete) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Services').child(idService).get().then((snapshot) {
      final data =
          jsonDecode(jsonEncode(snapshot.value)) as Map<String, dynamic>;
      Service dataService = Service.fromJson(data);
      onComplete(dataService);
    });
  }

  static void uploadImageService(
    String id,
    File file,
    Function(String) onSuccess,
    Function(String) onError,
  ) {
    EasyLoading.show(status: 'Đang upload hình ảnh');
    final storageRef = _storage.refFromURL(AppConstants.storageUrl);
    storageRef
        .child('/services')
        .child(id)
        .putFile(file)
        .then((taskSnapshot) async {
      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      if (imageUrl.isNotEmpty) {
        EasyLoading.dismiss();
        onSuccess(imageUrl);
      }
    }).onError((error, stackTrace) => onError(error.toString()));
  }

  //Accounts
  static void writeAccountToDb(Account account) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Employees').child(account.id).set(account.toJson());
  }

  static void getAccountByID({
    required String id,
    required Function(Account) onSuccess,
    required Function(String) onError,
  }) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Accounts').child(id).get().then((snapshot) {
      if (snapshot.exists) {
        final data =
            jsonDecode(jsonEncode(snapshot.value)) as Map<String, dynamic>;
        Account account = Account.fromJson(data);
        onSuccess(account);
      }
    }).onError((error, stackTrace) => onError(error.toString()));
  }

  static Future<List<Account>> getAccounts() async {
    List<Account> accounts = [];
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    DataSnapshot snapshot = await dbRef.child('Accounts').get();
    for (DataSnapshot dataSnapshot in snapshot.children) {
      if (dataSnapshot.exists) {
        final data =
            jsonDecode(jsonEncode(dataSnapshot.value)) as Map<String, dynamic>;
        Account account = Account.fromJson(data);
        accounts.add(account);
      }
    }
    return accounts;
  }

  static Future<List<Account>> getEmployees() async {
    List<Account> employees = [];
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    DataSnapshot snapshot = await dbRef.child('Employees').get();
    for (DataSnapshot dataSnapshot in snapshot.children) {
      if (dataSnapshot.exists) {
        final data =
            jsonDecode(jsonEncode(dataSnapshot.value)) as Map<String, dynamic>;
        Account account = Account.fromJson(data);
        employees.add(account);
      }
    }
    return employees;
  }

  static void removeEmployeeByID(String id) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Employees').child(id).remove();
  }

  //Orders
  static Future<List<Order>> getOrders() async {
    List<Order> orders = [];
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    final snapshot = await dbRef.child('Orders').get();
    for (DataSnapshot dataSnapshot in snapshot.children) {
      for (DataSnapshot data in dataSnapshot.children) {
        final result =
            jsonDecode(jsonEncode(data.value)) as Map<String, dynamic>;
        Order order = Order.fromJson(result);
        orders.add(order);
      }
    }
    return orders;
  }

  static Future<void> getProductByID(
    String id,
    Function(Product) onComplete,
    Function(String) onError,
  ) async {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Products').child(id).get().then((snapshot) {
      final result =
          jsonDecode(jsonEncode(snapshot.value)) as Map<String, dynamic>;
      Product product = Product.fromJson(result);
      onComplete(product);
    }).onError((error, stackTrace) => onError(error.toString()));
  }

  //BookingServices
  static Future<List<Booking>> getBookingServices() async {
    List<Booking> bookingList = [];
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    final snapshot = await dbRef.child('BookingServices').get();
    for (DataSnapshot dataSnapshot in snapshot.children) {
      for (DataSnapshot data in dataSnapshot.children) {
        final result =
            jsonDecode(jsonEncode(data.value)) as Map<String, dynamic>;
        Booking booking = Booking.fromJson(result);
        bookingList.add(booking);
      }
    }
    return bookingList;
  }

  static void confirmBookingService(String idUser, String idBooking) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef
        .child('BookingServices')
        .child(idUser)
        .child(idBooking)
        .update({"status": 1});
  }

  static void confirmOrder(String idUser, String idOrder) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Orders').child(idUser).child(idOrder).update({"status": 1});
  }

  static void cancelOrder(String idUser, String idOrder) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Orders').child(idUser).child(idOrder).update({"status": 2});
  }

  static void cancelBookingService(
    String idUser,
    String idOrder,
    String reason,
  ) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('BookingServices').child(idUser).child(idOrder).update({
      "status": 2,
      "reason": reason,
    });
  }

  //Doctor

  static void getDoctors(
    Function(List<Doctor>) onComplete,
    Function(String) onError,
  ) {
    List<Doctor> doctors = [];
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Doctors').get().then((snasphot) {
      for (DataSnapshot dataSnapshot in snasphot.children) {
        final data = jsonDecode(jsonEncode(dataSnapshot.value));
        Doctor doctor = Doctor.fromJson(data);
        doctors.add(doctor);
        onComplete(doctors);
      }
    }).onError((error, stackTrace) => onError(error.toString()));
  }

  static void uploadImageDoctor(
    String id,
    File file,
    Function(String) onSuccess,
    Function(String) onError,
  ) {
    EasyLoading.show(status: 'Đang upload hình ảnh');
    final storageRef = _storage.refFromURL(AppConstants.storageUrl);
    storageRef
        .child('/doctors')
        .child(id)
        .putFile(file)
        .then((taskSnapshot) async {
      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      if (imageUrl.isNotEmpty) {
        EasyLoading.dismiss();
        onSuccess(imageUrl);
      }
    }).onError((error, stackTrace) => onError(error.toString()));
  }

  static void writeDoctorToDb(Doctor doctor) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Doctors').child(doctor.id).set(doctor.toJson());
  }

  static void removeDoctor(String idDoctor) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Doctors').child(idDoctor).remove();
  }

  static void getDoctorByID(
    String id,
    Function(Doctor) onComplete,
    Function(String) onError,
  ) {
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Doctors').child(id).get().then((snasphot) {
      final data = jsonDecode(jsonEncode(snasphot.value));
      Doctor doctor = Doctor.fromJson(data);
      onComplete(doctor);
    }).onError((error, stackTrace) => onError(error.toString()));
  }

  //Orders
  static Future<void> getRequestOrders(
    Function(List<Order>) onComplete,
    Function(String) onError,
  ) async {
    List<Order> orders = [];
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('Orders').get().then((snapshot) {
      for (DataSnapshot dataSnapshot in snapshot.children) {
        for (DataSnapshot data in dataSnapshot.children) {
          final result =
              jsonDecode(jsonEncode(data.value)) as Map<String, dynamic>;
          Order order = Order.fromJson(result);
          orders.add(order);
          onComplete(orders);
        }
      }
    }).onError((error, stackTrace) => onError(error.toString()));
  }

  static Future<void> getRequestBookingLList(
    Function(List<Booking>) onComplete,
    Function(String) onError,
  ) async {
    List<Booking> bookingList = [];
    final dbRef = _database.refFromURL(AppConstants.dbUrl);
    dbRef.child('BookingServices').get().then((snapshot) {
      for (DataSnapshot dataSnapshot in snapshot.children) {
        for (DataSnapshot data in dataSnapshot.children) {
          final result =
              jsonDecode(jsonEncode(data.value)) as Map<String, dynamic>;
          Booking booking = Booking.fromJson(result);
          bookingList.add(booking);
          onComplete(bookingList);
        }
      }
    }).onError((error, stackTrace) => onError(error.toString()));
  }
}
