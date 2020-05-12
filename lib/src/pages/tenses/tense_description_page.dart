import 'package:flutter/material.dart';
import 'package:language_cards/src/bloc/colletion_bloc.dart';
import 'package:language_cards/src/models/examples_model.dart';
import 'package:language_cards/src/models/grammar_model.dart';
import 'package:language_cards/src/services/database.dart';

class DescriptionPage extends StatelessWidget {
  final String namePage;
  DescriptionPage({this.namePage});
  static final String routeName = 'description';
  final CollectionBloc collection = CollectionBloc();
  final DatabaseService fireStoreDb = DatabaseService();
  static final String id = 'bBnhr0G8ONTgktPgAFqZ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: StreamBuilder<String>(
        stream: collection.collectionStream,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          String tense = snapshot.data;
          return Stack(
            children: <Widget>[
              background(context),
              _pageContent(tense),
            ],
          );
        },
      ),
    );
  }

  SingleChildScrollView _pageContent(String tense) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _grammarViewer(tense),
          _examplesViewer(tense),
        ],
      ),
    );
  }

  Widget _grammarViewer(String tense) {
    return StreamBuilder<GrammarModel>(
      stream: fireStoreDb.obtenerGramatica(id, tense),
      builder: (BuildContext context, AsyncSnapshot<GrammarModel> snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        final GrammarModel grammar = snapshot.data;
        return Container(
          color: Colors.transparent,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          child: Column(
            children: <Widget>[
              _cardexplanation(context, grammar),
            ],
          ),
        );
      },
    );
  }

  Widget _examplesViewer(String tense) {
    return StreamBuilder<ExamplesModel>(
      stream: fireStoreDb.obtenerEjemplos(id, tense),
      builder: (BuildContext context, AsyncSnapshot<ExamplesModel> snapshot) {
        if (!snapshot.hasData) return Container();
        final ExamplesModel examples = snapshot.data;
        return Container(
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              _exampleCard(context, examples),
            ],
          ),
        );
      },
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        namePage,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  _cardexplanation(context, GrammarModel gram) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: _screenSize.width * 1,
      margin: EdgeInsets.only(
        top: 15.0,
        left: 15.0,
        right: 15.0,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _title('Uso', TextAlign.left),
            _explanantion(gram.explanation),
            Divider(),
            _title("Estructura", TextAlign.left),
            SizedBox(height: 20.0),
            _estructureView(gram.estructure),
            SizedBox(height: 10.0),
            Divider(),
          ],
        ),
      ),
    );
  }

  Container _explanantion(String explanation) {
    return Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        child: Text(
          explanation,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.justify,
        ));
  }

  Row _title(String title, TextAlign align) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.w400),
            textAlign: align,
          ),
        ),
      ],
    );
  }

  _estructureView(String estructure) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Text(
        estructure,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  _exampleCard(context, ExamplesModel examples) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      width: _screenSize.width * 1,
      margin: EdgeInsets.only(right: 15.0, left: 15.0),
      decoration: BoxDecoration(color: Colors.transparent),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _title('Ejemplos', TextAlign.center),
            SizedBox(height: 5.0),
            _phraseBox('Afirmación', examples.afirmacion),
            SizedBox(height: 20.0),
            _phraseBox('Negación', examples.negacion),
            SizedBox(height: 20.0),
            _phraseBox('Interrogación', examples.interrogacion),
            SizedBox(height: 20.0),
            Divider(),
          ],
        ),
      ),
    );
  }

  Container _phraseBox(String title, String frase) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: <Widget>[
          _titlePhrases(title),
          _phraseViewer(frase),
        ],
      ),
    );
  }

  _titlePhrases(String s) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 4,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Text(
            s,
            style: TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  _phraseViewer(String afirmacion) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Text(
        afirmacion,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  background(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(top: -13, right: -70, child: _circle(255, 178, 133, 0.2)),
          Positioned(top: 150, left: 10, child: _circle(165, 201, 250, 0.2)),
          Positioned(top: 350, right: 10, child: _circle(185, 170, 189, 0.2)),
        ],
      ),
    );
  }

  Container _circle(r, g, b, a) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(r, g, b, a),
      ),
    );
  }
}
