import 'package:flutter/material.dart';
import 'package:language_cards/src/pages/lessons_page.dart';
import 'package:language_cards/src/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  static final String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

int currentIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Language cards',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: _callPage(currentIndex),
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
        bottomBarItem(Icons.settings, 'Settings'),
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

  _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return LessonsPage();
      case 1:
        return LessonsPage();
      case 2:
        return SettingsPage();
      default:
        return LessonsPage();
    }
  }
}
