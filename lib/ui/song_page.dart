import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lyrics_ml/services/network_helper.dart';
import 'package:lyrics_ml/utils/song_details.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SongPage extends StatefulWidget {
  static const routeName = '/song_page';
  final SongDetails currentSong;

  SongPage(this.currentSong);

  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  bool isHindi = true;

  //Variable to determine whether link is available/net is connected.
  bool isLinkAvail = true;

  //Info to be displayed if net is not on/link is not available.
  String linkInfo = '';
  YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    if (widget.currentSong.youTubeLink.length != null &&
        widget.currentSong.youTubeLink.length > 2) {
      NetworkHelper().checkNetworkConnection().then((value) {
        isLinkAvail = value;
        if (isLinkAvail == false) {
          setState(() {
            linkInfo = 'Please check your Internet Connection!';
          });
        }
      });
      _youtubePlayerController = YoutubePlayerController(
        initialVideoId:
            YoutubePlayer.convertUrlToId(widget.currentSong.youTubeLink),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    } else {
      isLinkAvail = false;
      linkInfo = 'Song not available to listen.';
    }
  }

  @override
  Widget build(BuildContext context) {
    SongDetails currentSong = widget.currentSong;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentSong.songNameEnglish,
        ),
      ),
      body: Builder(
        builder: (context) => SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                SongCard(
                  currentSong: currentSong,
                  likesIcon: currentSong.isLiked == true
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  likesTap: () async {
                    currentSong.isLiked = !currentSong.isLiked;
                    setState(() {});
                  },
                  shareTap: () {
                    //Opens other app to share song.
                  },
                  youtubeTap: () {
                    String link = currentSong.youTubeLink;
                    if (link == null || link == '') {
                      print('link null');
                    } else {
                      print('Launching');
                    }
                  },
                  languageTap: () {
                    setState(() {
                      isHindi = !isHindi;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                isLinkAvail
                    ? YoutubePlayer(
                        controller: _youtubePlayerController,
                        showVideoProgressIndicator: true,
                        onReady: () {},
                      )
                    : Text(
                        linkInfo,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Lyrics',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF18191A),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                LyricsWidget(
                  lyrics:
                      isHindi ? currentSong.lyrics : currentSong.englishLyrics,
                ),
                Text(
                  '-----XXXXX-----',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF18191A),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget songFunctionIcon(
    {@required IconData icon, String text, Function onPress}) {
  return Column(
    children: [
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onPress,
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget miniCard(
    {int likes,
    int share,
    Function likesTap,
    IconData likesIcon,
    Function youtubeTap,
    Function languageTap,
    Function shareTap}) {
  return Card(
    margin: EdgeInsets.only(bottom: 0),
    color: Color(0xFF7DCFEF),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          songFunctionIcon(
            icon: likesIcon,
            text: likes.toString(),
            onPress: likesTap,
          ),
          SizedBox(
            width: 40,
          ),
          songFunctionIcon(
            icon: FontAwesomeIcons.youtube,
            text: 'Listen',
            onPress: youtubeTap,
          ),
          SizedBox(
            width: 40,
          ),
          songFunctionIcon(
            icon: FontAwesomeIcons.language,
            text: 'Language',
            onPress: languageTap,
          ),
          SizedBox(
            width: 40,
          ),
          songFunctionIcon(
            icon: FontAwesomeIcons.share,
            text: share.toString(),
            onPress: shareTap,
          ),
        ],
      ),
    ),
  );
}

class LyricsWidget extends StatelessWidget {
  final String lyrics;

  LyricsWidget({this.lyrics});

  String escapeCharacterIncluded() {
    String formatted = '';
    for (int i = 0; i < this.lyrics.length; i++) {
      if (this.lyrics[i] == '\\' && this.lyrics[i + 1] == 'n') {
        formatted = formatted + '\n';
        i = i + 1;
      } else {
        formatted = formatted + lyrics[i];
      }
    }
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      escapeCharacterIncluded(),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        color: Color(0xFF18191A),
      ),
    );
  }
}

// ignore: must_be_immutable
class SongCard extends StatelessWidget {
  final SongDetails currentSong;
  Function likesTap;
  Function youtubeTap;
  Function languageTap;
  Function shareTap;
  IconData likesIcon;

  SongCard(
      {@required this.currentSong,
      this.likesIcon,
      this.likesTap,
      this.languageTap,
      this.shareTap,
      this.youtubeTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      //Background Color of card.
      color: Color(0xFF54BEE6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              //Changes color of arrow when tile is not open.
              unselectedWidgetColor: Colors.white,
            ),
            child: ExpansionTile(
              title: Text(
                currentSong.songNameHindi,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              childrenPadding: EdgeInsets.only(
                bottom: 10,
              ),
              children: [
                if (currentSong.genre != null && currentSong.singer.length > 0)
                  Text('Genre: ${currentSong.genre}'),
                if (currentSong.singer != null && currentSong.singer.length > 0)
                  Text('Singer: ${currentSong.singer}'),
                if (currentSong.album != null && currentSong.album.length > 0)
                  Text('Album: ${currentSong.album}'),
                if (currentSong.originalSong != null &&
                    currentSong.originalSong.length > 0)
                  Text('Original Song: ${currentSong.originalSong}'),
                if (currentSong.language != null &&
                    currentSong.language.length > 0)
                  Text('Language: ${currentSong.language}'),
                if (currentSong.production != null &&
                    currentSong.production.length > 0)
                  Text('Production: ${currentSong.production}'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: miniCard(
              likes: currentSong.likes,
              likesTap: likesTap,
              likesIcon: likesIcon,
              youtubeTap: youtubeTap,
              languageTap: languageTap,
              share: currentSong.share,
              shareTap: shareTap,
            ),
          ),
        ],
      ),
    );
  }
}
