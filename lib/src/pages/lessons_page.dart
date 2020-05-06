import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:language_cards/src/bloc/colletion_bloc.dart';
import 'package:language_cards/src/pages/word_cards_page.dart';

class LessonsPage extends StatelessWidget {

  final CollectionBloc collectionBloc = CollectionBloc();
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //_botonesRedondeados(context),
          _lessonVault(context),
        ],
      ),
    );
  }

  Widget _lessonVault(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: <Widget>[
        _crearBotonRedondeado(
          context,
          Colors.green,
          Icons.bubble_chart,
          "Nature",
          'fruits',
        ),
        _crearBotonRedondeado(
          context,
          Colors.orange,
          Icons.business,
          "City Life",
          'city',
        ),
        _crearBotonRedondeado(
          context,
          Colors.purple,
          Icons.people,
          "People",
          'people',
        ),
        _crearBotonRedondeado(
          context,
          Colors.red,
          Icons.comment,
          "Communication",
          'communication',
        ),
        SizedBox(height:300)
      ],
    );
  }

  Widget _crearBotonRedondeado(
      BuildContext context, Color color, IconData icon, String texto, String collection) {
    final _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        print("item touched");
        collectionBloc.setCollection(collection);
        Navigator.pushNamed(context, WordCardsPage.routeName);
      },
      child: Container(
        width: _screenSize.width*0.4,
        height: _screenSize.height * 0.25,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 3.0,
              offset: Offset(2.0,10.0),
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
