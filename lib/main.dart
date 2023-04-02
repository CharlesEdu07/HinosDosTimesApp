import 'package:flutter/material.dart';

void main() => runApp(AnthemsApp());

class AnthemsApp extends StatefulWidget {
  @override
  State<AnthemsApp> createState() => _AnthemsAppState();
}

class _AnthemsAppState extends State<AnthemsApp> {
  var _anthemIndex = 0;

  final Map anthems = {
    "Flamengo": "Uma vez Flamengo, sempre Flamengo. Flamengo eu sempre hei de ser",
    "Fluminense": "Sou tricolor de coração. Sou do clube tantas vezes campeão",
    "Vasco": "Vamos todos cantar de coração. A cruz de malta é o meu pendão",
    "Botafogo": "Botafogo, Botafogo, campeão, desde 1910",
  };

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
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: _previousAnthem,
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
                    onPressed: _nextAnthem,
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