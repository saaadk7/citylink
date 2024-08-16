import 'package:citylink/screens/home_screen.dart';
import 'package:citylink/screens/news_article_screen.dart';
import 'package:citylink/screens/video_player_screen.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  List<Widget>screensList=[
   const  HomeScreen(),
    NewsArticleScreen(),
    VideoPlayerScreen(),
  ];
  int _index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screensList[_index],
      bottomNavigationBar:
      BottomNavigationBar(
      currentIndex: _index,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.article), label: 'News'),
        BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Videos'),
      ],
      onTap: (index) {
      setState(() {
       _index=index;
      });
      },
    )
    );
  }
}
