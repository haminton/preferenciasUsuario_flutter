import 'package:flutter/material.dart';

import 'package:preferenciasusuarioapp/src/share_prefs/preferensias_usuario.dart';

import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routerName = 'home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    prefs.ulimaPagina = HomePage.routerName;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color segundario: ${ prefs.colorSecundario }'),
          Divider(),
          Text('Genero: ${ prefs.genero }'),
          Divider(),
          Text('Nombre usuario: ${ prefs.nombreUsuario }'),
          Divider(),
        ],
      ),
    );
  }

}