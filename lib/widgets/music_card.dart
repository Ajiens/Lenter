import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenter/models/song.dart';
import 'package:lenter/screens/main_initial.dart';
import 'package:lenter/widgets/const.dart';

import 'package:flutter/src/widgets/image.dart' as img;

class MusicCard extends StatefulWidget {
  Song song;
  AudioPlayerHelper playerHelper;
  
  MusicCard({Key? key,
    required this.song,
    required this.playerHelper}) : super(key: key);

  @override
  State<MusicCard> createState() => _MusicCardState();
}

class _MusicCardState extends State<MusicCard> {
  int test = 0;

  void playSong(Song songArg){
    widget.playerHelper.setSongID(songArg.id);
    widget.playerHelper.player.play(UrlSource("${Constant.endPoint}${songArg.audioFile}"));
    print(widget.playerHelper.getSongID);
  }
  void pauseSong(Song songArg){
    widget.playerHelper.setSongID(0); //
    widget.playerHelper.player.pause();
    print(widget.playerHelper.getSongID);
  }
  
  @override
  Widget build(BuildContext context) {
    Song song = widget.song;
    return LayoutBuilder(
      builder:(context, constraints) {
        double _width = constraints.maxWidth;

        return Container(
          width: _width,
          height: 100,
          decoration: BoxDecoration(
            color: Constant.blackSecondary,
            borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(7), // Optional: add border radius
                  child: img.Image.network(
                    "${Constant.endPoint}${song.coverImage}",
                    fit: BoxFit.cover, // Optional: set fit property to cover
                    height: 80, width: 80, 
                  ),
                ),
                SizedBox(width: 7,),
                Container(
                  width: _width-111,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(song.title.length < _width/14.5 
                          ? song.title as String 
                          : "${song.title.substring(0, (_width/14.5).floor()) as String}...",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                            ),
                          ),
                          Text(song.artist as String,
                            style: GoogleFonts.poppins(
                              color: const Color.fromARGB(139, 255, 255, 255),
                              fontWeight: FontWeight.w400,
                              fontSize: 12
                            ),
                          )
                        ],
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (widget.playerHelper.getSongID == 0){
                                    playSong(song);
                                    widget.playerHelper.setSongID(song.id);
                                  }else{
                                    pauseSong(song);
                                    widget.playerHelper.setSongID(0);
                                  } 
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  gradient: Constant.gradientColor,
                                  borderRadius: BorderRadius.circular(70)
                                ),
                                child:Icon((widget.playerHelper.getSongID == 0 &&  widget.playerHelper.getSongID == song.id)
                                  ?Icons.play_arrow_rounded
                                  :Icons.pause_outlined,
                                color: Colors.white, size: 25,),
                              )
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                )
              ],
            )
          )
        );
      },
    );
  }
}