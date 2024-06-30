import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {required String id,
      required String title,
      required String price,
      required String description,
      required String image,
      required String category,
      String? token}) async {
    Map<String, dynamic> body = {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    };

    Map<String, dynamic> updatedProduct;
    updatedProduct = await Api()
        .put(url: kUpdateUrl(id.toString()), body: body, token: token);

    updatedProduct['price'] = double.parse(updatedProduct['price']);
    if (true) {}
    return ProductModel.fromJson2(updatedProduct);
  }
}
