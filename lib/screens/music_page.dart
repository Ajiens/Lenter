import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenter/api/song-api.dart';
import 'package:lenter/models/song.dart';
import 'package:lenter/screens/main_initial.dart';
import 'package:lenter/widgets/const.dart';
import 'package:lenter/widgets/music_card.dart';

import 'package:flutter/src/widgets/image.dart' as img;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class MusicPage extends StatefulWidget {
  AudioPlayerHelper playerHelper;

  MusicPage({Key? key,
    required this.playerHelper}) : super(key: key);

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  late Future<List<Song>> _song;

  bool isLastSongInitialized = false;
  late Song lastSong;

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
  void initState() {
    super.initState();
    _song = FetchSong.fetchSong();

    _song.then((value) {
      setState(() {
        lastSong = value[value.length-1];
        isLastSongInitialized = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Constant.blackPrimary,
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        backgroundColor: Constant.blackPrimary,
        title: Text("Music Collection",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 280,
            child: (isLastSongInitialized)
              ? Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rectangle) {
                      return LinearGradient(
                        colors: [Colors.white, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        tileMode: TileMode.clamp,
                      ).createShader(Rect.fromLTRB(0, 0, rectangle.width, rectangle.height));
                    },
                    child: 
                      ClipRRect(
                        child: img.Image.network(
                          "${Constant.endPoint}${lastSong.coverImage}",
                          scale: 0.5,
                          fit: BoxFit.cover, // Optional: set fit property to cover
                          height: 280, width: media.size.width, 
                        ),
                      )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12), // Optional: add border radius
                          child: img.Image.network(
                            "${Constant.endPoint}${lastSong.coverImage}",
                            fit: BoxFit.cover, // Optional: set fit property to cover
                            height: 150, width: 150, 
                          ),
                        )
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 60,
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Container(
                                // color: Colors.amber,
                                width: media.size.width-120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("New Song",
                                      style: GoogleFonts.poppins(
                                        color: Constant.accentSecondary,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10
                                      ),
                                    ),
                                    Text(lastSong.title,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18
                                      ),
                                    ),
                                    Text(lastSong.artist,
                                      style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(139, 255, 255, 255),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 30,),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (widget.playerHelper.getSongID == 0){
                                      playSong(lastSong);
                                    }else{
                                      pauseSong(lastSong);
                                    } 
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    gradient: Constant.gradientColor,
                                    borderRadius: BorderRadius.circular(70)
                                  ),
                                  child: Icon((widget.playerHelper.getSongID == 0)?Icons.play_arrow_rounded:Icons.pause_outlined, color: Colors.white, size: 25,),
                                )
                              )

                            ]
                          ),
                        )
                      )
                    ],

                  ),
                ],
              )
            : null
          ),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 20),
            child: FutureBuilder<List<Song>>(
              future: _song,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child:CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                return Column(
                  children: List.generate(snapshot.data!.length, (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: MusicCard(song: snapshot.data![index], playerHelper: widget.playerHelper,),
                    );
                  }),
                );
                }
              },
            ),
          )
        ]
      )
    );
  }
}
