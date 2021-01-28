import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  
  static final PreferenciasUsuario _intancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _intancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero (int value) {
    _prefs.setInt('genero', value);
  }

  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario (bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario (String value) {
    _prefs.setString('nombreUsuario', value);
  }

  get ulimaPagina {
    return _prefs.getString('ulimaPagina') ?? 'home';
  }

  set ulimaPagina (String value) {
    _prefs.setString('ulimaPagina', value);
  }

}