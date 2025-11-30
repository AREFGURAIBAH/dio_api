import 'package:dio_api/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  //final dynamic product;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 10, right: 10),
      height: 200,
      width: 160,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          SizedBox(
            height:120,
            child: Image.network(product.thumbnail, 
            fit: BoxFit.cover),
          ),
          Text(
            product.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                "\$${product.price.toString()}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
              Spacer(),
              Icon(Icons.star, color: Colors.orange),
              Text(
                product.rating.toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
