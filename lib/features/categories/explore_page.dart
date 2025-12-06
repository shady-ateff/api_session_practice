import 'package:api_session_practice/components/widgets/search_bar_widget.dart';
import 'package:api_session_practice/features/categories/category_page.dart';
import 'package:api_session_practice/features/categories/widgets/category_card.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Find Products'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 20,
              ),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.89,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  // final category = categoriesItems[index];
                  return InkWell(
                    onTap: () {
                      // Navigate to category details page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryPage(
                            // category: Center(child: Text('Category')),
                          ),
                        ),
                      );
                    },
                    child: CategoryCard(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
