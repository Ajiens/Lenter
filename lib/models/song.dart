// To parse this JSON data, do
//
//     final song = songFromJson(jsonString);

import 'dart:convert';

List<Song> songFromJson(String str) => List<Song>.from(json.decode(str).map((x) => Song.fromJson(x)));

String songToJson(List<Song> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Song {
    int id;
    String title;
    String artist;
    String audioFile;
    String coverImage;
    String coverLink;
    String audioLengthString;
    int audioLengthSecond;
    DateTime createdAt;

    Song({
        required this.id,
        required this.title,
        required this.artist,
        required this.audioFile,
        required this.coverImage,
        required this.coverLink,
        required this.audioLengthString,
        required this.audioLengthSecond,
        required this.createdAt,
    });

    factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json["id"],
        title: json["title"],
        artist: json["artist"],
        audioFile: json["audio_file"],
        coverImage: json["cover_image"],
        coverLink: json["cover_link"],
        audioLengthString: json["audio_length_string"],
        audioLengthSecond: json["audio_length_second"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "artist": artist,
        "audio_file": audioFile,
        "cover_image": coverImage,
        "cover_link": coverLink,
        "audio_length_string": audioLengthString,
        "audio_length_second": audioLengthSecond,
        "created_at": createdAt.toIso8601String(),
    };
}
