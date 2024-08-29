import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:shimmer/shimmer.dart';

class NewsArticleScreen extends StatelessWidget {
  final List<Map<String, String>> articles = const [
    {
      'title': 'Article 1',
      'image':
          '//images.ctfassets.net/yadj1kx9rmg0/wtrHxeu3zEoEce2MokCSi/cf6f68efdcf625fdc060607df0f3baef/quwowooybuqbl6ntboz3.jpg',
      'content':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    },
    {
      'title': 'Article 2',
      'image': 'https://example.com/article_image_2.jpg',
      'content':
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    },
    {
      'title': 'Article 3',
      'image': 'https://example.com/article_image_3.jpg',
      'content':
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    },
    {
      'title': 'Article 4',
      'image': 'https://example.com/article_image_4.jpg',
      'content':
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    },
    // Add more articles here
  ];

  const NewsArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.amber],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
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
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Image.network(article['image']!,
                      height: 200, fit: BoxFit.cover),
                ),
                const SizedBox(height: 10),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Text(
                    article['title']!,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Text(
                    article['content']!,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle "Read more" functionality
                  },
                  child: const Text('...more'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIconButton(context, 'Like', Mdi.thumb_up_outline),
                    _buildIconButton(context, 'Share', Mdi.share_variant),
                    _buildReadCount(123), // Example read count
                  ],
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, String label, String icon) {
    return Column(
      children: [
        IconButton(
          icon: Iconify(icon),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$label button pressed')),
            );
          },
        ),
        Text(label),
      ],
    );
  }

  Widget _buildReadCount(int count) {
    return Row(
      children: [
        const Iconify(Mdi.eye_outline, size: 16),
        const SizedBox(width: 4),
        Text('$count readers', style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
