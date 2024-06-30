import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AddProductSevice {
  Future<ProductModel> addProduct(
      {required String id,
      required String title,
      required String price,
      required String description,
      required String image,
      required String category,
      String? token}) async {
    Map<String, String> body = {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    };
    Map<String, String> response = await Api().post(url: kPostUrl, body: body);
    return ProductModel.fromJson2(response);
  }
}
