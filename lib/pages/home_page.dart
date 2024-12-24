import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store_client/controller/home_controller.dart';
import 'package:store_client/pages/login_page.dart';
import 'package:store_client/pages/product_description_page.dart';
import 'package:store_client/widgets/drop_down_btn.dart';
import 'package:store_client/widgets/multi_select_drop_down.dart';
import 'package:store_client/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () async{
          ctrl.fetchProducts();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Footware Store', style: TextStyle(fontWeight: FontWeight.bold),),
            actions: [
              IconButton(onPressed: () {
                GetStorage box = GetStorage();
                box.erase();
                Get.offAll(LoginPage());
              }, icon: Icon(Icons.logout))
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ctrl.productCategories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          ctrl.filterByCategory(ctrl.productCategories[index].name??'');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Chip(label: Text(ctrl.productCategories[index].name ?? 'Error')),
                        ),
                      );
                    }),
              ),
              Row(
                children: [
                  DropDownBtn(
                    items: ['Rs: Low to High', 'Rs:High to Low '],
                    selectedItemText: 'Sort',
                    onSelected: (selected) {
                      ctrl.storByPrice(ascending: selected == 'Rs: Low to High'? true :false);
                    },
                  ),
                  Flexible(child: MultiSelectDropDown(
                    items: ['Adidas', 'Geox', 'louboutin','New Balance ','Nike'],
                    onSelectedChanged: (selectedItems) {
                      ctrl.filterByBrand(selectedItems);
                    },))
                ],
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8
                    ),
                    itemCount: ctrl.productsShowInUi.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        name: ctrl.productsShowInUi[index].name??'No Name',
                        imageURL: 'https://th.bing.com/th/id/OIP.sxf4jLxqarZUqjvSp9DiwQHaGR?rs=1&pid=ImgDetMain',
                        price: ctrl.productsShowInUi[index].price?? 00,
                        offerTag: '20 % off',
                        onTap: () {
                          Get.to(const ProductDescriptionPage(), arguments: {'data': ctrl.productsShowInUi[index]});
                        },
                      );
                    }),
              )
        
            ],
          ),
        ),
      );
    });
  }
}
