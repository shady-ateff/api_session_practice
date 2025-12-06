import 'dart:developer';

import 'package:api_session_practice/components/widgets/exclusive_section_header_widget.dart';
import 'package:api_session_practice/components/widgets/search_bar_widget.dart';
import 'package:api_session_practice/core/services/api_provider.dart';
import 'package:api_session_practice/features/product_details/product_details_page.dart';
import 'package:api_session_practice/components/product_card.dart';
import 'package:api_session_practice/core/utils/app_colors.dart';
import 'package:api_session_practice/features/products/data/models/product_model.dart';
import 'package:api_session_practice/features/products/data/models/response_model.dart';
import 'package:api_session_practice/features/products/data/repo/products_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  Future<List<Product>?> fetchProducts() async {
    try {
      var products = await ProductsRepo.fetchProducts(20);
      isLoading = false;
      isError = false;
      return products;
    } on DioException catch (e) {
      // log('Error fetching products: $e');
      errorMessage = '${e.message}';
      setState(() {
        isLoading = false;
        isError = true;
      });
    }
    return null;
  }

  List<Product>? products;
  bool isLoading = true;
  bool isError = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchProducts().then((value) {
      setState(() {
        products = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/images/splash.svg',
          height: 56,
          colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : isError
          ? Center(child: Text(errorMessage))
          : SingleChildScrollView(
              child: Column(
                children: [
                  SearchBarWidget(),
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0, top: 22),
                    child: Column(
                      spacing: 16,
                      children: [
                        SectionHeaderWidget(title: "Best Selling"),
                        Column(
                          children: [
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 290,
                                    mainAxisSpacing: 10,
                                  ),
                              itemCount: products?.length ?? 0,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    // Navigate to product details page
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetailsPage(
                                          product:
                                              products?[index] ??
                                              Product(
                                                id: 0,
                                                title: "N/A",
                                                description: "N/A",
                                                category: "N/A",
                                                price: 0.0,
                                                discountPercentage: 0.0,
                                                rating: 0.0,
                                                weight: 0.0,
                                                images: [
                                                  "https://via.placeholder.com/150",
                                                ],
                                              ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: ProductCard(
                                    title:
                                        products![index].title ??
                                        "Product Name",
                                    description:
                                        products![index].weight.toString() +
                                        " g",
                                    imageUrl: products![index].images![0],
                                    price: products![index].price ?? 0.0,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
