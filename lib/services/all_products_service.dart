import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> response = await Api().get(uri: kGetAllProducts);
    List<ProductModel> products = [];
    try {
      for (int i = 0; i < response.length; i++) {
        products.add(ProductModel.fromJson(response[i]));
      }
    } catch (e) {
      print(e.toString());
    }
    return products;
  }
}
