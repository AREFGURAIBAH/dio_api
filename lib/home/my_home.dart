import 'package:dio/dio.dart';
import 'package:dio_api/model/product_model.dart';
import 'package:dio_api/widgets/product_card.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 233, 233),
      appBar: AppBar(title: Text('Dio API Example')),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            Response response = snapshot.data;
            final product = response.data['products'];
            List<ProductModel> products = [];
            for (var productsMap in product) {
              products.add(ProductModel.fromJson(productsMap));
            }
            return Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            );
          }
        },
      ),
    );
  }
}

Future<Response> fetchData() async {
  Dio dio = Dio();
  final response = await dio.get('https://dummyjson.com/products');
  return response;
}
