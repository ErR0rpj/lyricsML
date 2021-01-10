import 'package:flutter/material.dart';
import 'package:lyrics_ml/ui/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainTheme());
}

class MainTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          //Changes the color of icons on AppBars
          iconTheme: IconThemeData(
            color: Color(0xFF212323),
          ),
        ),
        primaryTextTheme: TextTheme(
          //changes color of AppBar title
          headline6: TextStyle(
            fontFamily: 'Pacifico',
            color: Color(0xFF212323),
          ),
        ),
        accentColor: Colors.white,
        textTheme: TextTheme(
          //changes color of expansion tile when closed
          subtitle1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: HomePage(),
    );
  }
}
