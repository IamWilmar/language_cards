import 'package:flutter/material.dart';
import 'package:language_cards/src/pages/tenses/tense_description_page.dart';
import 'package:language_cards/src/widgets/tile_widget.dart';

class FuturePage extends StatelessWidget {
  static final routeName = 'future';
  final TileView tile = TileView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Future Tenses",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Stack(
        children: <Widget>[
          DescriptionPage().background(context),
          _listCards(context),
        ],
      ),
    );
  }

  ListView _listCards(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        tile.makeCard(
          context,
          "Futuro Simple",
          "futuro_simple",
          Colors.green,
          Icons.forward,
        ),
        tile.makeCard(
          context,
          "Futuro Continuo",
          "futuro_continuo",
          Colors.green,
          Icons.forward,
        ),
        tile.makeCard(
          context,
          "Futuro Perfecto",
          "futuro_perfecto",
          Colors.green,
          Icons.forward,
        ),
        tile.makeCard(
          context,
          "Futuro Perfecto Continuo",
          "futuro_perfecto_continuo",
          Colors.green,
          Icons.forward,
        ),
      ],
    );
  }
}
