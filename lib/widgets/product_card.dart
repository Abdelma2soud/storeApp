import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productmodel});
  final ProductModel productmodel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,
            arguments: productmodel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 150,
            width: 180,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 20,
                spreadRadius: 3,
                color: Colors.grey.withOpacity(0),
                offset: const Offset(0, 10),
              ),
            ]),
            // height: 150,
            // width: 180,
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productmodel.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${productmodel.price}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 28,
            top: -50,
            child: Image.network(
              productmodel.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
