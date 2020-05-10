import 'package:flutter/material.dart';
import 'package:language_cards/src/pages/lessons_page.dart';
import 'package:language_cards/src/pages/settings_page.dart';
import 'package:language_cards/src/pages/verbs_page.dart';

class HomePage extends StatefulWidget {
  static final String routeName = 'home';
  @override
  _HomePageState createState() => _HomePageState();
}

int currentIndex = 0;

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Language cards',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: _callPage(currentIndex, scaffoldKey),
      bottomNavigationBar: _crearBottomNavigationBar(),
    );
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
        size: 30.0,
      ),
      selectedItemColor: Theme.of(context).primaryColor,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      elevation: 5.0,
      currentIndex: currentIndex,
      items: [
        bottomBarItem(Icons.home, 'Words'),
        bottomBarItem(Icons.chrome_reader_mode, 'Verbs'),
        bottomBarItem(Icons.sort_by_alpha, 'Grammar'),
      ],
    );
  }

  BottomNavigationBarItem bottomBarItem(IconData icon, String name) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
      ),
      title: Text(name),
    );
  }

  _callPage(int paginaActual, GlobalKey<ScaffoldState> scaffoldKey) {
    switch (paginaActual) {
      case 0:
        return LessonsPage();
      case 1:
        return VerbsPage();
      case 2:
        return SettingsPage();
      default:
        return LessonsPage();
    }
  }
}
