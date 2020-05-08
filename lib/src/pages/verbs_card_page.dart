import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:language_cards/src/bloc/colletion_bloc.dart';
import 'package:language_cards/src/models/verbs_model.dart';
import 'package:language_cards/src/services/admob_service.dart';
import 'package:language_cards/src/services/database.dart';

class VerbsCardPage extends StatefulWidget {
  static final String routeName = 'verbsCards';

  @override
  _VerbsCardPageState createState() => _VerbsCardPageState();
}

class _VerbsCardPageState extends State<VerbsCardPage> {
  final DatabaseService firestoreDb = DatabaseService();

  final uid = 'yE9F2SLjR9ryF5msZEEq';

  final CollectionBloc collectionBloc = CollectionBloc();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final AdMobService admobService = AdMobService();

  @override
  void initState() {
    super.initState();
    Admob.initialize(admobService.getAdMobAppId());
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return StreamBuilder<String>(
        stream: collectionBloc.collectionStream,
        builder: (context, AsyncSnapshot<String> snapshot) {
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
            body: _verbsCards(collection, _screenSize),
          );
        });
  }

  StreamBuilder<List<VerbsModel>> _verbsCards(
      String collection, Size _screenSize) {
    return StreamBuilder<List<VerbsModel>>(
      stream: firestoreDb.obtenerVerbos(uid, collection),
      builder:
          (BuildContext context, AsyncSnapshot<List<VerbsModel>> snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        List<VerbsModel> verbs = snapshot.data;
        return Stack(
          children: <Widget>[
            _swiperMethod(verbs, _screenSize),
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
      padding: EdgeInsets.only(left: 2, top: 5.0, bottom: 5.0, right: 10),
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      width: _screenSize.width * 1,
      height: _screenSize.height * 0.15,
      child: AdmobBanner(
        adUnitId: admobService.getBannerAdId(),
        adSize: AdmobBannerSize.FULL_BANNER,
      ),
    );
  }

  Swiper _swiperMethod(List<VerbsModel> verbs, Size _screenSize) {
    return Swiper(
      layout: SwiperLayout.STACK,
      itemCount: verbs.length,
      itemWidth: _screenSize.width * 0.9,
      itemHeight: _screenSize.height * 0.4,
      itemBuilder: (BuildContext context, int index) {
        return _cardContent(context, verbs, _screenSize, index);
      },
    );
  }

  Widget _cardContent(BuildContext context, List<VerbsModel> verbs,
      Size screenSize, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: GestureDetector(
        onTap: () {
          print("hola");
          _mostrarSnackBar(context, verbs[index].verbEs, Colors.black);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 10.0,
              runAlignment: WrapAlignment.start,
              runSpacing: 10.0,
              direction: Axis.vertical,
              children: <Widget>[
                _infinitive(screenSize, verbs, index, context),
                _simplePast(context, verbs, index),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Pasado Participio: ",
                      style: Theme.of(context).textTheme.display1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      verbs[index].pastParticiple,
                      style: Theme.of(context).textTheme.display1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _infinitive(Size screenSize, List<VerbsModel> verbs, int index,
      BuildContext context) {
    return Container(
      width: screenSize.width * 0.85,
      child: Text(
        verbs[index].infinitive,
        style: Theme.of(context).textTheme.subhead,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );
  }

  Row _simplePast(BuildContext context, List<VerbsModel> verbs, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Pasado Simple: ",
          style: Theme.of(context).textTheme.display1,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.start,
        ),
        Text(
          verbs[index].simplePast,
          style: Theme.of(context).textTheme.display1,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ],
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
