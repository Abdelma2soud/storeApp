import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_service.dart';
import 'package:store_app/widgets/product_card.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static String id = 'HomeScreen';
  List<ProductModel> productList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'New Trend',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.black,
                ))
          ],
          centerTitle: true,
          elevation: 0,
        ),
        body: FutureBuilder<List<ProductModel>>(
          future: AllProductService().getAllProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Still loading, show progress indicator
              print('loading.......');
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              // If there's an error, show an error message
              print('problem with snapshot data : ${snapshot.error}');
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              // If there's no data or the list is empty, show a message
              print('empty snapsht');
              return const Center(
                child: Text('No products available.'),
              );
            } else {
              // Data loaded, show the products
              List<ProductModel> productlist = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.only(top: 64, right: 16, left: 16),
                child: GridView.builder(
                  itemCount: productlist.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                    mainAxisSpacing: 80,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => ProductCard(
                    productmodel: productlist[index],
                  ),
                ),
              );
            }
          },
        ));
  }
}
