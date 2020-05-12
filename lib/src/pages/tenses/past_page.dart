import 'package:flutter/material.dart';
import 'package:language_cards/src/pages/tenses/tense_description_page.dart';
import 'package:language_cards/src/widgets/tile_widget.dart';

class PastPage extends StatelessWidget {
  static final routeName = 'past'; 
  final TileView tile = TileView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:  0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Past Tenses",
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
          "Pasado Simple",
          "pasado_simple",
          Colors.orange,
          Icons.fast_rewind,
        ),
        tile.makeCard(
          context,
          "Pasado Continuo",
          "pasado_continuo",
          Colors.orange,
          Icons.fast_rewind,
        ),
        tile.makeCard(
          context,
          "Pasado Perfecto",
          "pasado_perfecto",
          Colors.orange,
          Icons.fast_rewind,
        ),
        tile.makeCard(
            context,
            "Pasado Perfecto Continuo",
            "pasado_perfecto_continuo",
            Colors.orange,
            Icons.fast_rewind),
      ],
    );
  }


}