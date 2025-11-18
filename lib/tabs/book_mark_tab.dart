import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/app_colors.dart';
import 'package:recipe_app/ingrediends_screen.dart';

class BookMarkTab extends StatefulWidget {
  const BookMarkTab({super.key});

  @override
  State<BookMarkTab> createState() => _BookMarkTabState();
}

class _BookMarkTabState extends State<BookMarkTab> {
  Future<Map> getRecipe() async {
    // Step 1 Try/Catch Block
    // Step 2 Get response
    // Step 3 check status code if 200 success else error
    // Step 4 if success decode json (decode converts json into Map) else error return empty map
    // Step 5 return decoded json

    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/recipes'),
      );
      if (response.statusCode == 200) {
        print('Got recipes');
        final recipes = json.decode(response.body);
        return recipes;
      } else {
        print('Error');
        print(response.body);
        return {};
      }
    } catch (err) {
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 60) / 2;
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'Saved recipes',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        FutureBuilder(
          future: getRecipe(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(color: black);
            }
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return const Text('No Saved Recipes');
              // return TextButton(
              //   onPressed: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => const IngrediendsScreen(),
              //       ),
              //     );
              //   },
              //   child: const Text('Ingredients'),
              // );
            }
            List allRecipe = snapshot.data!['recipes'];
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ListView.builder(
                  itemCount: allRecipe.length,
                  itemBuilder: (context, index) {
                    Map recipe = allRecipe[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const IngrediendsScreen(),
                          //   ),
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => IngrediendsScreen(recipe: recipe,),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              // BG image
                              SizedBox(
                                width: double.infinity,
                                height: 150,
                                child: Image.network(
                                  recipe['image'],
                                  fit: BoxFit.fitWidth,
                                ),
                              ),

                              Container(
                                color: black.withValues(alpha: 0.4),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: secondary,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0,
                                              vertical: 8,
                                            ),
                                            child: Text('${recipe['rating']}'),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        width: width,

                                        child: Text(
                                          recipe['name'],
                                          style: TextStyle(
                                            color: white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        recipe['mealType'][0],
                                        style: TextStyle(
                                          color: white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: Row(
                                  children: [
                                    Icon(Icons.timer, color: white),
                                    Text(
                                      '${recipe['cookTimeMinutes']} mins',
                                      style: TextStyle(color: white),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.bookmark_outline,
                                          color: primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
