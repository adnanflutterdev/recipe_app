import 'package:flutter/material.dart';
import 'package:recipe_app/app_colors.dart';
import 'package:recipe_app/sign_in_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          // step1 Background Image
          SizedBox(
            width: width,
            height: height,
            child: Image.asset('assets/images/bg.png', fit: BoxFit.cover),
          ),

          // step2 Column
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // 1 child
                const Text(
                  'Get\nCooking',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    // letterSpacing: 1,
                  ),

                  // New Property
                  textAlign: TextAlign.center,
                ),

                // 2nd child
                Text(
                  'Simple way to find Tasty Recipe',
                  style: TextStyle(color: white, fontSize: 16),
                ),

                // Spacing
                const SizedBox(height: 64),

                // 3rd child
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignInScreen();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Start cooking'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: white,
                    iconAlignment: IconAlignment.end,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                  ),
                ),

                // Spacing
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
