import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lenter/models/song.dart';
class FetchSong {
  static Future<List<Song>> fetchSong() async {
    var url = Uri.parse('http://10.0.2.2:8000/song/?format=json');

    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<Song> songList =[];
    songList.clear(); // Menghapus elemen-elemen sebelum menambahkan yang baru

    for (var d in data) {
      if (d != null) {
        songList.add(Song.fromJson(d));
      }
    }
    print(songList);
    return songList;
  }

  List<Song> dummySongList(){
    List<Song> songs = [
      Song(
        id: 1,
        title: 'Shape of You',
        artist: 'Ed Sheeran',
        audioFile: 'shape_of_you.mp3',
        coverImage: 'shape_of_you_cover.jpg',
        coverLink: 'https://example.com/cover/shape_of_you',
        audioLengthString: '3:53',
        audioLengthSecond: 233,
        createdAt: DateTime(2023, 5, 1, 14, 30),
      ),
      Song(
        id: 2,
        title: 'Blinding Lights',
        artist: 'The Weeknd',
        audioFile: 'blinding_lights.mp3',
        coverImage: 'blinding_lights_cover.jpg',
        coverLink: 'https://example.com/cover/blinding_lights',
        audioLengthString: '3:20',
        audioLengthSecond: 200,
        createdAt: DateTime(2023, 6, 10, 16, 45),
      ),
      Song(
        id: 3,
        title: 'Levitating',
        artist: 'Dua Lipa',
        audioFile: 'levitating.mp3',
        coverImage: 'levitating_cover.jpg',
        coverLink: 'https://example.com/cover/levitating',
        audioLengthString: '3:24',
        audioLengthSecond: 204,
        createdAt: DateTime(2023, 7, 25, 12, 0),
      ),
    ];
  return songs;
  }
}
