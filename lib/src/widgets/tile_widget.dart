import 'package:flutter/material.dart';
import 'package:language_cards/src/bloc/colletion_bloc.dart';
import 'package:language_cards/src/pages/tenses/tense_description_page.dart';

class TileView {
  final CollectionBloc collect = CollectionBloc();
  Card makeCard(BuildContext context, String title, String collection,
      Color color, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 11.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.8,
            color: color,
          ),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: listTile(context, title, collection, color, icon),
      ),
    );
  }

  ListTile listTile(BuildContext context, String title, String collection,
      Color color, IconData icon) {
    return ListTile(
      onTap: () {
        collect.setCollection(collection);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DescriptionPage(namePage: title,)),
        );
        print(title);
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.black26))),
        child: Icon(icon, color: color),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 20.0,
          letterSpacing: 2,
        ),
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color: color, size: 40.0),
    );
  }
}
