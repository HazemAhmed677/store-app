import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<String> response =
        await Api().get(uri: kGetAllCategoriesUrl) as List<String>;
    return response;
  }
}
