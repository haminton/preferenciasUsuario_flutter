import 'package:flutter/material.dart';

import 'package:preferenciasusuarioapp/src/share_prefs/preferensias_usuario.dart';

import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routerName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _textController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombreUsuario;
    _textController = new TextEditingController( text: _nombre );

  }

  _setSelectRadio( int value )  {

    prefs.genero = value;
    _genero = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    prefs.ulimaPagina = SettingsPage.routerName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,

      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Preferencias', 
              style: TextStyle(
                fontSize: 30.0, 
                fontWeight: FontWeight.bold,
                color: Colors.black54
              ),
            ),
          ),

          Divider(),

          SwitchListTile(
            value: _colorSecundario, 
            title: Text('Color segundario'),
            onChanged: ( value ) {
              setState(() {
                _colorSecundario = value;
                prefs.colorSecundario = value;
              });
            }
          ),

          RadioListTile(
            value: 1, 
            groupValue: _genero, 
            title: Text('Masculino'),
            onChanged: _setSelectRadio
          ),

          RadioListTile(
            value: 2, 
            groupValue: _genero, 
            title: Text('Femenino'),
            onChanged: _setSelectRadio
          ),

          Divider(),

          Container(
            padding: EdgeInsets.all(5.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono',
              ),
              onChanged: ( value ) {
                prefs.nombreUsuario = value;
              },
            ),
          )

        ],
      )
    );
  }
}