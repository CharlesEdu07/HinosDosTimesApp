import 'package:flutter/material.dart';

void main() => runApp(AnthemsApp());

class AnthemsApp extends StatefulWidget {
  @override
  State<AnthemsApp> createState() => _AnthemsAppState();
}

class _AnthemsAppState extends State<AnthemsApp> {
  var _anthemIndex = 0;
  var _shieldIndex = 0;

  final Map anthems = {
    "Flamengo": "Uma vez Flamengo, sempre Flamengo. Flamengo eu sempre hei de ser",
    "Fluminense": "Sou tricolor de coração. Sou do clube tantas vezes campeão",
    "Vasco": "Vamos todos cantar de coração. A cruz de malta é o meu pendão",
    "Botafogo": "Botafogo, Botafogo, campeão, desde 1910",
  };

  final List shield = [
    'https://imagepng.org/wp-content/uploads/2018/02/escudo-flamengo.png',
    'https://upload.wikimedia.org/wikipedia/commons/a/ad/Fluminense_FC_escudo.png',
    'https://static.dicionariodesimbolos.com.br/upload/60/81/conheca-o-significado-do-escudo-do-vasco-da-gama-5_xl.png',
    'https://upload.wikimedia.org/wikipedia/commons/c/cb/Escudo_Botafogo.png',
  ];

  void _nextAnthem() {
    setState(() {
      if (_anthemIndex < anthems.length - 1) {
        _anthemIndex++;
      } else {
        _anthemIndex = 0;
      }
    });
  }

  void _previousAnthem() {
    setState(() {
      if (_anthemIndex > 0) {
        _anthemIndex--;
      } else {
        _anthemIndex = anthems.length - 1;
      }
    });
  }

  void _nextShield() {
    setState(() {
      if (_shieldIndex < shield.length - 1) {
        _shieldIndex++;
      } else {
        _shieldIndex = 0;
      }
    });
  }

  void _previousShield() {
    setState(() {
      if (_shieldIndex > 0) {
        _shieldIndex--;
      } else {
        _shieldIndex = shield.length - 1;
      }
    });
  }

  void _next() {
    _nextAnthem();
    _nextShield();
  }

  void _previous() {
    _previousAnthem();
    _previousShield();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hinos dos Times',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hinos dos Times'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  anthems.keys.elementAt(_anthemIndex),
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  anthems.values.elementAt(_anthemIndex),
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/loading.gif',
                  image: shield.elementAt(_shieldIndex),
                  width: 200,
                  height: 200,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: _previous,
                icon: Icon(Icons.arrow_back),
                label: Text('Anterior')
              ),
              ElevatedButton.icon(
                  onPressed: () => {},
                  icon: Icon(Icons.play_arrow),
                  label: Text('Play')
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                    onPressed: _next,
                    label: Text('Próximo'),
                    icon: Icon(Icons.arrow_back)
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}