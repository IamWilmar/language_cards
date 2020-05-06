import 'package:flutter/material.dart';
import 'package:language_cards/src/pages/home_page.dart';
import 'package:language_cards/src/pages/word_cards_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName      : (BuildContext context) => HomePage(),
        WordCardsPage.routeName : ( BuildContext context ) => WordCardsPage(),
      },
      theme: ThemeData(
        secondaryHeaderColor: Colors.black,
        appBarTheme: AppBarTheme(iconTheme:IconThemeData(color: Colors.black)),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        textTheme: TextTheme(
          title: TextStyle( color: Colors.black, fontWeight: FontWeight.w100, fontSize: 50.0, letterSpacing: 1.5 ),
          button: TextStyle( color: Colors.black, fontWeight: FontWeight.w300, fontSize: 15.0, letterSpacing: 1.0 ),
          subhead: TextStyle( color: Colors.white, fontWeight: FontWeight.w100, fontSize: 40.0, letterSpacing: 1.5 ),
        ),
      ),
    );
  }
}
