import 'dart:ui';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:language_cards/src/bloc/colletion_bloc.dart';
import 'package:language_cards/src/pages/word_cards_page.dart';
import 'package:language_cards/src/services/admob_service.dart';
import 'package:language_cards/src/shared_prefs/preferencias_usuario.dart';

class LessonsPage extends StatefulWidget {
  @override
  _LessonsPageState createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  final CollectionBloc collectionBloc = CollectionBloc();

  final PreferenciasUsuario userPrefs = PreferenciasUsuario();

  final AdMobService admobService = AdMobService();
  AdmobReward _rewardAd;

  @override
  void initState() {
    super.initState();
    Admob.initialize(admobService.getAdMobAppId());
    allAdsWached();
    setState(() {});
    if (userPrefs.allWatched == false) {
      _rewardAd = createAdvert();
      _rewardAd.load();
    }
  }

  AdmobReward createAdvert() {
    return AdmobReward(
      adUnitId: admobService.getRewardedBasedVideoAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) {
          setState(() {
            _rewardAd = createAdvert();
            _rewardAd.load();
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //_botonesRedondeados(context),
          SizedBox(height: 20),
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
          "Basico",
          'basic',
          0,
        ),
        _crearBotonRedondeado(
          context,
          Colors.orange,
          Icons.format_list_numbered,
          "Numeros",
          'numbers',
          1,
        ),
        _crearBotonRedondeado(
          context,
          Colors.purple,
          Icons.date_range,
          "Fechas",
          'dates',
          2,
        ),
        _crearBotonRedondeado(
          context,
          Colors.blue,
          Icons.people,
          "Profesiones",
          'professions',
          3,
        ),
        _crearBotonRedondeado(
          context,
          Colors.red,
          Icons.message,
          "Adjetivos",
          'adjectives',
          4,
        ),
        _crearBotonRedondeado(
          context,
          Colors.amber,
          Icons.people_outline,
          "Familia",
          'family',
          5,
        ),
        _crearBotonRedondeado(
          context,
          Colors.green,
          Icons.calendar_today,
          "Meses y Estaciones",
          'seasons',
          6,
        ),
        _crearBotonRedondeado(
          context,
          Colors.indigoAccent,
          Icons.home,
          "Mi Casa",
          'house',
          7,
        ),
        _crearBotonRedondeado(
          context,
          Colors.cyan,
          Icons.fastfood,
          "Comida",
          'food',
          8,
        ),
        SizedBox(height: 300)
      ],
    );
  }

  Widget _crearBotonRedondeado(BuildContext context, Color color, IconData icon,
      String texto, String collection, int unitNumber) {
    List<bool> state = [
      userPrefs.word01,
      userPrefs.word02,
      userPrefs.word03,
      userPrefs.word04,
      userPrefs.word05,
      userPrefs.word06,
      userPrefs.word07,
      userPrefs.word08,
      userPrefs.word09,
    ];
    if (userPrefs.allWatched == false) {
      _rewardAd = createAdvert();
      _rewardAd.load();
    }
    final _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        allAdsWached();
        if (state[unitNumber] == false) {
          print("hola");
          if (await _rewardAd.isLoaded) {
            print("ready");
            _rewardAd.show();
            setState(() {
              _valueChanger(unitNumber);
            });
          } else {
            print("is loading");
          }
        } else {
          print("item touched");
          collectionBloc.setCollection(collection);
          Navigator.pushNamed(context, WordCardsPage.routeName);
        }
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
                backgroundColor:
                    (state[unitNumber] == false) ? Colors.grey[400] : color,
                radius: 35.0,
                child: Icon(icon, color: Colors.white, size: 30.0),
              ),
              Text(
                texto,
                style: Theme.of(context).textTheme.button,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }

  void _valueChanger(int unitNumber) {
    switch (unitNumber) {
      case 0:
        userPrefs.word01 = true;
        break;
      case 1:
        userPrefs.word02 = true;
        break;
      case 2:
        userPrefs.word03 = true;
        break;
      case 3:
        userPrefs.word04 = true;
        break;
      case 4:
        userPrefs.word05 = true;
        break;
      case 5:
        userPrefs.word06 = true;
        break;
      case 6:
        userPrefs.word07 = true;
        break;
      case 7:
        userPrefs.word08 = true;
        break;
      case 8:
        userPrefs.word09 = true;

        break;

      default:
    }
  }

  void allAdsWached() {
    if (userPrefs.word01 == true &&
        userPrefs.word02 == true &&
        userPrefs.word03 == true &&
        userPrefs.word04 == true &&
        userPrefs.word05 == true &&
        userPrefs.word06 == true &&
        userPrefs.word07 == true &&
        userPrefs.word08 == true &&
        userPrefs.word09 == true) {
      userPrefs.allWatched = true;
    }
  }
}
