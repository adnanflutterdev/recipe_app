import 'package:flutter/material.dart';
import 'package:recipe_app/app_colors.dart';

class IngrediendsScreen extends StatefulWidget {
  const IngrediendsScreen({super.key, required this.recipe});

  final Map recipe;

  @override
  State<IngrediendsScreen> createState() => _IngrediendsScreenState();
}

class _IngrediendsScreenState extends State<IngrediendsScreen> {
  int tabIndex = 0;

  List<Map> ingredients = [
    {
      'image': 'assets/ingredients/tomato.png',
      'title': 'Tomato',
      'grams': '500g',
    },
    {
      'image': 'assets/ingredients/cabbage.png',
      'title': 'Cabbage',
      'grams': '300g',
    },
    {'image': 'assets/ingredients/taco.png', 'title': 'Taco', 'grams': '300g'},
    {
      'image': 'assets/ingredients/bread.png',
      'title': 'Slice Bread',
      'grams': '300g',
    },
    {
      'image': 'assets/ingredients/green_onion.png',
      'title': 'Green Onion',
      'grams': '300g',
    },
    {'image': 'assets/ingredients/egg.png', 'title': 'Omlet', 'grams': '300g'},
    {
      'image': 'assets/ingredients/hotdog.png',
      'title': 'Hot Dog',
      'grams': '300g',
    },
    {
      'image': 'assets/ingredients/onion.png',
      'title': 'Onion',
      'grams': '300g',
    },
    {
      'image': 'assets/ingredients/lettuce.png',
      'title': 'Lettuce',
      'grams': '300g',
    },
    {
      'image': 'assets/ingredients/spinach.png',
      'title': 'Spinach',
      'grams': '300g',
    },
    {
      'image': 'assets/ingredients/chilli.png',
      'title': 'Red & Green Chilli',
      'grams': '300g',
    },
    {
      'image': 'assets/ingredients/fries.png',
      'title': 'Fries',
      'grams': '300g',
    },
    {
      'image': 'assets/ingredients/leg.png',
      'title': 'Chicken',
      'grams': '300g',
    },
    {
      'image': 'assets/ingredients/burger.png',
      'title': 'Burger',
      'grams': '300g',
    },
  ];
  @override
  Widget build(BuildContext context) {
    print(widget.recipe);
    Map recipe = widget.recipe;
    double width = (MediaQuery.of(context).size.width - 60) / 2;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        actions: [const Icon(Icons.more_horiz), const SizedBox(width: 10)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
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
                    // child: Image.asset(
                    //   'assets/ingredients/food.png',
                    //   fit: BoxFit.fitWidth,
                    // ),
                    child: Image.network(recipe['image'], fit: BoxFit.fitWidth),
                  ),

                  Container(
                    color: black.withValues(alpha: 0.4),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              decoration: BoxDecoration(
                                color: secondary,
                                borderRadius: BorderRadius.circular(10),
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
                              // 'Spicy chicken burger with French fries',
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
                            child: Icon(Icons.bookmark_outline, color: primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        tabIndex = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tabIndex == 0 ? primary : white,
                      foregroundColor: tabIndex == 0 ? white : primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                      elevation: tabIndex == 0 ? 2 : 0,
                    ),
                    child: const Text('Ingredient'),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      tabIndex = 1;
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tabIndex == 1 ? primary : white,
                      foregroundColor: tabIndex == 1 ? white : primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                      elevation: tabIndex == 1 ? 2 : 0,
                    ),
                    child: const Text('Procedure'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.dining_outlined, color: grey, size: 20),
                const SizedBox(width: 8),
                Text(
                  '${recipe['servings']} Serve',
                  style: TextStyle(color: grey, fontSize: 12),
                ),
                const Spacer(),
                Text(
                  '${recipe['ingredients'].length} Items',
                  style: TextStyle(color: grey, fontSize: 12),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                // itemCount: ingredients.length,
                itemCount: recipe['ingredients'].length,
                itemBuilder: (context, index) {
                  Map ingredient = ingredients[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 5,
                    ),

                    shadowColor: Colors.transparent,
                    color: grey.withValues(alpha: 0.3),
                    child: ListTile(
                      leading: Card(
                        color: white,
                        elevation: 0.5,
                        child: Image.asset(ingredient['image']),
                      ),
                      // title: Text(ingredient['title']),
                      title: Text(recipe['ingredients'][index]),
                      trailing: Text(
                        ingredient['grams'],
                        style: TextStyle(
                          color: grey,
                          fontSize: 14,
                          // shadows: [const Shadow(blurRadius: 2)],
                        ),
                      ),
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
