import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapid/controller/home_controller.dart';
import 'package:rapid/pages/add_product_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        // Setting a custom background color for the AppBar
        appBar: AppBar(
          title: const Text("FootWear Admin"),
          backgroundColor: Colors.blueGrey, // Custom background color
        ),

        // Adding a background image to the HomePage
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.network(
                'https://img.freepik.com/free-vector/pair-leather-sports-shoes-wood-background_1284-17526.jpg', // Path to your local asset image
                fit: BoxFit.cover, // Ensures the image covers the entire background
              ),
            ),

            // The main content of the page (List of products)
            ListView.builder(
              itemCount: ctrl.products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(ctrl.products[index].name ?? ''),
                  subtitle: Text((ctrl.products[index].price ?? 0).toString()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ctrl.deleteProduct(ctrl.products[index].id ?? '');
                    },
                  ),
                );
              },
            ),
          ],
        ),

        // Floating Action Button to add a new product
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
