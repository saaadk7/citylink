import 'package:flutter/material.dart';
import '../widgets/news_article_card.dart';
import '../widgets/video_card.dart';
import 'package:citylink/widgets/nevigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CityLink'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NewsArticleCard(
              title: 'City News 1',
              imageUrl: 'https://example.com/image.jpg',
              onTap: () {
                Navigator.pushNamed(context, '/newsArticle');
              },
            ),
            const SizedBox(height: 10),
            VideoCard(
              title: 'City Video 1',
              thumbnail: 'https://example.com/video.jpg',
              onTap: () {
                Navigator.pushNamed(context, '/videoPlayer');
              },
            ),
          ],
        ),
      ),
      //bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
