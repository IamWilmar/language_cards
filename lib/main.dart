import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:language_cards/src/pages/home_page.dart';
import 'package:language_cards/src/pages/verbs_card_page.dart';
import 'package:language_cards/src/pages/word_cards_page.dart';
import 'package:language_cards/src/shared_prefs/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        WordCardsPage.routeName: (BuildContext context) => WordCardsPage(),
        VerbsCardPage.routeName: (BuildContext context) => VerbsCardPage(),
      },
      theme: ThemeData(
        secondaryHeaderColor: Colors.black,
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w100,
              fontSize: 50.0,
              letterSpacing: 1.5),
          button: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 15.0,
              letterSpacing: 1.0),
          headline2: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w100,
              fontSize: 40.0,
              letterSpacing: 1.5),
          headline3: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w100,
              fontSize: 20.0,
              letterSpacing: 1.5),
          headline4: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w100,
              fontSize: 30.0,
              letterSpacing: 1.5),
        ),
      ),
    );
  }
}
