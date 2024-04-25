import 'dart:async';
import 'package:bloctuto/counter_event.dart';

class CounterBloc {
  int _counter = 0; //Counter Variable

  //We will create a state controller which would be a stream controller (Controller de sorti d'après les explications)
  final _counterStateController = StreamController<int>(); //(ceci est un controller privé) 
  StreamSink<int> get _inCounter => _counterStateController.sink;  //(ceci est un controller privé)(entrée)
  Stream<int> get counter => _counterStateController.stream;  //(ceci est un controller public)(sortie) (permet d'écouter la valeur du compteur) (constitue un port de sortie)

  //On a aussi besoin de trouver une manière à l'interface utilisateur pour déclencher un évenement
  //pour décrémenter ou incrementer le compteur
  //Alors on va d'abort créer un stream controller qui va exposer cette fois ci, seulement le sink (le port d'entré)
  final _counterEventController = StreamController<CounterEvent>(); //(ceci est un controller privé) 
  StreamSink<CounterEvent> get _inCounterEvent => _counterEventController.sink;  //(ceci est un controller privé)(entrée)

}
