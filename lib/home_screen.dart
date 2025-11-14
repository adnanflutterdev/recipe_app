import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_app/app_colors.dart';
import 'package:recipe_app/search_screen.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> foodTypes = [
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

  // List<Map<String, dynamic>> foods = [
  //   {
  //     'name': 'Classic Greek Salad',
  //     'image': 'assets/images/food1.png',
  //     'rating': 4.5,
  //     'time': '15 mins',
  //   },
  //   {
  //     'name': 'Crunchy Nut Coleslaw',
  //     'image': 'assets/images/food2.png',
  //     'rating': 3.5,
  //     'time': '10 mins',
  //   },
  //   {
  //     'name': 'Shrimp Chicken Andouille Sausage Jambalaya',
  //     'image': 'assets/images/food3.png',
  //     'rating': 3,
  //     'time': '10 mins',
  //   },
  //   {
  //     'name': 'Barbecue Chicken Jollof Rice',
  //     'image': 'assets/images/food4.png',
  //     'rating': 4.5,
  //     'time': '10 mins',
  //   },
  //   {
  //     'name': 'Portuguese Piri Piri Chicken',
  //     'image': 'assets/images/food5.png',
  //     'rating': 4.5,
  //     'time': '15 mins',
  //   },
  // ];
  int currentIndex = 0;
  @override
  initState() {
    super.initState();
    // getRecipe();
  }

  Future<Map<String, dynamic>> getRecipe() async {
    try {
      final recipe = await http.get(Uri.parse('https://dummyjson.com/recipe'));

      if (recipe.statusCode == 200) {
        debugPrint('Success');
        debugPrint('${recipe.statusCode}');

        final data = json.decode(recipe.body);
        debugPrint('$data');
        if (!mounted) {
          return {};
        }
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Got recipies...')));
        return data;
      } else {
        debugPrint('Failed');
        debugPrint('${recipe.statusCode}');
         if (!mounted) {
          return {};
        }
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Error occured')));
        return {};
      }
    } catch (err) {
      debugPrint(err.toString());
       if (!mounted) {
          return {};
        }
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Error occured')));
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: FutureBuilder(
          future: getRecipe(),
          builder: (context, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshots.data == null || snapshots.data!.isEmpty) {
              print(snapshots.data);
              return const Center(child: Text('No Data found'));
            }

            List<dynamic> recipies = snapshots.data!['recipes'];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: recipies.length,
                //     itemBuilder: (context, index) {
                //       final recipe = recipies[index];
                //       return ListTile(
                //         leading: Image.network(recipe['image']),
                //         title: Text(recipe['name']),
                //         subtitle: Text('${recipe['rating']}'),
                //       );
                //     },
                //   ),
                // ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          ListTile(
                            title: const Text('Hello Jega'),
                            titleTextStyle: TextStyle(
                              fontSize: 20,
                              color: black,
                              fontWeight: FontWeight.bold,
                            ),
                            // minVerticalPadding: 0,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0,
                            ),
                            horizontalTitleGap: 10,
                            subtitle: const Text('What are you cooking today?'),
                            subtitleTextStyle: TextStyle(
                              fontSize: 12,
                              color: grey,
                            ),
                            trailing: Container(
                              decoration: BoxDecoration(
                                // color: secondary.withAlpha(0-255),
                                color: secondary.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Image.asset('assets/images/profile.png'),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return SearchScreen(
                                              recipies: recipies,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: TextField(
                                      style: const TextStyle(fontSize: 12),
                                      cursorColor: black,
                                      decoration: InputDecoration(
                                        // labelText: 'Search recipe',
                                        enabled: false,
                                        hintText: 'Search recipe',
                                        hintStyle: TextStyle(
                                          color: grey,
                                          fontSize: 12,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: grey,
                                          size: 18,
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: border),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        // focusedBorder: OutlineInputBorder(
                                        //   borderSide: BorderSide(color: border),
                                        //   borderRadius: BorderRadius.circular(10),
                                        // ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: primary,
                                ),
                                child: Icon(Icons.sort, color: white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 30,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: foodTypes.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    currentIndex = index;
                                    setState(() {});
                                  },
                                  child: Container(
                                    // padding: const EdgeInsets.symmetric(
                                    //   horizontal: 20,
                                    //   vertical: 7,
                                    // ),
                                    decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? primary
                                          : white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 7,
                                      ),
                                      child: Text(
                                        foodTypes[index],
                                        style: TextStyle(
                                          color: currentIndex == index
                                              ? white
                                              : primary.withValues(alpha: 0.8),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> food = recipies[index];

                                return Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: SizedBox(
                                    height: 260,
                                    width: 150,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            width: 150,
                                            height: 170,
                                            decoration: BoxDecoration(
                                              color: grey.withValues(
                                                alpha: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                    20.0,
                                                  ),
                                                  child: Text(
                                                    food['name'],
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                    10.0,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text('Time'),
                                                          Text(
                                                            '${food['cookTimeMinutes']} mins',
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: white,
                                                            ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                4.0,
                                                              ),
                                                          child: Icon(
                                                            Icons
                                                                .bookmark_outline,
                                                            color: primary
                                                                .withValues(
                                                                  alpha: 0.8,
                                                                ),
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

                                        // Image
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          // child: Image.asset(food['image']),
                                          child: Container(
                                            // Removes overflow
                                            clipBehavior: Clip.hardEdge,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            width: 120,
                                            height: 120,
                                            child: Image.network(
                                              food['image'],
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),

                                        Positioned(
                                          top: 30,
                                          right: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: grey,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                7.0,
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: rating,
                                                    size: 15,
                                                  ),
                                                  Text(
                                                    '${food['rating']}',
                                                    style: TextStyle(
                                                      color: white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          // New Recipe
                          const SizedBox(height: 20),
                          const Text(
                            "New Recipe",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 160,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: SizedBox(
                                    height: 160,
                                    width: 240,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              // width: 250,
                                              height: 115,
                                              decoration: BoxDecoration(
                                                color: white,
                                                boxShadow: [
                                                  const BoxShadow(
                                                    blurRadius: 3,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  15.0,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      width: 120,
                                                      child: Text(
                                                        'Steak with tomato sauce and bulgur rice.',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    const Text('⭐⭐⭐⭐⭐'),
                                                    const SizedBox(height: 10),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/images/user.png',
                                                          width: 25,
                                                          height: 25,
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),

                                                        Text(
                                                          'User ${index + 1}',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: grey,
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        Icon(
                                                          Icons.timer,
                                                          color: grey,
                                                          size: 15,
                                                        ),
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          '20 mins',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Image
                                        Positioned(
                                          top: 0,
                                          right: 10,
                                          child: Container(
                                            width: 80,
                                            height: 80,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              recipies[index]['image'],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Navigation bar
                SizedBox(
                  height: 90,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(offset: Offset(1, -1), blurRadius: 3),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Spacer(flex: 1),
                                Icon(
                                  Icons.home_filled,
                                  color: primary,
                                  size: 30,
                                ),
                                const Spacer(flex: 2),
                                Icon(
                                  Icons.bookmark_outline,
                                  color: grey,
                                  size: 30,
                                ),
                                const Spacer(flex: 4),
                                Icon(
                                  Icons.notifications,
                                  color: grey,
                                  size: 30,
                                ),
                                const Spacer(flex: 2),
                                Icon(Icons.person, color: grey, size: 30),
                                const Spacer(flex: 1),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                            boxShadow: [const BoxShadow(blurRadius: 2)],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add_circle,
                              color: primary,
                              size: 45,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedLabelStyle: TextStyle(color: black),
      //   fixedColor: black,

      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_filled, color: primary),
      //       label: 'Home',
      //       backgroundColor: white,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.bookmark_outline, color: grey),
      //       label: 'Save',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.add_circle, color: grey),
      //       label: 'Add',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications, color: grey),
      //       label: 'Notification',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person, color: grey),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }
}

/*
*/
