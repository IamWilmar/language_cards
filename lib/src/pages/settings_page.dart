import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final TextStyle tileTitle = TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w300);
  @override
  Widget build(BuildContext context) {
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
            context, Colors.blue, Icons.airline_seat_individual_suite, "Presente", "keep"),
        _crearBotonRedondeado(
            context, Colors.orange, Icons.fast_rewind, "Pasado", "keep"),
        _crearBotonRedondeado(
            context, Colors.green, Icons.forward, "Futuro", "keep"),
      ],
    );
  }

  Widget _crearBotonRedondeado(BuildContext context, Color color, IconData icon,
      String texto, String collection) {
    final _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical:10.0),
        width: _screenSize.width * 1,
        height: _screenSize.height * 0.25,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
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
