import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recipe/screen/auth_screens/splash.dart';
import 'package:recipe/screen/bottom_nav_bar/4_favorite_screens/provider/favorite_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recipe/screen/sidebar_screens/chatbot/chatbot_screen.dart'; // ✅ Import chatbot screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // init the hive
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: MaterialApp(
        home: const SplashPage(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/chatbot': (context) => const ChatBotScreen(),
        },
      ),
    );
  }
}
