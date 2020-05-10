import 'package:flutter/material.dart';
import 'package:language_cards/src/bloc/colletion_bloc.dart';
import 'package:language_cards/src/pages/verbs_card_page.dart';
import 'package:language_cards/src/services/database.dart';

class VerbsPage extends StatelessWidget {
  final DatabaseService firestoreDb = DatabaseService();
  final uid = 'yE9F2SLjR9ryF5msZEEq';
  final collection = 'verbs';
  final CollectionBloc collectionBloc = CollectionBloc();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //_botonesRedondeados(context),
          SizedBox(height: 20),
          _verbsVault(context),
        ],
      ),
    );
  }

  Widget _verbsVault(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: <Widget>[
        _crearBotonRedondeado(
          context,
          Colors.red,
          Icons.translate,
          "Verbos A2-B1 1",
          'verbs A2B1 1',
        ),
        _crearBotonRedondeado(
          context,
          Colors.green,
          Icons.translate,
          "Verbos A2-B1 2",
          'verbs A2B1 2',
        ),
        _crearBotonRedondeado(
          context,
          Colors.orange,
          Icons.translate,
          "Verbos A2-B1 3",
          'verbs A2B1 3',
        ),
        _crearBotonRedondeado(
          context,
          Colors.amber,
          Icons.translate,
          "Verbos A2-B1 4",
          'verbs A2B1 4',
        ),
        _crearBotonRedondeado(
          context,
          Colors.blue,
          Icons.translate,
          "Verbos A2-B1 5",
          'verbs A2B1 5',
        ),
        _crearBotonRedondeado(
          context,
          Colors.purple,
          Icons.translate,
          "Verbos A2-B1 6",
          'verbs A2B1 6',
        ),
        SizedBox(height: 300)
      ],
    );
  }

  Widget _crearBotonRedondeado(BuildContext context, Color color, IconData icon,
      String texto, String collection) {
    final _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        print("item touched");
        collectionBloc.setCollection(collection);
        Navigator.pushNamed(context, VerbsCardPage.routeName);
      },
      child: Container(
        width: _screenSize.width * 0.4,
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
              Text(
                texto,
                style: Theme.of(context).textTheme.button,
              ),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}

//width: screenSize.width * 0.85,
