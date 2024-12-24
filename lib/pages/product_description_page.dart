import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_client/controller/purchase_controller.dart';
import 'package:store_client/pages/home_page.dart';
import 'package:store_client/widgets/product_card.dart';

import '../model/product/product.dart';

class ProductDescriptionPage extends StatelessWidget {
  const ProductDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = Get.arguments['data'];
    return GetBuilder<PurchaseController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Product Details', style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://www.shoecarnival.com/on/demandware.static/-/Sites-scvl-master-catalog/default/dwa9548905/124665_264211_1.jpg',
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: 200,
                ),

              ),
              const SizedBox(height: 20,),
              Text(
                product.name ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                product.description ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                'Price :${product.price ?? ''}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: ctrl.adressController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Enter your Address',
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.indigo,
                ),
                  child: const Text('Buy Now',
                    style: TextStyle(fontSize: 18, color: Colors.white),),
                  onPressed: () {
                  ctrl.submitOrder(price: product.price?? 0, item: product.name?? '', description: product.description??'');
                  Get.offAll(const HomePage());
                  },),
              )

            ],
          ),
        ),
      );
    });
  }
}

