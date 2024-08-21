import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:rapid/controller/home_controller.dart';
import 'package:video_player/video_player.dart';
import '../widgets/dropdown_button.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    // Initialize the video controller and set the video to loop
    _videoController = VideoPlayerController.asset('assets/video/foot.mp4',)
      ..initialize().then((_) {
        setState(() {});
        _videoController.setLooping(true);
        _videoController.play(); // Auto-play the video
      });
  }

  @override
  void dispose() {
    _videoController
        .dispose(); // Dispose of the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        // Setting a custom background color for the AppBar
        appBar: AppBar(
          title: const Text("Add Product"),
          backgroundColor: Colors.teal, // Custom background color
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
          // Banner video at the top
          _videoController.value.isInitialized
          ? AspectRatio(
          aspectRatio: _videoController.value.aspectRatio,
            child: VideoPlayer(_videoController),
          )
              : Container(
          height: 200,
            color: Colors.black, // Placeholder for video banner
             ),
          const SizedBox(height: 20), // Spacer between video and form
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Add New Product",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: ctrl.productNameCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: const Text("Product Name"),
                      hintText: "Enter Your Product Name"),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: ctrl.productDescriptionCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: const Text("Product Description"),
                      hintText: "Enter Your Product Description"),
                  maxLines: 4,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: ctrl.productImgCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: const Text("Image URL"),
                      hintText: "Enter Image URL"),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: ctrl.productPriceCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: const Text("Product Price"),
                      hintText: "Enter Your Product Price"),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: DropDownBtn(
                        item: const [
                          "Boots",
                          "Ballet Shoe",
                          'Beach Shoe',
                          'High Heels',
                          'Sneakers'
                        ],
                        selectedItemsText: ctrl.category,
                        OnsSelected: (selectedValue) {
                          ctrl.category = selectedValue ?? 'General';
                          ctrl.update();
                        },
                      ),
                    ),
                    Flexible(
                      child: DropDownBtn(
                        item: const [
                          "Puma",
                          "Sketchers",
                          'Adidas',
                          'Clarks'
                        ],
                        selectedItemsText: ctrl.brand,
                        OnsSelected: (selectedValue) {
                          ctrl.brand = selectedValue ?? 'Unbranded';
                          ctrl.update();
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text("Offer Products..!"),
                const SizedBox(height: 20),
                DropDownBtn(
                  item: const ['true', 'false'],
                  selectedItemsText: ctrl.offer.toString(),
                  OnsSelected: (selectedValue) {
                    ctrl.offer =
                        bool.tryParse(selectedValue ?? 'false') ?? false;
                    ctrl.update();
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      ctrl.addProduct();
                    },
                    child: const Text("Add Product"))
              ],
            ),
          ),
          ],
        ),
      ),);
    });
  }
}
