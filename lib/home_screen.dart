import 'package:flutter/material.dart';
import 'package:recipe_app/app_colors.dart';
import 'package:recipe_app/tabs/add_tab.dart';
import 'package:recipe_app/tabs/book_mark_tab.dart';
import 'package:recipe_app/tabs/home_tab.dart';
import 'package:recipe_app/tabs/notification_tab.dart';
import 'package:recipe_app/tabs/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  PageController pageController = PageController();
  List<Widget> tabs = [
    const HomeTab(),
    const BookMarkTab(),
    const AddTab(),
    const NotificationTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    pageIndex = value;
                  });
                },
                itemCount: tabs.length,
                itemBuilder: (context, index) {
                  return tabs[index];
                },
              ),
            ),
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
                          children: [
                            const Spacer(flex: 1),
                            IconButton(
                              onPressed: () {
                                pageIndex = 0;
                                pageController.animateToPage(
                                  0,
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.easeInOut,
                                );
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.home_filled,
                                color: pageIndex == 0 ? primary : grey,
                                size: 30,
                              ),
                            ),
                            const Spacer(flex: 2),
                            IconButton(
                              onPressed: () {
                                pageIndex = 1;
                                pageController.animateToPage(
                                  1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.bookmark_outline,
                                color: pageIndex == 1 ? primary : grey,
                                size: 30,
                              ),
                            ),
                            const Spacer(flex: 8),
                            IconButton(
                              onPressed: () {
                                pageIndex = 3;
                                pageController.animateToPage(
                                  3,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.notifications,
                                color: pageIndex == 3 ? primary : grey,
                                size: 30,
                              ),
                            ),
                            const Spacer(flex: 2),
                            IconButton(
                              onPressed: () {
                                pageIndex = 4;
                                pageController.animateToPage(
                                  4,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.person,
                                color: pageIndex == 4 ? primary : grey,
                                size: 30,
                              ),
                            ),
                            const Spacer(flex: 1),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: pageIndex == 2 ? primary : white,
                        shape: BoxShape.circle,
                        boxShadow: [const BoxShadow(blurRadius: 2)],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            pageIndex = 2;
                            pageController.animateToPage(
                              2,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: pageIndex == 2 ? white : primary,
                            size: 45,
                          ),
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
    );
  }
}
