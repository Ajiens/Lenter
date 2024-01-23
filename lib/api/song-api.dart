import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lenter/models/song.dart';
class FetchSong {
  static Future<List<Song>> fetchSong() async {
    var url = Uri.parse('http://localhost:8000/song/?format=json');

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
}
