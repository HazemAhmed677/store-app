import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class ProductsByCategoryService {
  Future<List<ProductModel>> getProductsByCategory(String categoryName) async {
    var response = await Api().get(uri: kProductsByCategoryUrl(categoryName));
    List<ProductModel> products = [];
    for (int i = 0; i < response.length; i++) {
      products.add(response[i]);
    }
    return products;
  }
}
