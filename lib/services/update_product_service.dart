import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateproductService {
  Future<ProductModel> updateProduct(
      {required dynamic id,
      required String title,
      required dynamic price,
      required String describtion,
      required String img,
      required String category}) async {
    print('product id : $id');
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'id': id,
        'title': title,
        'price': price,
        'description': describtion,
        'image': img,
        'category': category,
      },
    );
    return ProductModel.fromjson(data);
  }
}
