import 'package:flutter/material.dart';

class NewsArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News Article')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('https://example.com/article_image.jpg'),
            const SizedBox(height: 10),
            const Text(
              'Article Title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Article content goes here...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.article), label: 'News'),
          NavigationDestination(icon: Icon(Icons.video_library), label: 'Videos'),
        ],
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/newsArticle');
              break;
            case 2:
              Navigator.pushNamed(context, '/videoPlayer');
              break;
          }
        },
        selectedIndex: 1, // Choose the index of the selected item
      ),
    );
  }
}
