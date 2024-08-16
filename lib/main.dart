import 'package:citylink/screens/home_screen.dart';
import 'package:citylink/screens/news_article_screen.dart';
import 'package:citylink/screens/splash_screen.dart';
import 'package:citylink/screens/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/videoPlayer':(context)=> VideoPlayerScreen(),
        '/newsArticle':(context)=>NewsArticleScreen(),
      },

    );
  }
}
