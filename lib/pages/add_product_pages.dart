import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:store/controller/home_controller.dart';
import 'package:store/pages/widgets/drop_down_btn.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Add product'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Add New Product'
                  , style: TextStyle(
                    fontSize: 30, color: Colors.indigoAccent,
                    fontWeight: FontWeight.bold),),
                TextField(
                  controller: ctrl.productNameCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      label: const Text('Product Name'),
                      hintText: 'Enter Your Product Name'
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrl.productDescriptionCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      label: const Text('Product Description'),
                      hintText: 'Enter Your Product description'
                  ),
                  maxLines: 4,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrl.productImgCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      label: const Text('Image URl'),
                      hintText: 'Enter Your Image UR'
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrl.productPriceCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      label: const Text('Product price'),
                      hintText: 'Enter Your Product price'
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(child: DropDownBtn(
                      items: const ['Heels', 'Sports shoes', 'Loafer','Boot'],
                      selectedItemText: ctrl.category,
                      onSelected: (selectedValue) {
                        ctrl.category = selectedValue?? 'general';
                        ctrl.update();
                      },)),
                    Flexible(child: DropDownBtn(
                      items: const ['Adidas', 'Geox', 'louboutin','New Balance ','Nike'],
                      selectedItemText: ctrl.brand,
                      onSelected: (selectedValue) {
                       ctrl.brand = selectedValue?? 'un branded';
                       ctrl.update();
                      },)),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Offre Product?'),
                DropDownBtn(items: const ['true', 'false'],
                  selectedItemText: ctrl.offer.toString(),
                  onSelected: (selectedValue) {
                    ctrl.offer = bool.tryParse(selectedValue?? 'false')?? false;
                    ctrl.update();
                  },),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigoAccent,
                        foregroundColor: Colors.white
                    ),
                    onPressed: () {
                      ctrl.addProduct();

                    },
                    child: const Text('Ad product'))

              ],
            ),
          ),
        ),
      );
    });
  }

}