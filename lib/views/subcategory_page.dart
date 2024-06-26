import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinone_app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:coinone_app/services/network_service.dart';

class SubCategoryPage extends StatelessWidget {
  final int categoryId;

  SubCategoryPage({required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subcategories'),
      ),
      body: FutureBuilder<List<Product>>(
        future: NetworkService().fetchSubCategories(categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No subcategories found.'),
            );
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final subCategory = snapshot.data![index];
                final imageUrl = NetworkService.baseUrl + subCategory.imgUrlPath;
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,

                          errorWidget: (context, url, error) => Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          subCategory.name,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
