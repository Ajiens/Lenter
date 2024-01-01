import 'package:flutter/material.dart';
import 'package:lenter/screens/landing_page.dart';
import 'package:lenter/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)), 
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return SpalashScreen();
        }
        else{
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const LandingPage(),
          );
        }
      }
    );
  }
}
