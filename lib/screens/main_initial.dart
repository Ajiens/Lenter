import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:lenter/screens/account_page.dart';
import 'package:lenter/screens/home_page.dart';
import 'package:lenter/screens/music_page.dart';
import 'package:lenter/screens/search_page.dart';
import 'package:lenter/widgets/const.dart';

class MainInitial extends StatefulWidget {
  const MainInitial({super.key});

  @override
  State<MainInitial> createState() => _MainInitialState();
}

class _MainInitialState extends State<MainInitial> {
  bool _showFab = true;
  late PageController _pageController;
  int current = 1;

  final AudioPlayerHelper musicPlayer = AudioPlayerHelper();

  @override
  void initState(){
    _pageController = PageController(initialPage: 1);
    super.initState();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    const duration = Duration(milliseconds: 300);
    
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: AnimatedSlide(
        duration: duration,
        offset: _showFab ? Offset.zero : Offset(0, 2),
        child: AnimatedOpacity(
          duration: duration,
          opacity: _showFab ? 1 : 0,
          child:  Container( //Buttom Navbar
            height: 77,
            width: (media.size.width < 500) ? media.size.width/1.2 : 500,
            decoration: BoxDecoration(
              color: Constant.blackSecondary,
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageController.jumpToPage(0);
                        _showFab = true;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home,
                          size: 32,
                          color: (current == 0)?Constant.accentPrimary:Color(0xFF7E7D7F),
                        ),
                        Text("Home",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: (current == 0)?Constant.accentPrimary:Color(0xFF7E7D7F)
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageController.jumpToPage(1);
                        _showFab = true;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search,
                          size: 32,
                          color: (current == 1)?Constant.accentPrimary:Color(0xFF7E7D7F),
                        ),
                        Text("Search",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: (current == 1)?Constant.accentPrimary:Color(0xFF7E7D7F)
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageController.jumpToPage(2);
                        _showFab = true;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.headphones,
                          size: 32,
                          color: (current == 2)?Constant.accentPrimary:Color(0xFF7E7D7F),
                        ),
                        Text("Music",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: (current == 2)?Constant.accentPrimary:Color(0xFF7E7D7F)
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageController.jumpToPage(3);
                        _showFab = true;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person,
                          size: 32,
                          color: (current == 3)?Constant.accentPrimary:Color(0xFF7E7D7F),
                        ),
                        Text("Account",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: (current == 3)?Constant.accentPrimary:Color(0xFF7E7D7F)
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          )
        ),
      ),
      body:  NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          
          setState(() {
            if (direction == ScrollDirection.reverse) {
              _showFab = false;
            } else if (direction == ScrollDirection.forward) {
              _showFab = true;
            }
          });
          return true;
        },
        child: PageView(
          controller: _pageController,
          onPageChanged: (index){
            setState(() {
              current = index;
              _showFab = true;
            });
          },
          children: [
            HomePage(),
            SearchPage(),
            MusicPage(playerHelper: musicPlayer,),
            AccountPage(),
          ],
        ),
      )
    );
  }
}

class AudioPlayerHelper extends AudioPlayer{
  final AudioPlayer playerSong = AudioPlayer();
  int songID = 0;

  AudioPlayer get player => playerSong;
  int get getSongID => songID;

  int setSongID(int newID){
    int songIdBefore = songID;
    songID = newID;
    return songIdBefore;
  }

}