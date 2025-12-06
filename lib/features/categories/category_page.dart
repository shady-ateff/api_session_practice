import 'package:api_session_practice/features/product_details/product_details_page.dart';
import 'package:api_session_practice/components/product_card.dart';
import 'package:api_session_practice/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: Text("category.name"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 5.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            childAspectRatio: 0.75,
          ),
          itemCount: 10,
          itemBuilder: (cntxt, index) {
            return InkWell(
              child: ProductCard(
                title: "Product Name",
                description: "500g",
                imageUrl:
                    "https://cdn.dummyjson.com/product-images/groceries/apple/1.webp",
                price: 4.99,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductDetailsPage(

                    product: Product(
                      id: 0,
                      title: "N/A",
                      description: "N/A",
                      category: "N/A",
                      price: 0.0,
                      discountPercentage: 0.0,
                      rating: 0.0,
                      weight: 0.0,
                      images: [
                        "https://via.placeholder.com/150"
                      ],
                    ),
                  )),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
