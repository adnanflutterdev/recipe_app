import 'package:flutter/material.dart';
import 'package:recipe_app/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                horizontalTitleGap: 10,
                subtitle: const Text('What are you cooking today?'),
                subtitleTextStyle: TextStyle(fontSize: 12, color: grey),
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
            ],
          ),
        ),
      ),
    );
  }
}
