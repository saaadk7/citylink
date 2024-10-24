import 'package:citylink/screens/news_article_screen.dart';
import 'package:citylink/screens/splash_screen.dart';
import 'package:citylink/screens/video_player_screen.dart';
import 'package:citylink/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CityLink',
      theme: ThemeData(

        dividerColor: Colors.transparent,
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: const Color(0xff021024),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor:   Color(0xff021024),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        // Add gradient background for the app
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/navBar': (context) => const CustomNavigationBar(),
        '/videoPlayer': (context) => const VideoPlayerScreen(),
        '/newsArticle': (context) => const NewsArticleScreen(),
      },
    );
  }
}
