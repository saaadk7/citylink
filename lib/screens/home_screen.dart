import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../widgets/news_article_card.dart';
import '../widgets/video_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showMoreVideos = false;
  bool _showMoreArticles = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildAppBar(),
            _buildVideoSection(context),
            const Divider(),
            _buildArticleSection(context),
            const Divider(),
            _buildServiceSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.amber, Colors.pink],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: AppBar(
        centerTitle: true,
        title: const Text(
          'CityLink',
          textAlign: TextAlign.center,
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Action for search button
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70, // Adjusting the height of the AppBar
      ),
    );
  }

  Widget _buildVideoSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Latest Videos',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              _buildVideoTile(
                  context,
                  'City Video 1',
                  'https://example.com/video1.jpg',
                  'Description of City Video 1.'),
              _buildVideoTile(
                  context,
                  'City Video 2',
                  'https://example.com/video2.jpg',
                  'Description of City Video 2.'),
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: IconButton(
              icon: const Icon(Icons.arrow_drop_down, size: 40),
              onPressed: () {
                setState(() {
                  _showMoreVideos = !_showMoreVideos;
                });
              },
            ),
          ),
          if (_showMoreVideos) _buildMoreVideos(context),
        ],
      ),
    );
  }

  Widget _buildVideoTile(BuildContext context, String title, String thumbnail,
      String description) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/videoPlayer');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: VideoCard(
            title: title,
            thumbnail: thumbnail,
            onTap: () {
              // Navigate to video player
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMoreVideos(BuildContext context) {
    return Column(
      children: [
        const Text(
          'More Videos',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            _buildVideoTile(
                context,
                'City Video 4',
                'https://example.com/video4.jpg',
                'Description of City Video 4.'),
            _buildVideoTile(
                context,
                'City Video 5',
                'https://example.com/video5.jpg',
                'Description of City Video 5.'),
          ],
        ),
      ],
    );
  }

  Widget _buildArticleSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Latest Articles',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              _buildArticleTile(
                  context,
                  'City News 1',
                  'https://example.com/article1.jpg',
                  'Brief description of City News 1.'),
              _buildArticleTile(
                  context,
                  'City News 2',
                  'https://example.com/article2.jpg',
                  'Brief description of City News 2.'),
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: IconButton(
              icon: const Icon(Icons.arrow_drop_down, size: 40),
              onPressed: () {
                setState(() {
                  _showMoreArticles = !_showMoreArticles;
                });
              },
            ),
          ),
          if (_showMoreArticles) _buildMoreArticles(context),
        ],
      ),
    );
  }

  Widget _buildArticleTile(
      BuildContext context, String title, String imageUrl, String description) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/newsArticle');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: NewsArticleCard(
            title: title,
            imageUrl: imageUrl,
            onTap: () {
              // Navigate to news article
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMoreArticles(BuildContext context) {
    return Column(
      children: [
        const Text(
          'More Articles',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            _buildArticleTile(
                context,
                'City News 4',
                'https://example.com/article4.jpg',
                'Brief description of City News 4.'),
            _buildArticleTile(
                context,
                'City News 5',
                'https://example.com/article5.jpg',
                'Brief description of City News 5.'),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Services',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: List.generate(4, (index) {
              return _buildServiceButton(index);
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceButton(int index) {
    List<Map<String, dynamic>> services = [
      {
        'icon': Icons.local_shipping,
        'label': 'Delivery',
        'color': Colors.red[200]
      },
      {'icon': Icons.restaurant, 'label': 'Food', 'color': Colors.blue[200]},
      {
        'icon': Icons.local_offer,
        'label': 'Offers',
        'color': Colors.green[200]
      },
      {'icon': Icons.support, 'label': 'Support', 'color': Colors.orange[200]},
    ];

    return GestureDetector(
      onTap: () {
        // Action on service button click
        print("Service Clicked: ${services[index]['label']}");
      },
      child: Card(
        color: services[index]['color'], // Different color for each service box
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(services[index]['icon'], size: 40, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                services[index]['label'],
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
