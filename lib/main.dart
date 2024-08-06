import 'package:flutter/material.dart';
import 'package:online_book_reading_app/screens/signin_screen.dart';
import 'package:online_book_reading_app/services/homebook_provider.dart';
import 'package:online_book_reading_app/services/searchprovider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(
          create: (context) => HomeBookProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: //HomeScreen(),
            const SignInScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
