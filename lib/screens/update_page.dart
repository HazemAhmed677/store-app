import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_sevice.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});
  static String id = 'Update Page';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String title = '', desc = '', image = '';

  double price = 0.0;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Update ${kGetValidTitle(productModel.title)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                onChanged: (data) {
                  title = data;
                },
                hint: 'Enter name',
                label: 'Name',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                onChanged: (data) {
                  price = double.parse(data);
                },
                hint: 'Enter price',
                label: 'Price',
                type: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                onChanged: (data) {
                  desc = data;
                },
                hint: 'Enter description',
                label: 'Description',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                onChanged: (data) {
                  image = data;
                },
                hint: 'Enter image url',
                label: 'Image',
              ),
              const SizedBox(
                height: 60,
              ),
              Material(
                color: Colors.white,
                elevation: 8, // Adjust the shadow intensity
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () async {
                    await updateMethod(productModel);
                    // Handle the tap event
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: const SizedBox(
                    width: 150,
                    height: 100,
                    child: Center(
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateMethod(ProductModel product) async {
    late ProductModel result;
    try {
      result = await UpdateProductService().updateProduct(
        id: product.id.toString(),
        title: (title != '') ? title : product.title,
        price: (price != 0.0) ? price.toString() : product.price.toString(),
        description: (desc != '') ? desc : product.description,
        image: (image != '') ? image : product.image,
        category: product.category,
      );
    } catch (e) {
      print(e.toString());
    }
    print('Success, GOAT');
    print(result.price);
  }
}
