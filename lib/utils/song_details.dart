import 'package:flutter/cupertino.dart';

class SongDetails {
  String album;
  String category;
  String code;
  String genre;
  bool isLiked;
  String language;
  int likes;
  String lyrics;
  String englishLyrics;
  String originalSong;
  String production;
  int share;
  String singer;
  String songNameEnglish;
  String songNameHindi;
  String youTubeLink;

  SongDetails(
      {this.album,
        this.category,
        @required this.code,
        this.genre,
        this.language,
        this.likes: 0,
        @required this.lyrics,
        this.englishLyrics,
        this.originalSong: 'Unknown',
        this.production,
        this.share: 0,
        this.singer,
        @required this.songNameEnglish,
        @required this.songNameHindi,
        this.youTubeLink}) {
    if (likes == null) {
      this.likes = 0;
    }
    if (this.englishLyrics == null || this.englishLyrics.length <= 2) {
      this.englishLyrics =
      "English lyrics not Available right now! Switch language to Hindi.\n";
    }
  }
}
