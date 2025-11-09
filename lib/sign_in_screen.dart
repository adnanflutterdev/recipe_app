import 'package:flutter/material.dart';
import 'package:recipe_app/app_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Safe area // Clips content from status bar when we don't use AppBar
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Hello,',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text('Welcome back', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 50),

              // email field
              const Text('Name'),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  hintStyle: TextStyle(color: hintColor, fontSize: 12),
                  // enabled: false,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: border),
                  ),
                  focusedBorder: const OutlineInputBorder(),
                ),
              ),

              // Spacing
              const SizedBox(height: 30),

              // Password field
              const Text('Password'),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  hintStyle: TextStyle(color: hintColor, fontSize: 12),
                  // enabled: false,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: border),
                  ),
                  focusedBorder: const OutlineInputBorder(),
                ),
              ),

              //Spcaer
              const SizedBox(height: 20),
              Text(
                'Forget password?',
                style: TextStyle(color: secondary, fontSize: 12),
              ),
              //Spcaer
              const SizedBox(height: 25),

              // Login button
              SizedBox(
                // Don't use in row and column double.infinity
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignInScreen();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Sign in'),
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
                      horizontal: 70,
                      vertical: 15,
                    ),
                  ),
                ),
              ),

              // Divider
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50.0,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    Expanded(child: Divider(color: border, thickness: 3)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Or Sign in with'),
                    ),
                    Expanded(child: Divider(color: border, thickness: 3)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
