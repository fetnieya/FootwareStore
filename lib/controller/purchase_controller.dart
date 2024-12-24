import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_client/controller/login_controller.dart';
import 'package:store_client/model/user/user.dart';

class PurchaseController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference orderCollection;
  TextEditingController adressController = TextEditingController();

  double orderPrice = 0;
  String itemName = '';
  String orderAdress = '';

  @override
  void onInit() {
    orderCollection = firestore.collection('orders');
    super.onInit();
  }

  // Define submitOrder properly
  void submitOrder({
    required double price,
    required String item,
    required String description,
  }) {
    orderPrice = price;
    itemName = item;
    orderAdress = adressController.text;

    orderSucsses(transactionId: "someTransactionId");  // Example call with transactionId
  }

  Future<void> orderSucsses({required String? transactionId}) async {
    try {
      // Ensure that user is logged in
      User? loginUser = Get.find<LoginController>().loginUser;


      // Check if address is empty
      if (orderAdress.isEmpty) {
        // Show error Snackbar if address is empty
        throw Exception('Please enter your address!');
      }

      // Store order details in Firestore
      await orderCollection.add({
        'Customer': loginUser?.name??'',
        'phone': loginUser?.number??'',
        'item': itemName,
        'price': orderPrice,
        'address': orderAdress,
        'transactionId': transactionId,
        'dateTime': DateTime.now().toString(),
      });

      // Show success Snackbar
      Get.snackbar('Success', 'Order created successfully', colorText: Colors.green);

      // Optionally, print the order details here as well.
      print('Order Details: $orderPrice $itemName $orderAdress $transactionId');

    } catch (e) {
      // Show error Snackbar if exception is thrown
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }
}
