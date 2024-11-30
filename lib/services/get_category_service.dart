import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetCategoryService {
  Future<List<ProductModel>> getcategory({required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromjson(data[i]),
      );
    }
    return productsList;
  }
}
