import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  int likeCount = 100;
  int dislikeCount = 20;
  int shareCount = 50;
  List<Map<String, dynamic>> comments = [
    {
      'user': 'User1',
      'content': 'This is an awesome video!',
      'likes': 12,
      'replies': [],
    },
    {
      'user': 'User2',
      'content': 'Great content!',
      'likes': 5,
      'replies': [],
    },
    {
      'user': 'User3',
      'content': 'Very informative. Thanks!',
      'likes': 8,
      'replies': [],
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'nPt8bK2gbaU', // Example video ID
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  void _toggleLike() {
    setState(() {
      likeCount += 1;
    });
  }

  void _toggleDislike() {
    setState(() {
      dislikeCount += 1;
    });
  }

  void _incrementShare() {
    setState(() {
      shareCount += 1;
    });
  }

  void _addReply(int commentIndex, String replyContent) {
    setState(() {
      comments[commentIndex]['replies'].add(replyContent);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            title: const Text('Video Player'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () {
                print('Player is ready.');
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Video Title',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text('1M views • 1 day ago'),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildAnimatedIconButton(
                          Icons.thumb_up, 'Like', _toggleLike, likeCount),
                      _buildAnimatedIconButton(Icons.thumb_down, 'Dislike',
                          _toggleDislike, dislikeCount),
                      _buildAnimatedIconButton(
                          Icons.share, 'Share', _incrementShare, shareCount),
                    ],
                  ),
                  const Divider(),
                  const Text(
                    'Video description goes here. It can be multiple lines long and will give users information about the video content.',
                  ),
                  const Divider(),
                  const Text(
                    'Comments',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  _buildCommentSection(),
                  const Divider(),
                  const Text(
                    'You Might Like',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  _buildSuggestedVideos(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedIconButton(
      IconData icon, String label, Function onTap, int count) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.pink, Colors.amber],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(icon, size: 20),
          ),
          const SizedBox(height: 4),
          Text('$count'),
        ],
      ),
    );
  }

  Widget _buildCommentSection() {
    return Column(
      children: List.generate(comments.length, (index) {
        return _buildComment(index);
      }),
    );
  }

  Widget _buildComment(int index) {
    final comment = comments[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment['user'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(comment['content']),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _buildCommentAction(
                            Icons.thumb_up, '${comment['likes']}'),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            _showReplyDialog(index);
                          },
                          child: const Text(
                            'Reply',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...List.generate(comment['replies'].length, (replyIndex) {
            return Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 4.0),
              child: Text(
                comment['replies'][replyIndex],
                style: const TextStyle(color: Colors.grey),
              ),
            );
          }),
        ],
      ),
    );
  }

  void _showReplyDialog(int commentIndex) {
    TextEditingController replyController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Reply to Comment'),
          content: TextField(
            controller: replyController,
            decoration:
                const InputDecoration(hintText: 'Enter your reply here'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _addReply(commentIndex, replyController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Reply'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCommentAction(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 16),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildSuggestedVideos() {
    return Column(
      children: [
        _buildSuggestedVideo('Suggested Video 1'),
        _buildSuggestedVideo('Suggested Video 2'),
        _buildSuggestedVideo('Suggested Video 3'),
      ],
    );
  }

  Widget _buildSuggestedVideo(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 70,
            color: Colors.grey,
            child: const Icon(Icons.play_circle_fill, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
