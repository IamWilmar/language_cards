import 'package:flutter/material.dart';
import 'package:language_cards/src/pages/tenses/tense_description_page.dart';
import 'package:language_cards/src/widgets/tile_widget.dart';

class PresentPage extends StatelessWidget {
  static final routeName = 'present';
  final TileView tile = TileView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
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
          "Presente Simple",
          "presente_simple",
          Colors.blue,
          Icons.airline_seat_individual_suite,
        ),
        tile.makeCard(
          context,
          "Presente Continuo",
          "presente_continuo",
          Colors.blue,
          Icons.airline_seat_individual_suite,
        ),
        tile.makeCard(
          context,
          "Presente Perfecto",
          "presente_perfecto",
          Colors.blue,
          Icons.airline_seat_individual_suite,
        ),
        tile.makeCard(
            context,
            "Presente Perfecto Continuo",
            "presente_perfecto_continuo",
            Colors.blue,
            Icons.airline_seat_individual_suite),
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        "Present Tenses",
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
