const kGetAllProducts = 'https://fakestoreapi.com/products';
const kGetAllCategoriesUrl = 'https://fakestoreapi.com/products/categories';
String kProductsByCategoryUrl(String categoryName) {
  return 'https://fakestoreapi.com/products/category/$categoryName';
}

const kPostUrl = 'https://fakestoreapi.com/products';
String kUpdateUrl(String id) {
  return 'https://fakestoreapi.com/products/$id';
}

String kGetValidTitle(String str) {
  String res = '';
  for (int i = 0; i < str.length; i++) {
    if (str[i] == ' ') return res;
    res += str[i];
  }
  return res;
}
