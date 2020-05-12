import 'package:flutter/material.dart';
import 'package:language_cards/src/pages/tenses/future_page.dart';
import 'package:language_cards/src/pages/tenses/past_page.dart';
import 'package:language_cards/src/pages/tenses/present_page.dart';
import 'package:language_cards/src/pages/tenses/tense_description_page.dart';

class SettingsPage extends StatelessWidget {
  final TextStyle tileTitle = TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w300);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DescriptionPage().background(context),
        _pageContent(context),
      ],
    );
  }

  SingleChildScrollView _pageContent(BuildContext context) {
    return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _tensesObjects(context),
      ],
    ),
  );
  }

  _tensesObjects(BuildContext context) {
    return Wrap(
      children: <Widget>[
        _crearBotonRedondeado(
            context,
            Colors.blue,
            Icons.airline_seat_individual_suite,
            "Presente",
            PresentPage.routeName),
        _crearBotonRedondeado(
          context,
          Colors.orange,
          Icons.fast_rewind,
          "Pasado",
          PastPage.routeName,
        ),
        _crearBotonRedondeado(
          context,
          Colors.green,
          Icons.forward,
          "Futuro",
          FuturePage.routeName,
        ),
      ],
    );
  }

  Widget _crearBotonRedondeado(BuildContext context, Color color, IconData icon,
      String texto, String ruta) {
    final _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ruta);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        width: _screenSize.width * 1,
        height: _screenSize.height * 0.25,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: color,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 3.0,
              offset: Offset(2.0, 10.0),
            ),
          ],
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon(icon, color: Colors.white, size: 30.0),
              ),
              Divider(),
              Text(
                texto,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}
