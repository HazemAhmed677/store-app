import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_page.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    required this.productModel,
    super.key,
  });
  final ProductModel productModel;
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdatePage.id,
            arguments: widget.productModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 15,
                offset: const Offset(5, 5),
                color: Colors.grey.shade300,
              ),
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      kGetValidTitle(widget.productModel.title),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${widget.productModel.price.toString()}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {
                            isPressed = !isPressed;
                            setState(() {});
                          },
                          icon: Icon(
                            (isPressed)
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 70,
            bottom: 80,
            child: Image.network(
              widget.productModel.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
