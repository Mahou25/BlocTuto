import 'dart:async';
import 'package:bloctuto/counter_event.dart';

class CounterBloc {
  int _counter = 0; //Counter Variable

  //We will create a state controller which would be a stream controller (Controller de sorti d'après les explications)
  final _counterStateController =
      StreamController<int>(); //(ceci est un controller privé)
  StreamSink<int> get _inCounter =>
      _counterStateController.sink; //(ceci est un controller privé)(entrée)
  Stream<int> get counter => _counterStateController
      .stream; //(ceci est un controller public)(sortie) (permet d'écouter la valeur du compteur) (constitue un port de sortie)

  //On a aussi besoin de trouver une manière à l'interface utilisateur pour déclencher un évenement
  //pour décrémenter ou incrementer le compteur
  //Alors on va d'abort créer un stream controller qui va exposer cette fois ci, seulement le sink (le port d'entré)
  final _counterEventController =
      StreamController<CounterEvent>(); //(ceci est un controller privé)

  Sink<CounterEvent> get counterEventSink =>
      _counterEventController.sink; //(ceci est un controller privé)(entrée)
  //Our UI will put event into the Event sink controller (increment event or a decrement event)

  //We know that our bloc is like a box which gets an event like input and return a state like output so
  //How to connect this event sink to the counter stream
  //Event comming to the sink (entrée) and counter value comming out from the stream(out)

  //In the constructor, we can listen to the counter event stream

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent)
      _counter++;
    else
      _counter--;

    _inCounter.add(_counter);
  }
}
