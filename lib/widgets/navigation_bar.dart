import 'package:citylink/presentation/home_screen_new.dart';
import 'package:citylink/screens/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:citylink/screens/events_screen.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import '../presentation/article_screen_new.dart'; // Ensure you have this package in your pubspec.yaml

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  List<Widget> screensList = [
    const HomeScreenNew(),
    const ArticleScreenNew(),
    const EventsScreen(),
    const AccountScreen(),
    // Add another screen for the fourth tab
    // Placeholder for the fourth screen
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
          selectedItemColor: Colors.blue,
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

            ),
            CrystalNavigationBarItem(
              icon: Icons.article, // Use IconData instead of Icon

            ),
            CrystalNavigationBarItem(
              icon: Icons.video_library, // Use IconData instead of Icon

            ),
            CrystalNavigationBarItem(
              icon: Icons.account_circle, // Use IconData instead of Icon

            ),
          ],
        ),
      ),
    );
  }
}
