import 'package:flutter/material.dart';
import 'package:lyrics_ml/ui/tab%20screens/edit.dart';
import 'package:lyrics_ml/ui/tab%20screens/page.dart';
import 'package:lyrics_ml/ui/tab%20screens/playlist.dart';
import 'package:lyrics_ml/ui/tab%20screens/trending.dart';
import 'tab screens/settings.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main_screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: IndexedStack(
        children: <Widget>[
          Trending(),
          Edit(),
          Playlist(),
          Settings(),
          RandomPage(),
        ],
        index: _selectedPageIndex,
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            width: size.width,
            height: 80,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(size.width, 80),
                  painter: BNBCustomPainter(),
                ),
                Center(
                  heightFactor: 0.6,
                  child: FloatingActionButton(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.playlist_play),
                      elevation: 0.1,
                      onPressed: () {
                        _selectPage(2);
                      }),
                ),
                Container(
                  width: size.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.trending_up,
                          color: _selectedPageIndex == 0
                              ? Colors.blue
                              : Colors.grey.shade400,
                        ),
                        onPressed: () {
                          _selectPage(0);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.edit_attributes_outlined,
                          color: _selectedPageIndex == 1
                              ? Colors.blue
                              : Colors.grey.shade400,
                        ),
                        onPressed: () {
                          _selectPage(1);
                        },
                      ),
                      Container(
                        width: size.width * 0.20,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.settings,
                            color: _selectedPageIndex == 3
                                ? Colors.blue
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            _selectPage(3);
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.ramen_dining,
                            color: _selectedPageIndex == 4
                                ? Colors.blue
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            _selectPage(4);
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
