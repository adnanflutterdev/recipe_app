import 'package:flutter/material.dart';
import 'package:recipe_app/app_colors.dart';
import 'package:recipe_app/filter.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.recipies});

  final List<dynamic> recipies;

  @override
  Widget build(BuildContext context) {
    print(recipies);
    final width = MediaQuery.of(context).size.width - 30;
    // List<Map<String, dynamic>> foods = [
    //   {
    //     'name': 'Classic Greek Salad',
    //     'image': 'assets/images/food6.png',
    //     'rating': 4.5,
    //     'chef': 'Chef 1',
    //   },
    //   {
    //     'name': 'Crunchy Nut Coleslaw',
    //     'image': 'assets/images/food2.png',
    //     'rating': 3.5,
    //     'chef': 'Chef 2',
    //   },
    //   {
    //     'name': 'Shrimp Chicken Andouille Sausage Jambalaya',
    //     'image': 'assets/images/food3.png',
    //     'rating': 3,
    //     'chef': 'Chef 3',
    //   },
    //   {
    //     'name': 'Barbecue Chicken Jollof Rice',
    //     'image': 'assets/images/food4.png',
    //     'rating': 4.5,
    //     'chef': 'Chef 4',
    //   },
    //   {
    //     'name': 'Portuguese Piri Piri Chicken',
    //     'image': 'assets/images/food5.png',
    //     'rating': 4.5,
    //     'chef': 'Chef 5',
    //   },
    //   {
    //     'name': 'Classic Greek Salad',
    //     'image': 'assets/images/food1.png',
    //     'rating': 4.5,
    //     'chef': 'Chef 6',
    //   },
    //   {
    //     'name': 'Crunchy Nut Coleslaw',
    //     'image': 'assets/images/food2.png',
    //     'rating': 3.5,
    //     'chef': 'Chef 7',
    //   },
    //   {
    //     'name': 'Shrimp Chicken Andouille Sausage Jambalaya',
    //     'image': 'assets/images/food3.png',
    //     'rating': 3,
    //     'chef': 'Chef 8',
    //   },
    //   {
    //     'name': 'Barbecue Chicken Jollof Rice',
    //     'image': 'assets/images/food4.png',
    //     'rating': 4.5,
    //     'chef': 'Chef 9',
    //   },
    //   {
    //     'name': 'Portuguese Piri Piri Chicken',
    //     'image': 'assets/images/food5.png',
    //     'rating': 4.5,
    //     'chef': 'Chef 10',
    //   },
    // ];

    void openSheet() {
      showModalBottomSheet(
        context: context,
        // isScrollControlled: true,
        builder: (context) {
          return const Filter();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Recipe'),
        centerTitle: true,
        backgroundColor: white,
      ),
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        style: const TextStyle(fontSize: 12),
                        cursorColor: black,
                        decoration: InputDecoration(
                          // labelText: 'Search recipe',
                          hintText: 'Search recipe',
                          hintStyle: TextStyle(color: grey, fontSize: 12),
                          prefixIcon: Icon(Icons.search, color: grey, size: 18),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: border),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: border),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    // onTap: () {
                    //   openSheet();
                    // },
                    onTap: openSheet,

                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primary,
                      ),
                      child: Icon(Icons.sort, color: white),
                    ),
                  ),
                ],
              ),
            ),

            const Text(
              'Recent Search',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: recipies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final food = recipies[index];
                  return SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          width: width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Image.network(
                            food['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: black.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: secondary.withValues(alpha: 0.4),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: rating,
                                            size: 15,
                                          ),
                                          Text('${food['rating']}'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  child: Text(
                                    food['name'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: white,
                                    ),
                                  ),
                                ),
                                Text(
                                  food['cuisine'],
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: white.withValues(alpha: 0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
