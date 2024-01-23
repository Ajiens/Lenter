import 'package:flutter/material.dart';
import 'package:lenter/screens/landing_page.dart';
import 'package:lenter/screens/main_initial.dart';
import 'package:lenter/screens/search_page.dart';
import 'package:lenter/screens/splash_screen.dart';

import 'models/song.dart';
import 'api/song-api.dart';



Future<void> main() async {
  
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
  
  FetchSong.fetchSong().then((List<Song> fetchedBooks) {
    // print(fetchedBooks);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 0)), 
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
            home: const MainInitial(),
          );
        }
      }
    );
  }
}
