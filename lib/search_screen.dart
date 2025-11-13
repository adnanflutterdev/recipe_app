import 'package:flutter/material.dart';
import 'package:recipe_app/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 30;
    List<Map<String, dynamic>> foods = [
      {
        'name': 'Classic Greek Salad',
        'image': 'assets/images/food6.png',
        'rating': 4.5,
        'chef': 'Chef 1',
      },
      {
        'name': 'Crunchy Nut Coleslaw',
        'image': 'assets/images/food2.png',
        'rating': 3.5,
        'chef': 'Chef 2',
      },
      {
        'name': 'Shrimp Chicken Andouille Sausage Jambalaya',
        'image': 'assets/images/food3.png',
        'rating': 3,
        'chef': 'Chef 3',
      },
      {
        'name': 'Barbecue Chicken Jollof Rice',
        'image': 'assets/images/food4.png',
        'rating': 4.5,
        'chef': 'Chef 4',
      },
      {
        'name': 'Portuguese Piri Piri Chicken',
        'image': 'assets/images/food5.png',
        'rating': 4.5,
        'chef': 'Chef 5',
      },
      {
        'name': 'Classic Greek Salad',
        'image': 'assets/images/food1.png',
        'rating': 4.5,
        'chef': 'Chef 6',
      },
      {
        'name': 'Crunchy Nut Coleslaw',
        'image': 'assets/images/food2.png',
        'rating': 3.5,
        'chef': 'Chef 7',
      },
      {
        'name': 'Shrimp Chicken Andouille Sausage Jambalaya',
        'image': 'assets/images/food3.png',
        'rating': 3,
        'chef': 'Chef 8',
      },
      {
        'name': 'Barbecue Chicken Jollof Rice',
        'image': 'assets/images/food4.png',
        'rating': 4.5,
        'chef': 'Chef 9',
      },
      {
        'name': 'Portuguese Piri Piri Chicken',
        'image': 'assets/images/food5.png',
        'rating': 4.5,
        'chef': 'Chef 10',
      },
    ];

    List<String> time = ['All', 'Newest', 'Oldest', 'Popular'];
    List<String> cetegories = [
      'All',
      'Indian',
      'Italian',
      'Asian',
      'Chineese',
      'Fruit',
      'Vegetables',
      'Protien',
      'Cereal',
      'Local dishes',
    ];

    void openSheet() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: width + 30,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Filter Search',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Time',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                Row(
                  children: List.generate(time.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 5,
                          ),
                          child: Text(
                            time[index],
                            style: TextStyle(fontSize: 12, color: primary),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const Text(
                  'Rate',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                Row(
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 5,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '${index + 1}',
                                style: TextStyle(fontSize: 12, color: primary),
                              ),
                              Icon(Icons.star, color: primary, size: 20),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const Text(
                  'Category',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                Wrap(
                  children: List.generate(cetegories.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 5,
                          ),
                          child: Text(
                            cetegories[index],
                            style: TextStyle(fontSize: 12, color: primary),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          );
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
                itemCount: foods.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final food = foods[index];
                  return SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          width: width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Image.asset(food['image'], fit: BoxFit.cover),
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
                                  food['chef'],
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
