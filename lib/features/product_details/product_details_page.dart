import 'package:api_session_practice/features/product_details/widgets/product_details_item_counter.dart';
import 'package:api_session_practice/components/custom_button.dart';
import 'package:api_session_practice/core/utils/app_colors.dart';
import 'package:api_session_practice/core/utils/app_theme.dart';
import 'package:api_session_practice/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key , required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // shadowColor: Colors.transparent,
        elevation: 0, // remove shadow

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryVariant.withAlpha(7),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
            ),
            child: SafeArea(
              child: Image.network(
                product.images![0],
                height: 250,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                spacing: 20,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 5,
                          children: [
                            Text(product.title ?? 'Product Name', style: AppTheme.headLineBold),
                            Text(
                              product.category ?? 'Category Name',
                              style: AppTheme.body,
                            ),
                          ],
                        ),
                      ),
                      FavButton(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductDetailsItemCounter(),
                      Text(
                        '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    iconColor: AppColors.secondary,
                    title: Text(
                      "Product Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.secondary,
                      ),
                    ),
                    children: [
                      RichText(
                        text: TextSpan(
                          text: product.description ?? 'No description available.',
                          style: AppTheme.body,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Weight", style: AppTheme.h3Bold),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        NutritionBadge(
                          weight: '${product.weight.toString()} g',
                        ),
                        SizedBox(width: 7),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                          opticalSize: 17,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Reviews", style: AppTheme.h3Bold),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(
                          5,
                          (i) => Icon(
                            Icons.star,
                            color: AppColors.secondaryVariant,
                            size: 17,
                          ),
                        ),
                        SizedBox(width: 7),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                          opticalSize: 17,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 67,
        margin: EdgeInsets.all(25),
        child: CustomButton(text: "Add To Basket", onPressed: () {}),
      ),
      // bottomNavigationBar:
    );
  }
}

class FavButton extends StatefulWidget {
  const FavButton({super.key});

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFav = !isFav;
        });
      },
      icon: Icon(
        isFav ? Icons.favorite : Icons.favorite_border_outlined,
        color: isFav ? AppColors.primary : AppColors.secondary,
      ),
    );
  }
}

class NutritionBadge extends StatelessWidget {
  const NutritionBadge({super.key, required this.weight});

  final String weight ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 39,
      height: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.secondary.withAlpha(30),
      ),
      child: Center(
        child: Text(
          weight,
          style: TextStyle(color: AppColors.secondary.withAlpha(150)),
        ),
      ),
    );
  }
}
