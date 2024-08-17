import 'package:citylink/screens/home_screen.dart';
import 'package:citylink/screens/news_article_screen.dart';
import 'package:citylink/screens/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart'; // Ensure you have this package in your pubspec.yaml

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  List<Widget> screensList = [
    const HomeScreen(),
    const NewsArticleScreen(),
    const VideoPlayerScreen(),
    // Add another screen for the fourth tab
    Container(color: Colors.blue), // Placeholder for the fourth screen
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: screensList[_index],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(
          currentIndex: _index,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black.withOpacity(0.1),
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
          items: [
            CrystalNavigationBarItem(
              icon: Icons.home, // Use IconData instead of Icon
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
              icon: Icons.article, // Use IconData instead of Icon
              selectedColor: Colors.red,
            ),
            CrystalNavigationBarItem(
              icon: Icons.video_library, // Use IconData instead of Icon
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
              icon: Icons.account_circle, // Use IconData instead of Icon
              selectedColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
