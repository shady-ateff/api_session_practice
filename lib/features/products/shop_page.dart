import 'package:api_session_practice/shared/components/widgets/exclusive_section_header_widget.dart';
import 'package:api_session_practice/shared/components/widgets/search_bar_widget.dart';
import 'package:api_session_practice/features/product_details/product_details_page.dart';
import 'package:api_session_practice/shared/components/product_card.dart';
import 'package:api_session_practice/shared/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

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
      body: SingleChildScrollView(
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // Navigate to product details page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsPage(),
                                ),
                              );
                            },
                            child: ProductCard(
                              title: "Product Name",
                              description: "500g",
                              imageUrl: "https://cdn.dummyjson.com/product-images/groceries/apple/1.webp",
                              price: 4.99,
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
