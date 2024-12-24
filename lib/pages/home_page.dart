import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:store/controller/home_controller.dart';
import 'package:store/pages/add_product_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Footware Admin'),
        ),
        body: ListView.builder(
          itemCount: ctrl.products.length, // Example: Number of items
          itemBuilder: (context, index) {
            return ListTile(
              title:  Text(ctrl.products[index].name ??''),
              subtitle:  Text((ctrl.products[index].price ??'0').toString()),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  ctrl.deletProduct(ctrl.products[index].id ??'');
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(const AddProductPage());
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
