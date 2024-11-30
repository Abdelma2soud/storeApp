import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_textformfield.dart';
import 'package:store_app/widgets/product_card.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';

// ignore: must_be_immutable
class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});
  static String id = 'UpdateProductScreen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? name;
  dynamic price;
  String? dcs;
  String? image;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Update a Product'),
        centerTitle: true,
      ),
      body: BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        progressIndicator: const CircularProgressIndicator(
          color: Colors.purple,
        ),
        dismissible: false,
        opacity: 0.4,
        color: Colors.black87,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                ProductCard(productmodel: product),
                const SizedBox(
                  height: 25,
                ),
                CustomTextformfield(
                  keyboardType: TextInputType.text,
                  secureText: false,
                  txt: 'Name',
                  onChanged: (value) {
                    name = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextformfield(
                  keyboardType: TextInputType.number,
                  secureText: false,
                  txt: 'Price',
                  onChanged: (value) {
                    price = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextformfield(
                  keyboardType: TextInputType.text,
                  secureText: false,
                  txt: 'Description',
                  onChanged: (value) {
                    dcs = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextformfield(
                  keyboardType: TextInputType.text,
                  secureText: false,
                  txt: 'Image',
                  onChanged: (value) {
                    image = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  tap: () async {
                    try {
                      isLoading = true;
                      setState(() {});
                      await UpdateproductService().updateProduct(
                        id: product.id,
                        title: name == null ? product.title : name!,
                        price: price == null ? product.price : price!,
                        describtion: dcs == null ? product.description : dcs!,
                        img: image == null ? product.image : image!,
                        category: product.category,
                      );

                      print('updating done');
                      isLoading = false;
                      setState(() {});
                    } on Exception catch (e) {
                      print(
                          'there was an error with updating a product ${e.toString()}');
                    }
                  },
                  txt: 'Update',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
