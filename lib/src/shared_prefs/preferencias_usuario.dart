import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  //Ninguna de estas propiedades se usa
  //con patron Singleton

  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();
  factory PreferenciasUsuario() {
    return _instancia;
  }
  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //GET y SET del Genero

  get word01 {
    return _prefs.getBool('word01') ?? true;
  }

  get word02 {
    return _prefs.getBool('word02') ?? false;
  }

  get word03 {
    return _prefs.getBool('word03') ?? false;
  }

  get word04 {
    return _prefs.getBool('word04') ?? false;
  }

  get word05 {
    return _prefs.getBool('word05') ?? false;
  }

  get word06 {
    return _prefs.getBool('word06') ?? false;
  }

  get word07 {
    return _prefs.getBool('word07') ?? false;
  }

  get word08 {
    return _prefs.getBool('word08') ?? false;
  }

  get word09 {
    return _prefs.getBool('word09') ?? false;
  }

  set word01(bool value) {
    print("setted");
    _prefs.setBool('word01', value);
  }

  set word02(bool value) {
    _prefs.setBool('word02', value);
  }

  set word03(bool value) {
    _prefs.setBool('word03', value);
  }

  set word04(bool value) {
    _prefs.setBool('word04', value);
  }

  set word05(bool value) {
    _prefs.setBool('word05', value);
  }

  set word06(bool value) {
    _prefs.setBool('word06', value);
  }

  set word07(bool value) {
    _prefs.setBool('word07', value);
  }

  set word08(bool value) {
    _prefs.setBool('word08', value);
  }

  set word09(bool value) {
    _prefs.setBool('word09', value);
  }

  // validator to reward ads
  get allWatched {
    return _prefs.getBool('allWatched') ?? false;
  }

  set allWatched( bool value) {
    _prefs.setBool('allWatched', value);
  }

}
