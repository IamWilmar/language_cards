import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:language_cards/src/bloc/colletion_bloc.dart';
import 'package:language_cards/src/models/words_model.dart';
import 'package:language_cards/src/services/database.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:language_cards/src/services/admob_service.dart';

class WordCardsPage extends StatefulWidget {
  static final String routeName = 'wordsPage';

  @override
  _WordCardsPageState createState() => _WordCardsPageState();
}

class _WordCardsPageState extends State<WordCardsPage> {
  final List<Color> colorList = <Color>[
    Color(0xFFFF7725),
    Color(0xFF612CAD),
    Color(0xFFFFC308),
    Color(0xFF037171),
    Color(0xFF03312E),
    Color(0xFF8FB07D),
    Color(0xFFBE222E),
    Color(0xFF534D41),
    Color(0xFF3A606E),
    Color(0xFF8D6B94),
    Color(0xFFDAA2A1),
    Color(0xFF000000),
  ];

  final AdMobService admobService = AdMobService();

  @override
  void initState() {
    super.initState();
    Admob.initialize(admobService.getAdMobAppId());
  }

  final CollectionBloc collectionBloc = CollectionBloc();

  final DatabaseService fireStoreDb = DatabaseService();

  final CollectionReference wordsColletion =
      Firestore.instance.collection('words');

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final uid = '2XmHNv86ywSkzVltabDA';
    return StreamBuilder<String>(
        stream: collectionBloc.collectionStream,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          String collection = snapshot.data;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              title: Text(collection, style: Theme.of(context).textTheme.title),
            ),
            body: wordSwiper(uid, collection, _screenSize),
          );
        });
  }

  StreamBuilder<List<WordsModel>> wordSwiper(
      String uid, String collection, Size _screenSize) {
    return StreamBuilder<List<WordsModel>>(
      stream: fireStoreDb.obtenerPalabras(uid, collection),
      builder:
          (BuildContext context, AsyncSnapshot<List<WordsModel>> snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator(strokeWidth: 6.0));
        List<WordsModel> words = snapshot.data;
        return Stack(
          children: <Widget>[
            _swiperCard(words, _screenSize),
            _adBox(_screenSize),
          ],
        );
      },
    );
  }

  Container _adBox(Size _screenSize) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 3.0,
            offset: Offset(2.0, 10.0),
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 2, top: 5.0, bottom: 5.0, right: 9),
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      width: _screenSize.width * 1,
      height: _screenSize.height * 0.15,
      child: AdmobBanner(        
        adUnitId: admobService.getBannerAdId(),
        adSize: AdmobBannerSize.FULL_BANNER,
      ),
    );
  }

  Swiper _swiperCard(List<WordsModel> words, Size _screenSize) {
    return Swiper(
      viewportFraction: 4.0,
      layout: SwiperLayout.TINDER,
      itemCount: words.length,
      itemWidth: _screenSize.width * 1,
      itemHeight: _screenSize.height * 0.4,
      itemBuilder: (BuildContext context, int index) {
        return _cardContent(
          context,
          words,
          _screenSize,
          index,
        );
      },
    );
  }

  Widget _cardContent(BuildContext context, List<WordsModel> words,
      Size screenSize, int index) {
    int r = index;
    if (index > colorList.length - 1) {
      colorList.add(colorList[r = 0 + Random().nextInt(colorList.length - 0)]);
    } else {
      r = index;
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: GestureDetector(
        onTap: () {
          _mostrarSnackBar(context, words[index].wordEs, colorList[r]);
          print(r);
        },
        child: Container(
          decoration: BoxDecoration(
            color: colorList[r],
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 3.0,
                offset: Offset(2.0, 10.0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 10.0,
              runAlignment: WrapAlignment.start,
              runSpacing: 10.0,
              direction: Axis.vertical,
              children: <Widget>[
                Container(
                  width: screenSize.width * 0.85,
                  child: Text(
                    words[index].wordEn,
                    style: Theme.of(context).textTheme.subhead,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _mostrarSnackBar(BuildContext context, String wordEs, Color color) {
    final snackbar = SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
      ),
      elevation: 0.0,
      backgroundColor: color,
      content: Text(
        wordEs,
        style: Theme.of(context).textTheme.subhead,
        textAlign: TextAlign.center,
      ),
      duration: Duration(milliseconds: 1000),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
